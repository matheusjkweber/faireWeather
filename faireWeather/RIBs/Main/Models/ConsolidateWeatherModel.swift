//
//  ConsolidateWeather.swift
//  faireWeather
//
//  Created by Matheus Weber on 12/03/23.
//

struct ConsolidateWeatherModel: Codable {
    var id: Int
    var weatherStateName: String
    var weatherStateAbbr: String
    var windDirectionCompass: String
    var created: String
    var applicableDate: String
    var minTemp: Float
    var maxTemp: Float
    var theTemp: Float
    var windSpeed: Float
    var windDirection: Float
    var airPressure: Float
    var humidity: Int
    var visibility: Float
    var predictability: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case weatherStateName = "weather_state_name"
        case weatherStateAbbr = "weather_state_abbr"
        case windDirectionCompass = "wind_direction_compass"
        case created
        case applicableDate = "applicable_date"
        case minTemp = "min_temp"
        case maxTemp = "max_temp"
        case theTemp = "the_temp"
        case windSpeed = "wind_speed"
        case windDirection = "wind_direction"
        case airPressure = "air_pressure"
        case humidity
        case visibility
        case predictability
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.weatherStateName = try container.decode(String.self, forKey: .weatherStateName)
        self.weatherStateAbbr = try container.decode(String.self, forKey: .weatherStateAbbr)
        self.windDirectionCompass = try container.decode(String.self, forKey: .windDirectionCompass)
        self.created = try container.decode(String.self, forKey: .created)
        self.applicableDate = try container.decode(String.self, forKey: .applicableDate)
        self.minTemp = try container.decode(Float.self, forKey: .minTemp)
        self.maxTemp = try container.decode(Float.self, forKey: .maxTemp)
        self.theTemp = try container.decode(Float.self, forKey: .theTemp)
        self.windSpeed = try container.decode(Float.self, forKey: .windSpeed)
        self.windDirection = try container.decode(Float.self, forKey: .windDirection)
        self.airPressure = try container.decode(Float.self, forKey: .airPressure)
        self.humidity = try container.decode(Int.self, forKey: .humidity)
        self.visibility = try container.decode(Float.self, forKey: .visibility)
        self.predictability = try container.decode(Int.self, forKey: .predictability)
    }
}
