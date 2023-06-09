//
//  MainBuilder.swift
//  faireWeather
//
//  Created by Matheus Weber on 11/03/23.
//
import RIBs

protocol MainDependency: Dependency {
    var networkManager: NetworkManager {get set}
}

final class MainComponent: Component<MainDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder
protocol MainBuildable: Buildable {
    func build() -> MainRouting
}

final class MainBuilder: Builder<MainDependency>, MainBuildable {

    override init(dependency: MainDependency) {
        super.init(dependency: dependency)
    }

    func build() -> MainRouting {
        let component = MainComponent(dependency: dependency)
        let viewController = MainViewController()
        let service = MainService(manager: component.dependency.networkManager)
        let interactor = MainInteractor(presenter: viewController, mainService: service)
        let citySelectorRouter = CitySelectorBuilder(dependency: component).build(withListener: interactor)
        let weatherDisplayRouter = WeatherDisplayBuilder(dependency: component).build(withListener: interactor)
        let weatherDetailsRouter = WeatherDetailsBuilder(dependency: component).build(withListener: interactor)

        return MainRouter(interactor: interactor,
                          viewController: viewController,
                          citySelectorRouter: citySelectorRouter,
                          weatherDisplayRouter: weatherDisplayRouter,
                          weatherDetailsRouter: weatherDetailsRouter)
    }
}

