//
//  WeatherDisplayBuilder.swift
//  faireWeather
//
//  Created by Matheus Weber on 11/03/23.
//

import RIBs

protocol WeatherDisplayDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class WeatherDisplayComponent: Component<WeatherDisplayDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol WeatherDisplayBuildable: Buildable {
    func build(withListener listener: WeatherDisplayListener) -> WeatherDisplayRouting
}

final class WeatherDisplayBuilder: Builder<WeatherDisplayDependency>, WeatherDisplayBuildable {

    override init(dependency: WeatherDisplayDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: WeatherDisplayListener) -> WeatherDisplayRouting {
        _ = WeatherDisplayComponent(dependency: dependency)
        let viewController = WeatherDisplayViewController()
        let interactor = WeatherDisplayInteractor(presenter: viewController)
        interactor.listener = listener
        return WeatherDisplayRouter(interactor: interactor, viewController: viewController)
    }
}
