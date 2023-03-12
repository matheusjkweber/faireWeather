//
//  CitySelectorRouterTestws.swift
//  faireWeatherTests
//
//  Created by Matheus Weber on 12/03/23.
//

@testable import faireWeather
import RIBs
import Foundation
import XCTest


final class CitySelectorRouterTests: XCTestCase {
    private var router: CitySelectorRouter!
    private var interactor: CitySelectorInteractor!
    private var listener = CitySelectorListenerMock()
    private var presenter = CitySelectorPresentableMock()
    private var viewcontroller = CitySelectorViewController()
    
    override func setUp() {
        super.setUp()
        interactor = CitySelectorInteractor(presenter: presenter)
        router = CitySelectorRouter(interactor: interactor, viewController: viewcontroller)
    }
    
    func test_setLayout_shouldCallPresenterMainView() {
        router.setLayout()
        
        XCTAssertEqual(presenter.presentMainViewCount, 1)
    }
}
