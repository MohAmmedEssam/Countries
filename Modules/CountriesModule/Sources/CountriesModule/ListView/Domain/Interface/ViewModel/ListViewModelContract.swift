//
//  ListViewModelContract.swift
//  CountriesModule
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation

@MainActor
protocol ListViewModelContract: ObservableObject {
    var countries: [Country] { get set }
    var isLoading: Bool { get set }
    var errorMessage: String? { get set }
    
    func loadCountries() async
    func removeCountry(_ country: Country)
    func addCountry(_ country: Country)
    func fetchCountryName() async -> String?
}
