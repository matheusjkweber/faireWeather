//
//  WeatherDisplayInteractor.swift
//  faireWeather
//
//  Created by Matheus Weber on 11/03/23.
//

import RIBs
import RxSwift

protocol WeatherDisplayRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func setLayout()
}

protocol WeatherDisplayPresentable: Presentable {
    var listener: WeatherDisplayPresentableListener? { get set }
    func presentMainView()
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol WeatherDisplayListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class WeatherDisplayInteractor: PresentableInteractor<WeatherDisplayPresentable>, WeatherDisplayInteractable, WeatherDisplayPresentableListener {

    weak var router: WeatherDisplayRouting?
    weak var listener: WeatherDisplayListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: WeatherDisplayPresentable) {
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
