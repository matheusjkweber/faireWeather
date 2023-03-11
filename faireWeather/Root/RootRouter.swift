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
    func addSubview(view: UIView)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    init(interactor: RootInteractable,
                  viewController: RootViewControllable,
                  mainBuilder: MainBuildable) {
        self.mainBuilder = mainBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }

    override func didLoad() {
        super.didLoad()
        routeToMain()
    }
    
    private func routeToMain() {
        let mainRouter = mainBuilder.build()
        attachChild(mainRouter)
        viewController.addSubview(view: mainRouter.viewControllable.uiviewController.view)
    }
    

    // MARK: - Private
    let mainBuilder: MainBuildable
}
