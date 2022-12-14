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
    let examples: String
    let catalog: [CatalogUnit]
    
    private enum CodingKeys: String, CodingKey {
        case vip = "vip"
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
        case categories = "categories"
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

struct CatalogUnit: Codable, Identifiable {
    let id: String
    let name: String
    let images: ImageUnit
    let street: String
    let house: String
    let lat: String
    let lng: String
    let categories: [String]?
    let rating: Double
    let isMaster: Bool
    let currency: CurrencyUnit
    let masterID: String?
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case images = "image"
        case street = "street"
        case house = "house"
        case lat = "lat"
        case lng = "lng"
        case categories = "categories"
        case rating = "rating"
        case isMaster = "isMaster"
        case currency = "currency"
        case masterID = "master_id"
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
