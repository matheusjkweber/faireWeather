//
//  WeatherDetailsInteractor.swift
//  faireWeather
//
//  Created by Matheus Weber on 11/03/23.
//

import RIBs
import RxSwift

protocol WeatherDetailsRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func setLayout()
}

protocol WeatherDetailsPresentable: Presentable {
    var listener: WeatherDetailsPresentableListener? { get set }
    func presentMainView()
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol WeatherDetailsListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class WeatherDetailsInteractor: PresentableInteractor<WeatherDetailsPresentable>, WeatherDetailsInteractable, WeatherDetailsPresentableListener {

    weak var router: WeatherDetailsRouting?
    weak var listener: WeatherDetailsListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: WeatherDetailsPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    func setLayout() {
        presenter.presentMainView()
    }
}
