//
//  TimeTableEndPoint.swift
//  Namaz Vakitleri
//
//  Created by Süha Karakaya on 21.05.2024.
//

import Foundation


enum TimeTableEndPoint {
    case getMoon(moonId: String)
}

extension TimeTableEndPoint: Endpoint {
    
    var host: String {
        return "namazvakti.diyanet.gov.tr"
    }
    
    var path: String {
        switch self {
        case .getMoon(moonId: let moonId):
            return String(format: "images/%@", moonId)
        }
    }
}
