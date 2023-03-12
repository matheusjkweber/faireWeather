//
//  MainService.swift
//  faireWeather
//
//  Created by Matheus Weber on 12/03/23.
//

import Foundation

class MainService: MainServicing {
    let manager: NetworkManager
    
    init(manager: NetworkManager) {
        self.manager = manager
    }
    
    func getMainWeather(id: Int,
                        success: @escaping (_ weatherModel: MainWeatherModel) -> (),
                        failure: @escaping (_ error: NetworkResponse) -> ()) {
        
        manager.request(request: FaireEndpoint.getDetails(id), success: { (response: MainWeatherModel) in
            success(response)
        }) { (error) in
            failure(error)
        }
    }
    
    func getImage(imageURL: String,
                  success: @escaping (_ imageData: Data) -> (),
                  failure: @escaping (_ error: NetworkResponse) -> ()) {
        manager.requestData(request: FaireEndpoint.getImage(imageURL), success: { (response: Data) in
            success(response)
        }) { (error) in
            failure(error)
        }
    }
}
