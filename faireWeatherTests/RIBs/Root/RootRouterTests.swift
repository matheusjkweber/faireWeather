//
//  RootRouterTests.swift
//  faireWeatherTests
//
//  Created by Matheus Weber on 12/03/23.
//

@testable import faireWeather
import RIBs
import Foundation
import XCTest


final class RootRouterTests: XCTestCase {
    private var router: RootRouter!
    private var interactor: RootInteractor!
    private var listener = RootListenerMock()
    private var presenter = RootPresentableMock()
    private var viewcontroller = RootViewController()
    private var mainBuilder = MainBuildableMock()
    private var mainInteractor: MainInteractor!
    private var mainViewController = MainViewController()
    private var mainPresenter = MainPresentableMock()
    private var service = MainServicingMock()
    private var mainRouter: MainRoutingMock!
    
    override func setUp() {
        super.setUp()
        interactor = RootInteractor(presenter: presenter)
        router = RootRouter(interactor: interactor, viewController: viewcontroller, mainBuilder: mainBuilder)
        mainInteractor = MainInteractor(presenter: mainPresenter, mainService: service)
        mainRouter = MainRoutingMock(interactable: mainInteractor, viewControllable: mainViewController)
    }
    
    func test_load_shouldCallMainBuilderAndAttachChid() {
        mainBuilder.buildHandler = {
            self.mainRouter
        }
        router.load()
        
        XCTAssertEqual(router.children.count, 1)
    }
}

