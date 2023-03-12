//
//  MainRouter.swift
//  faireWeather
//
//  Created by Matheus Weber on 11/03/23.
//

import RIBs

protocol MainInteractable: Interactable, CitySelectorListener, WeatherDisplayListener, WeatherDetailsListener {
    var router: MainRouting? { get set }
    var listener: MainListener? { get set }
    func loadComponentsFor(citySelectedView: CitySelectedView, weatherDisplayView: WeatherDisplayView, weatherDetailsView: WeatherDetailsView)
}

protocol MainViewControllable: ViewControllable {
    func present(viewController: ViewControllable)
}

final class MainRouter: ViewableRouter<MainInteractable, MainViewControllable>, MainRouting {

    init(interactor: MainInteractable,
                  viewController: MainViewControllable,
                  citySelectorRouter: CitySelectorRouting,
                  weatherDisplayRouter: WeatherDisplayRouting,
                  weatherDetailsRouter: WeatherDetailsRouting){
        self.citySelectorRouter = citySelectorRouter
        self.weatherDetailsRouter = weatherDetailsRouter
        self.weatherDisplayRouter = weatherDisplayRouter
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }

    override func didLoad() {
        super.didLoad()
        loadComponents()
    }
    
    func loadComponents() {
        attachChild(citySelectorRouter)
        attachChild(weatherDetailsRouter)
        attachChild(weatherDisplayRouter)
        
        if let cityView = citySelectorRouter.viewControllable.uiviewController.view as? CitySelectedView,
            let weatherDisplayView = weatherDisplayRouter.viewControllable.uiviewController.view as? WeatherDisplayView,
            let weatherDetailsView = weatherDetailsRouter.viewControllable.uiviewController.view as? WeatherDetailsView {
            interactor.loadComponentsFor(citySelectedView: cityView, weatherDisplayView: weatherDisplayView, weatherDetailsView: weatherDetailsView)
        }
        
    }
    
    //MARK: - Private
    let citySelectorRouter: CitySelectorRouting
    let weatherDisplayRouter: WeatherDisplayRouting
    let weatherDetailsRouter: WeatherDetailsRouting
}
