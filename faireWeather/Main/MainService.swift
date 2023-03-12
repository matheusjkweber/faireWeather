//
//  MainService.swift
//  faireWeather
//
//  Created by Matheus Weber on 12/03/23.
//

import Foundation

class MainService {
    let manager: NetworkManager
    
    init(manager: NetworkManager = NetworkManager(), dynamicUrl: String) {
        self.manager = manager
    }
    
    func getMainWeather(id: Int,
                        success: @escaping (_ notice: MainWeatherModel) -> (),
                        failure: @escaping (_ error: NetworkResponse) -> ()) {
        
        manager.request(request: FaireEndpoint.getDetails(id), success: { (response: MainWeatherModel) in
            success(response)
        }) { (error) in
            failure(error)
        }
    }
}
