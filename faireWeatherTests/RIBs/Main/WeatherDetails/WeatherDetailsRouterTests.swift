//
//  WeatherDetailsRouterTests.swift
//  faireWeatherTests
//
//  Created by Matheus Weber on 12/03/23.
//

@testable import faireWeather
import RIBs
import Foundation
import XCTest


final class WeatherDetailsRouterTests: XCTestCase {
    private var router: WeatherDetailsRouter!
    private var interactor: WeatherDetailsInteractor!
    private var listener = WeatherDetailsListenerMock()
    private var presenter = WeatherDetailsPresentableMock()
    private var viewcontroller = WeatherDetailsViewController()
    
    override func setUp() {
        super.setUp()
        interactor = WeatherDetailsInteractor(presenter: presenter)
        router = WeatherDetailsRouter(interactor: interactor, viewController: viewcontroller)
    }
    
    func test_setLayout_shouldCallPresenterMainView() {
        router.setLayout()
        
        XCTAssertEqual(presenter.presentMainViewCount, 1)
    }
}
