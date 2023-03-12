//
//  MainInteractor.swift
//  faireWeather
//
//  Created by Matheus Weber on 11/03/23.
//

import RIBs
import RxSwift
import UIKit

protocol SetuppableView: UIView {
    func setupLayout()
}

protocol MainServicing {
    func getMainWeather(id: Int,
                             success: @escaping (_ weatherModel: MainWeatherModel) -> (),
                             failure: @escaping (_ error: NetworkResponse) -> ())
    func getImage(imageURL: String,
                  success: @escaping (_ imageData: Data) -> (),
                  failure: @escaping (_ error: NetworkResponse) -> ())
}

protocol MainRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol MainPresentable: Presentable {
    var listener: MainPresentableListener? { get set }
    func presentLoading()
    func hideLoading()
    func presentError(message: String)
    func present(component: SetuppableView)
    func cleanComponents()
}

protocol MainListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class MainInteractor: PresentableInteractor<MainPresentable>, MainInteractable, MainPresentableListener {
    let mainService: MainServicing
    var viewModel: MainViewModel?
    weak var router: MainRouting?

    weak var listener: MainListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(presenter: MainPresentable, mainService: MainServicing) {
        self.mainService = mainService
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }
    
    func loadComponentsFor(citySelectedView: CitySelectedView, weatherDisplayView: WeatherDisplayView, weatherDetailsView: WeatherDetailsView) {
        presenter.presentLoading()
        mainService.getMainWeather(id: Constants.cityId) { weatherModel in
            self.viewModel = MainViewModel(from: weatherModel, weatherImage: UIImage(named: Constants.defaultImage))
            self.loadComponents(citySelectedView: citySelectedView,
                                weatherDisplayView: weatherDisplayView,
                                weatherDetailsView: weatherDetailsView)
            self.loadImage(imageURL: weatherModel.consolidatedWeather.first?.weatherStateAbbr ?? "",
                           citySelectedView: citySelectedView,
                           weatherDisplayView: weatherDisplayView,
                           weatherDetailsView: weatherDetailsView)
        } failure: { error in
            DispatchQueue.main.async {
                self.presenter.presentError(message: error.rawValue)
            }
        }
        DispatchQueue.main.async {
            self.presenter.hideLoading()
        }
    }
    
    private func loadImage(imageURL: String, citySelectedView: CitySelectedView, weatherDisplayView: WeatherDisplayView, weatherDetailsView: WeatherDetailsView) {
        self.mainService.getImage(imageURL: imageURL) { imageData in
            self.viewModel?.weatherImage = UIImage(data: imageData)
            self.loadComponents(citySelectedView: citySelectedView, weatherDisplayView: weatherDisplayView, weatherDetailsView: weatherDetailsView)
        } failure: { error in
            DispatchQueue.main.async {
                self.presenter.presentError(message: error.rawValue)
            }
        }
    }
    
    private func loadComponents(citySelectedView: CitySelectedView, weatherDisplayView: WeatherDisplayView, weatherDetailsView: WeatherDetailsView) {
        DispatchQueue.main.async {
            self.presenter.cleanComponents()
            guard let viewModel = self.viewModel else {
                self.presenter.presentError(message: "Error loading screen.")
                return
            }
            for component in viewModel.mountComponents(citySelectedView: citySelectedView, weatherDisplayView: weatherDisplayView, weatherDetailsView: weatherDetailsView) {
                self.presenter.present(component: component)
            }
        }
    }
}
