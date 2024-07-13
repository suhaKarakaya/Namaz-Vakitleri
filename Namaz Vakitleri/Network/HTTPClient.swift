//
//  HTTPClient.swift
//  Namaz Vakitleri
//
//  Created by Süha Karakaya on 21.05.2024.
//

import Foundation

public protocol HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError>
}

public extension HTTPClient {
    
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError> {
        

        do {
            let (data, response) = try await URLSession.shared.data(from: endpoint.asURLRequest())
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    return .failure(.decode)
                }
                return .success(decodedResponse)
            case 401:
                return .failure(.unauthorized)
            default:
                return .failure(.unexpectedStatusCode)
            }
        } catch {
            return .failure(.unknown)
        }
    }
}

extension URLSession {
    func data(from url: URLRequest) async throws -> (Data, URLResponse){
        return try await withCheckedThrowingContinuation { continuation in
            let task = self.dataTask(with: url) { data, response, error in
                guard let data = data, let response = response else {
                    let error = error ?? URLError(.unknown)
                    continuation.resume(throwing: error)
                    return
                }
                continuation.resume(returning: (data, response))
            }
            task.resume()
        }
    }
}
