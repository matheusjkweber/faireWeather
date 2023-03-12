//
//  MainViewController.swift
//  faireWeather
//
//  Created by Matheus Weber on 11/03/23.
//

import RIBs
import SnapKit
import UIKit

protocol MainPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class MainViewController: UIViewController, MainPresentable, MainViewControllable {
    weak var listener: MainPresentableListener?
    private let mainView = MainView()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Method is not supported")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = mainView
        view.frame = CGRect(x: 0, y: 0, width: ScreenSize.width, height: ScreenSize.height)
    }

    // MARK: - MainViewControllable
    func present(viewController: ViewControllable) {
        present(viewController.uiviewController, animated: true, completion: nil)
    }
    
    func present(component: SetuppableView) {
        mainView.addComponent(view: component)
        component.setupLayout()
    }
    
    func cleanComponents() {
        mainView.removeComponents()
    }
    
    func presentLoading() {
        LoadingView.shared.showProgressView(self.mainView)
    }
    
    func presentError(message: String) {
        self.showMessage(message: message)
    }
    
    func hideLoading() {
        LoadingView.shared.hideProgressView()
    }
}
