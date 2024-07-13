//
//  NetworkManager.swift
//  Namaz Vakitleri
//
//  Created by Süha Karakaya on 6.05.2024.
//

import UIKit
import Alamofire

final class NetworkManager: HTTPClient {
    
    static let shared = NetworkManager()
    static let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) async {
        let cacheKey = NSString(string: urlString)
        
        if let image = NetworkManager.cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        var fullUrlArr = urlString.split(separator: "/")
        debugPrint(String(fullUrlArr[fullUrlArr.endIndex - 1]))
        let res = await sendRequest(endpoint: TimeTableEndPoint.getMoon(moonId: String(fullUrlArr[fullUrlArr.endIndex - 1])), responseModel: Data.self)
        switch res {
        case .success(let response):
            guard let image = UIImage(data: response) else {
                completed(nil)
                return
            }
            NetworkManager.cache.setObject(image, forKey: cacheKey)
            completed(image)
            break
        case.failure(_):
            completed(nil)
            break
        }
    }
}
