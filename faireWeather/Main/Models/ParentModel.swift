//
//  ParentModel.swift
//  faireWeather
//
//  Created by Matheus Weber on 12/03/23.
//

struct ParentModel: Codable {
    var title: String
    var locationType: String
    var woeid: Int
    var latLong: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case locationType = "location_type"
        case woeid
        case latLong = "latt_long"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.locationType = try container.decode(String.self, forKey: .locationType)
        self.woeid = try container.decode(Int.self, forKey: .woeid)
        self.latLong = try container.decode(String.self, forKey: .latLong)
    }
}
