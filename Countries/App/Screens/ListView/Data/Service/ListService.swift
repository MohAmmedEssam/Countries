//
//  ListService.swift
//  CountriesModule
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation
import CoreModule

class ListServiceImpl: ListServiceContract {
    private let networkManager: NetworkServiceContract
    
    init(networkManager: NetworkServiceContract = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchCountries() async throws -> [Country] {
        let request = NetworkRequestBuilder(baseURL: "https://restcountries.com/v2/")
            .setPath("all")
            .build()
        
        let data: [Country] = try await networkManager.request(request)
        return data
    }
}
