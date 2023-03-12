//
//  MainRouterTests.swift
//  faireWeatherTests
//
//  Created by Matheus Weber on 12/03/23.
//

@testable import faireWeather
import RIBs
import Foundation
import XCTest


final class MainRouterTests: XCTestCase {
    private var router: MainRouter!
    private var interactor: MainInteractor!
    private var listener = MainListenerMock()
    private var presenter = MainPresentableMock()
    private var service = MainServicingMock()
    private var viewcontroller = MainViewController()
    private var cityPresenter = CitySelectorPresentableMock()
    private var citySelectorViewcontroller = CitySelectorViewController()
    private var weatherDisplayPresenter = WeatherDisplayPresentableMock()
    private var weatherDisplayViewcontroller = WeatherDisplayViewController()
    private var weatherDetailsPresenter = WeatherDetailsPresentableMock()
    private var weatherDetailsViewcontroller = WeatherDetailsViewController()
    
    override func setUp() {
        super.setUp()
        let citySelectorRouter = CitySelectorRouter(interactor: CitySelectorInteractor(presenter: cityPresenter), viewController: citySelectorViewcontroller)
        let weatherDisplayRouter = WeatherDisplayRouter(interactor: WeatherDisplayInteractor(presenter: weatherDisplayPresenter), viewController: weatherDisplayViewcontroller)
        let weatherDetailsRouter = WeatherDetailsRouter(interactor: WeatherDetailsInteractor(presenter: weatherDetailsPresenter), viewController: weatherDetailsViewcontroller)
        
        interactor = MainInteractor(presenter: presenter, mainService: service)
        router = MainRouter(interactor: interactor,
                            viewController: viewcontroller,
                            citySelectorRouter: citySelectorRouter,
                            weatherDisplayRouter: weatherDisplayRouter,
                            weatherDetailsRouter: weatherDetailsRouter)
    }
    
    func test_load_shouldAttachChildren() {
        router.load()
        
        XCTAssertEqual(router.children.count, 3)
    }
    
    func test_loadWithMainWeatherHandlerSuccess_shouldCallPresenterMethods() {
        let exp = expectation(description: "\(#function)\(#line)")
        service.getMainWeatherHandler = { _, success, _ in
            success(MainWeatherModel.returnMock())
        }
        presenter.hideLoadingHandler = {
            exp.fulfill()
        }
        
        router.load()
        
        waitForExpectations(timeout: 40, handler: nil)
        XCTAssertEqual(self.presenter.presentLoadingCount, 1)
        XCTAssertEqual(self.presenter.presentCount, 3)
        XCTAssertEqual(self.presenter.hideLoadingCount, 1)
    }
    
    func test_loadWithGetImageHandlerSuccess_shouldCallPresenterMethods() {
        let exp = expectation(description: "\(#function)\(#line)")
        service.getMainWeatherHandler = { _, success, _ in
            success(MainWeatherModel.returnMock())
        }
        service.getImageHandler = { _, success, _ in
            success(Data())
        }
        presenter.hideLoadingHandler = {
            exp.fulfill()
        }
        
        router.load()
        
        waitForExpectations(timeout: 40, handler: nil)
        XCTAssertEqual(self.presenter.presentLoadingCount, 1)
        XCTAssertEqual(self.presenter.presentCount, 6)
        XCTAssertEqual(self.presenter.hideLoadingCount, 1)
    }
    
    func test_loadWithMainWeatherHandlerError_shouldCallPresenterMethods() {
        let exp = expectation(description: "\(#function)\(#line)")
        service.getMainWeatherHandler = { _, _, error in
            error(.testError)
        }
        presenter.hideLoadingHandler = {
            exp.fulfill()
        }
        
        router.load()
        
        waitForExpectations(timeout: 40, handler: nil)
        XCTAssertEqual(self.presenter.presentLoadingCount, 1)
        XCTAssertEqual(self.presenter.presentErrorCount, 1)
        XCTAssertEqual(self.presenter.hideLoadingCount, 1)
    }
    
    func test_loadWithGetImageHandlerError_shouldCallPresenterMethods() {
        let exp = expectation(description: "\(#function)\(#line)")
        service.getMainWeatherHandler = { _, _, error in
            error(.testError)
        }
        service.getImageHandler = { _, _, error in
            error(.testError)
        }
        presenter.hideLoadingHandler = {
            exp.fulfill()
        }
        
        router.load()
        
        waitForExpectations(timeout: 40, handler: nil)
        XCTAssertEqual(self.presenter.presentLoadingCount, 1)
        XCTAssertEqual(self.presenter.presentErrorCount, 1)
        XCTAssertEqual(self.presenter.hideLoadingCount, 1)
    }
    
    func test_loadWithMainWeatherHandlerSuccessGetImageHandlerError_shouldCallPresenterMethods() {
        let exp = expectation(description: "\(#function)\(#line)")
        service.getMainWeatherHandler = { _, success, _ in
            success(MainWeatherModel.returnMock())
        }
        service.getImageHandler = { _, _, error in
            error(.testError)
        }
        presenter.hideLoadingHandler = {
            exp.fulfill()
        }
        
        router.load()
        
        waitForExpectations(timeout: 40, handler: nil)
        XCTAssertEqual(self.presenter.presentLoadingCount, 1)
        XCTAssertEqual(self.presenter.presentErrorCount, 1)
        XCTAssertEqual(self.presenter.hideLoadingCount, 1)
    }
}
