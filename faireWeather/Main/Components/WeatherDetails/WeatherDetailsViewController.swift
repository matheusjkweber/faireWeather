//
//  WeatherDetailsViewController.swift
//  faireWeather
//
//  Created by Matheus Weber on 11/03/23.
//

import RIBs
import RxSwift
import UIKit

protocol WeatherDetailsPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class WeatherDetailsViewController: UIViewController, WeatherDetailsPresentable, WeatherDetailsViewControllable {
    weak var listener: WeatherDetailsPresentableListener?
    private let mainView = WeatherDetailsView()
    
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
    
    func presentMainView() {
        mainView.setupLayout()
    }
}
