//
//  Mockables.swift
//  faireWeatherTests
//
//  Created by Matheus Weber on 12/03/23.
//

@testable import faireWeather
import RIBs
import RxSwift
import UIKit

class WeatherDetailsBuildableMock: WeatherDetailsBuildable {
    // Function Handlers
    var buildHandler: ((_ listener: WeatherDetailsListener) -> WeatherDetailsRouting)?
    var buildCallCount: Int = 0

    init() {
    }

    func build(withListener listener: WeatherDetailsListener) -> WeatherDetailsRouting {
        buildCallCount += 1
        if let buildHandler = buildHandler {
            return buildHandler(listener)
        }
        fatalError("Function build returns a value that can't be handled with a default value and its handler must be set")
    }
}

class WeatherDetailsInteractableMock: WeatherDetailsInteractable {
    // Variables
    var router: WeatherDetailsRouting? { didSet { routerSetCallCount += 1 } }
    var routerSetCallCount = 0
    var listener: WeatherDetailsListener? { didSet { listenerSetCallCount += 1 } }
    var listenerSetCallCount = 0
    var isActive: Bool = false { didSet { isActiveSetCallCount += 1 } }
    var isActiveSetCallCount = 0
    var isActiveStreamSubject: PublishSubject<Bool> = PublishSubject<Bool>() { didSet { isActiveStreamSubjectSetCallCount += 1 } }
    var isActiveStreamSubjectSetCallCount = 0
    var isActiveStream: Observable<Bool> { return isActiveStreamSubject }

    // Function Handlers
    var setLayoutHandler: (() -> ())?
    var setLayoutCallCount: Int = 0
    var activateHandler: (() -> ())?
    var activateCallCount: Int = 0
    var deactivateHandler: (() -> ())?
    var deactivateCallCount: Int = 0
    
    init() {
    }

    func activate() {
        activateCallCount += 1
        if let activateHandler = activateHandler {
            return activateHandler()
        }
    }

    func deactivate() {
        deactivateCallCount += 1
        if let deactivateHandler = deactivateHandler {
            return deactivateHandler()
        }
    }

    func setLayout() {
        setLayoutCallCount += 1
        if let setLayoutHandler = setLayoutHandler {
            return setLayoutHandler()
        }
    }
}

class WeatherDetailsRoutingMock: WeatherDetailsRouting {
    var viewControllable: RIBs.ViewControllable
    
    // Variables
    var interactable: Interactable { didSet { interactableSetCallCount += 1 } }
    var interactableSetCallCount = 0
    var children: [Routing] = [Routing]() { didSet { childrenSetCallCount += 1 } }
    var childrenSetCallCount = 0
    var lifecycleSubject: PublishSubject<RouterLifecycle> = PublishSubject<RouterLifecycle>() { didSet { lifecycleSubjectSetCallCount += 1 } }
    var lifecycleSubjectSetCallCount = 0
    var lifecycle: Observable<RouterLifecycle> { return lifecycleSubject }

    // Function Handlers
    var cleanupViewsHandler: (() -> ())?
    var cleanupViewsCallCount: Int = 0
    var loadHandler: (() -> ())?
    var loadCallCount: Int = 0
    var attachChildHandler: ((_ child: Routing) -> ())?
    var attachChildCallCount: Int = 0
    var detachChildHandler: ((_ child: Routing) -> ())?
    var detachChildCallCount: Int = 0
    var setLayoutHandler: (() -> ())?
    var setLayoutCallCount: Int = 0

    init(interactable: Interactable,
         viewControllable: WeatherDetailsViewControllable) {
        self.interactable = interactable
        self.viewControllable = viewControllable
    }

    func cleanupViews() {
        cleanupViewsCallCount += 1
        if let cleanupViewsHandler = cleanupViewsHandler {
            return cleanupViewsHandler()
        }
    }

    func load() {
        loadCallCount += 1
        if let loadHandler = loadHandler {
            return loadHandler()
        }
    }

    func attachChild(_ child: Routing) {
        attachChildCallCount += 1
        if let attachChildHandler = attachChildHandler {
            return attachChildHandler(child)
        }
    }

    func detachChild(_ child: Routing) {
        detachChildCallCount += 1
        if let detachChildHandler = detachChildHandler {
            return detachChildHandler(child)
        }
    }
    
    func setLayout() {
        setLayoutCallCount += 1
        if let setLayoutHandler = setLayoutHandler {
            setLayoutHandler()
        }
    }
}

