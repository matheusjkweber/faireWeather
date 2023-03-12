//
//  CitySelectorBuilder.swift
//  faireWeather
//
//  Created by Matheus Weber on 11/03/23.
//

import RIBs

protocol CitySelectorDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class CitySelectorComponent: Component<CitySelectorDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol CitySelectorBuildable: Buildable {
    func build(withListener listener: CitySelectorListener) -> CitySelectorRouting
}

final class CitySelectorBuilder: Builder<CitySelectorDependency>, CitySelectorBuildable {

    override init(dependency: CitySelectorDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: CitySelectorListener) -> CitySelectorRouting {
        _ = CitySelectorComponent(dependency: dependency)
        let viewController = CitySelectorViewController()
        let interactor = CitySelectorInteractor(presenter: viewController)
        interactor.listener = listener
        return CitySelectorRouter(interactor: interactor, viewController: viewController)
    }
}
