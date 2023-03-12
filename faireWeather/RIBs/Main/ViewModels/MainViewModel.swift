//
//  MainViewModel.swift
//  faireWeather
//
//  Created by Matheus Weber on 12/03/23.
//

import UIKit

public final class MainViewModel {
    var weatherImage: UIImage?
    let cityName: String
    let temperature: String
    let lowerTemp: String
    let higherTemp: String
    let descriptionText: String
    
    init(weatherImage: UIImage?, cityName: String, temperature: String, descriptionText: String, lowerTemp: String, higherTemp: String) {
        self.cityName = cityName
        self.temperature = temperature
        self.lowerTemp = lowerTemp
        self.higherTemp = higherTemp
        self.descriptionText = descriptionText
        self.weatherImage = weatherImage
    }
    
    init(from mainWeatherModel: MainWeatherModel, weatherImage: UIImage?) {
        self.cityName = mainWeatherModel.title
        self.temperature = "\(mainWeatherModel.consolidatedWeather.first?.theTemp ?? 0.0)"
        self.higherTemp = "\(mainWeatherModel.consolidatedWeather.first?.maxTemp ?? 0.0)"
        self.lowerTemp = "\(mainWeatherModel.consolidatedWeather.first?.minTemp ?? 0.0)"
        self.descriptionText = "\(mainWeatherModel.consolidatedWeather.first?.weatherStateName ?? "")"
        self.weatherImage = weatherImage
    }
    
    func mountComponents(citySelectedView: CitySelectedView,
                         weatherDisplayView: WeatherDisplayView,
                         weatherDetailsView: WeatherDetailsView) -> [SetuppableView] {
        citySelectedView.setup(titleText: cityName)
        weatherDisplayView.setup(weatherImage: weatherImage, tempText: temperature, descriptionText: descriptionText)
        weatherDetailsView.setup(lowerText: lowerTemp, higherText: higherTemp)
        
        return [citySelectedView, weatherDisplayView, weatherDetailsView]
    }
}
