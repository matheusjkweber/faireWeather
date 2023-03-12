//
//  SourceModel.swift
//  faireWeather
//
//  Created by Matheus Weber on 12/03/23.
//

struct SourceModel: Codable {
    var title: String
    var slug: String
    var url: String
    var crawlRate: Int
    
    enum CodingKeys: String, CodingKey {
        case title
        case slug
        case url
        case crawlRate = "crawl_rate"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.slug = try container.decode(String.self, forKey: .slug)
        self.url = try container.decode(String.self, forKey: .url)
        self.crawlRate = try container.decode(Int.self, forKey: .crawlRate)
    }
}
