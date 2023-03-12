//
//  CitySelectorRouter.swift
//  faireWeather
//
//  Created by Matheus Weber on 11/03/23.
//

import RIBs

protocol CitySelectorInteractable: Interactable {
    var router: CitySelectorRouting? { get set }
    var listener: CitySelectorListener? { get set }
    func setLayout()
}

protocol CitySelectorViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class CitySelectorRouter: ViewableRouter<CitySelectorInteractable, CitySelectorViewControllable>, CitySelectorRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: CitySelectorInteractable, viewController: CitySelectorViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func setLayout() {
        interactor.setLayout()
    }
}
