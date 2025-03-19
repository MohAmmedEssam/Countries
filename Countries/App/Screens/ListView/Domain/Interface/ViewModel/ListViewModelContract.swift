//
//  ListViewModelContract.swift
//  CountriesModule
//
//  Created by Mohammed Essam on 20/03/2025.
//

import Foundation

protocol ListViewModelContract: ObservableObject {
    var countries: [Country] { get }
    var errorMessage: String? { get }
    var isLoading: Bool { get }
    
    func loadCountries() async
}