class WeatherDisplayBuildableMock: WeatherDisplayBuildable {
    // Function Handlers
    var buildHandler: ((_ listener: WeatherDisplayListener) -> WeatherDisplayRouting)?
    var buildCallCount: Int = 0

    init() {
    }

    func build(withListener listener: WeatherDisplayListener) -> WeatherDisplayRouting {
        buildCallCount += 1
        if let buildHandler = buildHandler {
            return buildHandler(listener)
        }
        fatalError("Function build returns a value that can't be handled with a default value and its handler must be set")
    }
}

class WeatherDisplayInteractableMock: WeatherDisplayInteractable {
    // Variables
    var router: WeatherDisplayRouting? { didSet { routerSetCallCount += 1 } }
    var routerSetCallCount = 0
    var listener: WeatherDisplayListener? { didSet { listenerSetCallCount += 1 } }
    var listenerSetCallCount = 0
    var isActive: Bool = false { didSet { isActiveSetCallCount += 1 } }
    var isActiveSetCallCount = 0
    var isActiveStreamSubject: PublishSubject<Bool> = PublishSubject<Bool>() { didSet { isActiveStreamSubjectSetCallCount += 1 } }
    var isActiveStreamSubjectSetCallCount = 0
    var isActiveStream: Observable<Bool> { return isActiveStreamSubject }

    // Function Handlers
    var setLayoutHandler: (() -> ())?
    var setLayoutCallCount: Int = 0
    var activateHandler: (() -> ())?
    var activateCallCount: Int = 0
    var deactivateHandler: (() -> ())?
    var deactivateCallCount: Int = 0
    
    init() {
    }

    func activate() {
        activateCallCount += 1
        if let activateHandler = activateHandler {
            return activateHandler()
        }
    }

    func deactivate() {
        deactivateCallCount += 1
        if let deactivateHandler = deactivateHandler {
            return deactivateHandler()
        }
    }

    func setLayout() {
        setLayoutCallCount += 1
        if let setLayoutHandler = setLayoutHandler {
            return setLayoutHandler()
        }
    }
}

class WeatherDisplayRoutingMock: WeatherDisplayRouting {
    var viewControllable: RIBs.ViewControllable
    
    // Variables
    var interactable: Interactable { didSet { interactableSetCallCount += 1 } }
    var interactableSetCallCount = 0
    var children: [Routing] = [Routing]() { didSet { childrenSetCallCount += 1 } }
    var childrenSetCallCount = 0
    var lifecycleSubject: PublishSubject<RouterLifecycle> = PublishSubject<RouterLifecycle>() { didSet { lifecycleSubjectSetCallCount += 1 } }
    var lifecycleSubjectSetCallCount = 0
    var lifecycle: Observable<RouterLifecycle> { return lifecycleSubject }

    // Function Handlers
    var cleanupViewsHandler: (() -> ())?
    var cleanupViewsCallCount: Int = 0
    var loadHandler: (() -> ())?
    var loadCallCount: Int = 0
    var attachChildHandler: ((_ child: Routing) -> ())?
    var attachChildCallCount: Int = 0
    var detachChildHandler: ((_ child: Routing) -> ())?
    var detachChildCallCount: Int = 0
    var setLayoutHandler: (() -> ())?
    var setLayoutCallCount: Int = 0

    init(interactable: Interactable,
         viewControllable: WeatherDisplayViewControllable) {
        self.interactable = interactable
        self.viewControllable = viewControllable
    }

    func cleanupViews() {
        cleanupViewsCallCount += 1
        if let cleanupViewsHandler = cleanupViewsHandler {
            return cleanupViewsHandler()
        }
    }

    func load() {
        loadCallCount += 1
        if let loadHandler = loadHandler {
            return loadHandler()
        }
    }

    func attachChild(_ child: Routing) {
        attachChildCallCount += 1
        if let attachChildHandler = attachChildHandler {
            return attachChildHandler(child)
        }
    }

    func detachChild(_ child: Routing) {
        detachChildCallCount += 1
        if let detachChildHandler = detachChildHandler {
            return detachChildHandler(child)
        }
    }
    
    func setLayout() {
        setLayoutCallCount += 1
        if let setLayoutHandler = setLayoutHandler {
            setLayoutHandler()
        }
    }
}

class CitySelectorBuildableMock: CitySelectorBuildable {
    // Function Handlers
    var buildHandler: ((_ listener: CitySelectorListener) -> CitySelectorRouting)?
    var buildCallCount: Int = 0

    init() {
    }

