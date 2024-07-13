//
//  Endpoint.swift
//  Namaz Vakitleri
//
//  Created by Süha Karakaya on 21.05.2024.
//

import Foundation

public protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: Any]? { get }
}


public extension Endpoint {
    
    var scheme: String {
        return "https://"
    }
    
    var body: [String : Any]? {
        return nil
    }
   
    var method: RequestMethod {
        return .get
    }
    
    var header: [String: String]? {
        return nil
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = String(format: "%@%@/%@", scheme, host, path)
        var urlComps = URLComponents(string: url)!
        var urlRequest: URLRequest?
        if let result = urlComps.url {
            urlRequest = URLRequest(url: result)
        }
        
        // HTTP Method
        urlRequest?.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest?.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest?.setValue("application/json", forHTTPHeaderField: "Accept")
        
        // Parameters
        if let parameters = body {
            do {
                urlRequest?.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw RequestError.invalidURL
            }
        }
    
        return urlRequest!
    }
}

