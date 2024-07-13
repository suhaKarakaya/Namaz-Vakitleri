//
//  MainViewModel.swift
//  Namaz Vakitleri
//
//  Created by Süha Karakaya on 3.05.2024.
//

import Foundation

final class MainViewModel: ObservableObject, HTTPClient {
    
    @Published var isActive: Bool = false
    
    func deneme(){
        Task(priority: .background) {
            await sendRequest(endpoint: ListEndpoint.getCountryList, responseModel: CounrtyResponseModel.self)

        }
    }
    
   
    

    

}
