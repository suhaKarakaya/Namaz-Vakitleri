//
//  SelectListEndPoint.swift
//  Namaz Vakitleri
//
//  Created by Süha Karakaya on 21.05.2024.
//

import Foundation

enum ListEndpoint {
    case getCountryList
    case getCityList(cityId: String)
    case getDistictList(distinctId: String)
    case getPrayerTime(prayerTimeId: String)
    case getHolydayTime(holydayId: String)
}

extension ListEndpoint: Endpoint {
    
    var host: String {
        return "ezanvakti.herokuapp.com"
    }
    
    var path: String {
        switch self {
        case .getCountryList:
            return "ulkeler"
        case .getCityList(cityId: let cityId):
            return String(format: "sehirler/%@", cityId)
        case .getDistictList(distinctId: let distinctId):
            return String(format: "ilceler/%@", distinctId)
        case .getPrayerTime(prayerTimeId: let prayerTimeId):
            return String(format: "vakitler/%@", prayerTimeId)
        case .getHolydayTime(holydayId: let holydayId):
            return String(format: "bayram-namazi/%@", holydayId)
        }
    }
}


