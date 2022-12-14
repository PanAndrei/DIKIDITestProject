//
//  NetworkManager.swift
//  DIKIDITestProject
//
//  Created by Andrei Panasenko on 13.12.2022.
//

import Foundation

class NetworkManager {
    static let networkManager: NetworkManager = NetworkManager()
    
    func getRequest(url: String = "https://api-beauty.test.dikidi.ru/home/info", completion: @escaping (ResponseModel?) -> Void) {
        guard var path = URLComponents(string: url) else {
            fatalError()
        }
        
        path.queryItems = [URLQueryItem(name: "city_id", value: "468902")]
        
        guard let safeURL = path.url else {
            fatalError()
        }
        
        var request = URLRequest(url: safeURL)
        request.httpMethod = "POST"
        request.setValue("maJ9RyT4TJLt7bmvYXU7M3h4F797fUKofUf3373foN94q4peAM", forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let responseData = data else {
                return
            }
            
            print("data is \(responseData)")
            
            do {
                let jsonResponse = try! JSONDecoder().decode(ResponseModel.self, from: responseData)
                DispatchQueue.main.async {
                    completion(jsonResponse)
                }
            } catch let error {
                print("error \(error) decoding data")
                completion(nil)
            }
        }
        task.resume()
    }
}