    func build(withListener listener: CitySelectorListener) -> CitySelectorRouting {
        buildCallCount += 1
        if let buildHandler = buildHandler {
            return buildHandler(listener)
        }
        fatalError("Function build returns a value that can't be handled with a default value and its handler must be set")
    }
}

class CitySelectorInteractableMock: CitySelectorInteractable {
    // Variables
    var router: CitySelectorRouting? { didSet { routerSetCallCount += 1 } }
    var routerSetCallCount = 0
    var listener: CitySelectorListener? { didSet { listenerSetCallCount += 1 } }
    var listenerSetCallCount = 0
    var isActive: Bool = false { didSet { isActiveSetCallCount += 1 } }
    var isActiveSetCallCount = 0
    var isActiveStreamSubject: PublishSubject<Bool> = PublishSubject<Bool>() { didSet { isActiveStreamSubjectSetCallCount += 1 } }
    var isActiveStreamSubjectSetCallCount = 0
    var isActiveStream: Observable<Bool> { return isActiveStreamSubject }

    // Function Handlers
    var setLayoutHandler: (() -> ())?
    var setLayoutCallCount: Int = 0
    var activateHandler: (() -> ())?
    var activateCallCount: Int = 0
    var deactivateHandler: (() -> ())?
    var deactivateCallCount: Int = 0
    
    init() {
    }

    func activate() {
        activateCallCount += 1
        if let activateHandler = activateHandler {
            return activateHandler()
        }
    }

    func deactivate() {
        deactivateCallCount += 1
        if let deactivateHandler = deactivateHandler {
            return deactivateHandler()
        }
    }

    func setLayout() {
        setLayoutCallCount += 1
        if let setLayoutHandler = setLayoutHandler {
            return setLayoutHandler()
        }
    }
}

class CitySelectorRoutingMock: CitySelectorRouting {
    var viewControllable: RIBs.ViewControllable
    
    // Variables
    var interactable: Interactable { didSet { interactableSetCallCount += 1 } }
    var interactableSetCallCount = 0
    var children: [Routing] = [Routing]() { didSet { childrenSetCallCount += 1 } }
    var childrenSetCallCount = 0
    var lifecycleSubject: PublishSubject<RouterLifecycle> = PublishSubject<RouterLifecycle>() { didSet { lifecycleSubjectSetCallCount += 1 } }
    var lifecycleSubjectSetCallCount = 0
    var lifecycle: Observable<RouterLifecycle> { return lifecycleSubject }

    // Function Handlers
    var cleanupViewsHandler: (() -> ())?
    var cleanupViewsCallCount: Int = 0
    var loadHandler: (() -> ())?
    var loadCallCount: Int = 0
    var attachChildHandler: ((_ child: Routing) -> ())?
    var attachChildCallCount: Int = 0
    var detachChildHandler: ((_ child: Routing) -> ())?
    var detachChildCallCount: Int = 0
    var setLayoutHandler: (() -> ())?
    var setLayoutCallCount: Int = 0

    init(interactable: Interactable,
         viewControllable: CitySelectorViewControllable) {
        self.interactable = interactable
        self.viewControllable = viewControllable
    }

    func cleanupViews() {
        cleanupViewsCallCount += 1
        if let cleanupViewsHandler = cleanupViewsHandler {
            return cleanupViewsHandler()
        }
    }

    func load() {
        loadCallCount += 1
        if let loadHandler = loadHandler {
            return loadHandler()
        }
    }

    func attachChild(_ child: Routing) {
        attachChildCallCount += 1
        if let attachChildHandler = attachChildHandler {
            return attachChildHandler(child)
        }
    }

    func detachChild(_ child: Routing) {
        detachChildCallCount += 1
        if let detachChildHandler = detachChildHandler {
            return detachChildHandler(child)
        }
    }
    
    func setLayout() {
        setLayoutCallCount += 1
        if let setLayoutHandler = setLayoutHandler {
            setLayoutHandler()
        }
    }
}

class MainBuildableMock: MainBuildable {
    // Function Handlers
    var buildHandler: (() -> MainRouting)?
    var buildCallCount: Int = 0

    init() {
    }

    func build() -> MainRouting {
        buildCallCount += 1
        if let buildHandler = buildHandler {
            return buildHandler()
        }
        fatalError("Function build returns a value that can't be handled with a default value and its handler must be set")
    }
}

