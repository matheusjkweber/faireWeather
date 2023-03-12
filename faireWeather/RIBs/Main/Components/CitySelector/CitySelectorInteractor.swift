//
//  CitySelectorInteractor.swift
//  faireWeather
//
//  Created by Matheus Weber on 11/03/23.
//

import RIBs
import RxSwift

protocol CitySelectorRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func setLayout()
}

protocol CitySelectorPresentable: Presentable {
    var listener: CitySelectorPresentableListener? { get set }
    func presentMainView()
}

protocol CitySelectorListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class CitySelectorInteractor: PresentableInteractor<CitySelectorPresentable>, CitySelectorInteractable, CitySelectorPresentableListener {

    weak var router: CitySelectorRouting?
    weak var listener: CitySelectorListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: CitySelectorPresentable) {
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
