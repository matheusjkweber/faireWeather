//
//  RootRouter.swift
//  faireWeather
//
//  Created by Matheus Weber on 11/03/23.
//

import RIBs

protocol RootInteractable: Interactable {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    func present(viewController: ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    override init(interactor: RootInteractable,
         viewController: RootViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }

    override func didLoad() {
        super.didLoad()
    }

    // MARK: - Private
}
