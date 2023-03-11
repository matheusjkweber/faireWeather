//
//  AppComponent.swift
//  faireWeather
//
//  Created by Matheus Weber on 11/03/23.
//

import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {

    init() {
        super.init(dependency: EmptyComponent())
    }
}