class MainInteractableMock: MainInteractable {
    // Variables
    var router: MainRouting? { didSet { routerSetCallCount += 1 } }
    var routerSetCallCount = 0
    var listener: MainListener? { didSet { listenerSetCallCount += 1 } }
    var listenerSetCallCount = 0
    var isActive: Bool = false { didSet { isActiveSetCallCount += 1 } }
    var isActiveSetCallCount = 0
    var isActiveStreamSubject: PublishSubject<Bool> = PublishSubject<Bool>() { didSet { isActiveStreamSubjectSetCallCount += 1 } }
    var isActiveStreamSubjectSetCallCount = 0
    var isActiveStream: Observable<Bool> { return isActiveStreamSubject }

    // Function Handlers
    var activateHandler: (() -> ())?
    var activateCallCount: Int = 0
    var deactivateHandler: (() -> ())?
    var deactivateCallCount: Int = 0
    var loadComponentsForCallCount: Int = 0
    var loadComponentsForHandler: ((CitySelectedView, WeatherDisplayView, WeatherDetailsView) -> ())?
    
    init() {
    }

    func activate() {
        activateCallCount += 1
        if let activateHandler = activateHandler {
            return activateHandler()
        }
    }

    func deactivate() {
        deactivateCallCount += 1
        if let deactivateHandler = deactivateHandler {
            return deactivateHandler()
        }
    }
    
    func loadComponentsFor(citySelectedView: CitySelectedView, weatherDisplayView: WeatherDisplayView, weatherDetailsView: WeatherDetailsView) {
        loadComponentsForCallCount += 1
        if let loadComponentsForHandler = loadComponentsForHandler {
            loadComponentsForHandler(citySelectedView, weatherDisplayView, weatherDetailsView)
        }
    }
}

class MainRoutingMock: MainRouting {
    var viewControllable: RIBs.ViewControllable
    
    // Variables
    var interactable: Interactable { didSet { interactableSetCallCount += 1 } }
    var interactableSetCallCount = 0
    var children: [Routing] = [Routing]() { didSet { childrenSetCallCount += 1 } }
    var childrenSetCallCount = 0
    var lifecycleSubject: PublishSubject<RouterLifecycle> = PublishSubject<RouterLifecycle>() { didSet { lifecycleSubjectSetCallCount += 1 } }
    var lifecycleSubjectSetCallCount = 0
    var lifecycle: Observable<RouterLifecycle> { return lifecycleSubject }

    // Function Handlers
    var cleanupViewsHandler: (() -> ())?
    var cleanupViewsCallCount: Int = 0
    var loadHandler: (() -> ())?
    var loadCallCount: Int = 0
    var attachChildHandler: ((_ child: Routing) -> ())?
    var attachChildCallCount: Int = 0
    var detachChildHandler: ((_ child: Routing) -> ())?
    var detachChildCallCount: Int = 0
   
    init(interactable: Interactable,
         viewControllable: CitySelectorViewControllable) {
        self.interactable = interactable
        self.viewControllable = viewControllable
    }

    func cleanupViews() {
        cleanupViewsCallCount += 1
        if let cleanupViewsHandler = cleanupViewsHandler {
            return cleanupViewsHandler()
        }
    }

    func load() {
        loadCallCount += 1
        if let loadHandler = loadHandler {
            return loadHandler()
        }
    }

    func attachChild(_ child: Routing) {
        attachChildCallCount += 1
        if let attachChildHandler = attachChildHandler {
            return attachChildHandler(child)
        }
    }

    func detachChild(_ child: Routing) {
        detachChildCallCount += 1
        if let detachChildHandler = detachChildHandler {
            return detachChildHandler(child)
        }
    }
}

class MainServicingMock: MainServicing {
    // Function Handlers
    var getMainWeatherHandler: ((Int, (MainWeatherModel) -> (), (NetworkResponse) -> ()) -> ())?
    var getMainWeatherCallCount: Int = 0
    var getImageHandler: ((String, (Data) -> (), (NetworkResponse) -> ()) -> ())?
    var getImageCallCount: Int = 0
    
    func getMainWeather(id: Int,
                        success: @escaping (_ weatherModel: MainWeatherModel) -> (),
                        failure: @escaping (_ error: NetworkResponse) -> ()) {
        getMainWeatherCallCount += 1
        if let getMainWeatherHandler = getMainWeatherHandler {
            getMainWeatherHandler(id, success, failure)
        }
    }
    
    func getImage(imageURL: String,
                  success: @escaping (_ imageData: Data) -> (),
                  failure: @escaping (_ error: NetworkResponse) -> ()) {
        getImageCallCount += 1
        if let getImageHandler = getImageHandler {
            getImageHandler(imageURL, success, failure)
        }
    }
}
