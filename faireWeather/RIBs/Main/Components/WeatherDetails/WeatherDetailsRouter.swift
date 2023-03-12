//
//  WeatherDetailsRouter.swift
//  faireWeather
//
//  Created by Matheus Weber on 11/03/23.
//

import RIBs

protocol WeatherDetailsInteractable: Interactable {
    var router: WeatherDetailsRouting? { get set }
    var listener: WeatherDetailsListener? { get set }
    func setLayout()
}

protocol WeatherDetailsViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class WeatherDetailsRouter: ViewableRouter<WeatherDetailsInteractable, WeatherDetailsViewControllable>, WeatherDetailsRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: WeatherDetailsInteractable, viewController: WeatherDetailsViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func setLayout() {
        interactor.setLayout()
    }
}
