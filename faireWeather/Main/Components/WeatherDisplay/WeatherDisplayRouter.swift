//
//  WeatherDisplayRouter.swift
//  faireWeather
//
//  Created by Matheus Weber on 11/03/23.
//

import RIBs

protocol WeatherDisplayInteractable: Interactable {
    var router: WeatherDisplayRouting? { get set }
    var listener: WeatherDisplayListener? { get set }
    func setLayout()
}

protocol WeatherDisplayViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class WeatherDisplayRouter: ViewableRouter<WeatherDisplayInteractable, WeatherDisplayViewControllable>, WeatherDisplayRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: WeatherDisplayInteractable, viewController: WeatherDisplayViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func setLayout() {
        interactor.setLayout()
    }
}
