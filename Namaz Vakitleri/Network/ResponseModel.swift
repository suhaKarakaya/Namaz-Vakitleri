//
//  ResponseModel.swift
//  Namaz Vakitleri
//
//  Created by Süha Karakaya on 21.05.2024.
//

import Foundation

// MARK: - CounrtyResponseModelElement
struct CounrtyResponseModelElement: Codable {
    let ulkeAdi, ulkeAdiEn, ulkeID: String

    enum CodingKeys: String, CodingKey {
        case ulkeAdi = "UlkeAdi"
        case ulkeAdiEn = "UlkeAdiEn"
        case ulkeID = "UlkeID"
    }
}

typealias CounrtyResponseModel = [CounrtyResponseModelElement]
