//
//  ResponseViewModel.swift
//  DIKIDITestProject
//
//  Created by Andrei Panasenko on 14.12.2022.
//

import Foundation

class ResponseViewModel: ObservableObject {
    @Published var responseData: ResponseModel?
    @Published var isFinishedLoading: Bool = false
    
    init() {
        getData()
    }
    
    var order: [String] {
        responseData?.data.order ?? ["vip", "examples", "catalog"]
    }
    
    var mainDescription: String {
        responseData?.data.title ?? ""
    }
    
    var premiumCount: String {
        if let count = responseData?.data.blocks.vip.count {
            return String(count)
        } else {
            return ""
        }
    }
    
    var vipBlock: [VIPUnit] {
        if let vipB = responseData?.data.blocks.vip {
            return vipB
        } else {
            return []
        }
    }
    
    var examplesImage: String {
        if let exampleURL = responseData?.data.blocks.examples {
            return exampleURL
        }
        return ""
    }
    
    var cathalogUnits: [CatalogUnit] {
        if let cathalog = responseData?.data.blocks.catalog {
            return cathalog
        } else {
            return []
        }
    }
    
    var cathalogCount: String {
        if let count = responseData?.data.blocks.catalog.count {
            return String(count)
        } else {
            return ""
        }
    }
    
    func getData() {
        DispatchQueue.main.async {
            NetworkManager.networkManager.getRequest { [weak self] result in
                if let safeResult = result {
                    self!.responseData = safeResult
                    self!.isFinishedLoading = true
                }
            }
        }
    }
}



