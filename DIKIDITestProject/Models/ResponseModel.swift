//
//  ResponseModel.swift
//  DIKIDITestProject
//
//  Created by Andrei Panasenko on 13.12.2022.
//

import Foundation

struct ResponseModel: Codable {
    let errorMessage: ErrorMessage
    let data: MainPageData
    
    private enum CodingKeys: String, CodingKey {
        case errorMessage = "error"
        case data = "data"
    }
}

struct ErrorMessage: Codable {
    let code: Int
    let message: String?
    
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case message = "message"
    }
}

struct MainPageData: Codable {
    let title: String
    let mainImageURL: String
    let catalogCount: String
    let blocks: Blocks
    let order: [String]
    
    private enum CodingKeys: String, CodingKey {
        case title = "title"
        case mainImageURL = "image"
        case catalogCount = "catalog_count"
        case blocks = "blocks"
        case order = "order"
    }
}

struct Blocks: Codable {
    let vip: [VIPUnit]
    let shares: Shares
    let examples: String
    let catalog: [CatalogUnit]
    
    private enum CodingKeys: String, CodingKey {
        case vip = "vip"
        case shares = "shares"
        case examples = "examples"
        case catalog = "catalog"
    }
}

struct VIPUnit: Codable, Identifiable {
    let id: String
    let images: ImageUnit
    let name: String
    let categories: [String]?
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case images = "image"
        case name = "name"
        case categories = "catalog"
    }
}

struct ImageUnit: Codable {
    let thumbURL: String
    let originURL: String
    
    private enum CodingKeys: String, CodingKey {
        case thumbURL = "thumb"
        case originURL = "origin"
    }
}

struct Shares: Codable {
    let list: [SharesUnit]
    let count: String
    
    private enum CodingKeys: String, CodingKey {
        case list = "list"
        case count = "count"
    }
}

struct SharesUnit: Codable, Identifiable {
    let id: String
    let name: String
    let timeStart: String
    let timeStop: String
    let discountValue: String
    let viewCount: String
    let usedCount: String
    let companyID: String
    let iconImageURL: String
    let companyName: String
    let companyStreet: String
    let companyHouse: String
    let companyImageURL: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case timeStart = "time_start"
        case timeStop = "time_stop"
        case discountValue = "discount_value"
        case viewCount = "view"
        case usedCount = "used_count"
        case companyID = "company_id"
        case iconImageURL = "icon"
        case companyName = "company_name"
        case companyStreet = "company_street"
        case companyHouse = "company_house"
        case companyImageURL = "company_image"
    }
}

struct CatalogUnit: Codable, Identifiable {
    let id: String
    let name: String
    let images: [ImageUnit]
    let street: String
    let house: String
//    let shedule: Bool // to check
    let shedule: [DaysUnit]?
    let lat: String
    let lng: String
    let categories: [String]?
    let rating: Double
    let isMaster: Bool
    let currency: CurrencyUnit
    let masterID: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case images = "image"
        case street = "street"
        case house = "house"
    //    case shedule = "" // to check
        case shedule = "schedule"
        case lat = "lat"
        case lng = "lng"
        case categories = "categories"
        case rating = "rating"
        case isMaster = "isMaster"
        case currency = "currency"
        case masterID = "master_id"
    }
}

struct DaysUnit: Codable {
    let day: String
    let workFrom: String
    let workTo: String
    
    private enum CodingKeys: String, CodingKey {
        case day = "day"
        case workFrom = "work_from"
        case workTo = "work_to"
    }
}

struct CurrencyUnit: Codable {
    let id: String
    let title: String
    let abbr: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case abbr = "abbr"
    }
}
