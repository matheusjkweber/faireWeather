//
//  WeatherDetailsBuilder.swift
//  faireWeather
//
//  Created by Matheus Weber on 11/03/23.
//

import RIBs

protocol WeatherDetailsDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class WeatherDetailsComponent: Component<WeatherDetailsDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol WeatherDetailsBuildable: Buildable {
    func build(withListener listener: WeatherDetailsListener) -> WeatherDetailsRouting
}

final class WeatherDetailsBuilder: Builder<WeatherDetailsDependency>, WeatherDetailsBuildable {

    override init(dependency: WeatherDetailsDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: WeatherDetailsListener) -> WeatherDetailsRouting {
        _ = WeatherDetailsComponent(dependency: dependency)
        let viewController = WeatherDetailsViewController()
        let interactor = WeatherDetailsInteractor(presenter: viewController)
        interactor.listener = listener
        return WeatherDetailsRouter(interactor: interactor, viewController: viewController)
    }
}
