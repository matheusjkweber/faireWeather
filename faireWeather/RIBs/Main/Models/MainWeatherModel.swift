//
//  MainWeatherModel.swift
//  faireWeather
//
//  Created by Matheus Weber on 12/03/23.
//

struct MainWeatherModel: Codable {
    var consolidatedWeather: [ConsolidateWeatherModel]
    var time: String
    var sunRise: String
    var sunSet: String
    var timezoneName: String
    var parent: ParentModel
    var sources: [SourceModel]
    var title: String
    var locationType: String
    var woeid: Int
    var latLong: String
    var timezone: String
    
    enum CodingKeys: String, CodingKey {
        case consolidatedWeather = "consolidated_weather"
        case time
        case sunRise = "sun_rise"
        case sunSet = "sun_set"
        case timezoneName = "timezone_name"
        case parent
        case sources
        case title
        case locationType = "location_type"
        case woeid
        case latLong = "latt_long"
        case timezone
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.consolidatedWeather = try container.decode([ConsolidateWeatherModel].self, forKey: .consolidatedWeather)
        self.time = try container.decode(String.self, forKey: .time)
        self.sunRise = try container.decode(String.self, forKey: .sunRise)
        self.sunSet = try container.decode(String.self, forKey: .sunSet)
        self.timezoneName = try container.decode(String.self, forKey: .timezoneName)
        self.parent = try container.decode(ParentModel.self, forKey: .parent)
        self.sources = try container.decode([SourceModel].self, forKey: .sources)
        self.title = try container.decode(String.self, forKey: .title)
        self.locationType = try container.decode(String.self, forKey: .locationType)
        self.woeid = try container.decode(Int.self, forKey: .woeid)
        self.latLong = try container.decode(String.self, forKey: .latLong)
        self.timezone = try container.decode(String.self, forKey: .timezone)
    }
    
    init(consolidatedWeather: [ConsolidateWeatherModel], time: String, sunRise: String, sunSet: String, timezoneName: String, parent: ParentModel, sources: [SourceModel], title: String, locationType: String, woeid: Int, latLong: String, timezone: String) {
        self.consolidatedWeather = consolidatedWeather
        self.time = time
        self.sunRise = sunRise
        self.sunSet = sunSet
        self.timezoneName = timezoneName
        self.parent = parent
        self.sources = sources
        self.title = title
        self.locationType = locationType
        self.woeid = woeid
        self.latLong = latLong
        self.timezone = timezone
    }
    
    static func returnMock() -> MainWeatherModel {
        return MainWeatherModel(consolidatedWeather: [], time: "", sunRise: "", sunSet: "", timezoneName: "", parent: ParentModel.returnMock(), sources: [], title: "", locationType: "", woeid: 0, latLong: "", timezone: "")
    }
}
