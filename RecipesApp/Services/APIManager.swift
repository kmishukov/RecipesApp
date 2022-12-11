//
//  APIManager.swift
//  RecipesApp
//
//  Created by Konstantin Mishukov on 11.12.2022.
//

import Foundation

struct APIResponse {
    let error: Error?
    let data: Data?
    let response: URLResponse?
}

final class APIManager {
    static func networkRequest(url: URL, reqMethod: String = "GET", completion: @escaping (APIResponse) -> Void) {
        HTTPRequest.request(url: url, reqMethod: reqMethod) { (data, response, error) in
            completion(APIResponse(error: error, data: data, response: response))
        }
    }
}

final fileprivate class HTTPRequest {
    static func request(url: URL, reqMethod: String, completion: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = reqMethod
        let config = URLSessionConfiguration.default
        let task = URLSession(configuration: config).dataTask(with: request as URLRequest) { (data, response, error) in
            DispatchQueue.main.async(execute: {
                if error != nil {
                    completion(nil, nil, error)
                } else {
                    completion(data, response, nil)
                }
            })
        }
        task.resume()
    }
}
