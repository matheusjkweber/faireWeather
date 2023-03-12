//
//  WeatherDisplayRouterTests.swift
//  faireWeatherTests
//
//  Created by Matheus Weber on 12/03/23.
//

@testable import faireWeather
import RIBs
import Foundation
import XCTest


final class WeatherDisplayRouterTests: XCTestCase {
    private var router: WeatherDisplayRouter!
    private var interactor: WeatherDisplayInteractor!
    private var listener = WeatherDisplayListenerMock()
    private var presenter = WeatherDisplayPresentableMock()
    private var viewcontroller = WeatherDisplayViewController()
    
    override func setUp() {
        super.setUp()
        interactor = WeatherDisplayInteractor(presenter: presenter)
        router = WeatherDisplayRouter(interactor: interactor, viewController: viewcontroller)
    }
    
    func test_setLayout_shouldCallPresenterMainView() {
        router.setLayout()
        
        XCTAssertEqual(presenter.presentMainViewCount, 1)
    }
}
