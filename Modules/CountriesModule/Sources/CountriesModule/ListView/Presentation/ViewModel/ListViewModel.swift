//
//  ListViewModel.swift
//  CountriesModule
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation
import CoreModule

final class ListViewModel: ListViewModelContract {
    private let fetchCountriesUseCase: FetchListUseCaseContract
    private let locationManager: LocationManagerContract
    
    @Published var countries: [Country] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    init(
        fetchCountriesUseCase: FetchListUseCaseContract = FetchListUseCaseImpl(),
        locationManager: LocationManagerContract = LocationManager()
    ) {
        self.fetchCountriesUseCase = fetchCountriesUseCase
        self.locationManager = locationManager
    }
    
    func loadCountries() async {
        isLoading = true
        
        do {
            let data = try await fetchCountriesUseCase.execute()
            
            if let countryName = await fetchCountryName() {
                countries = data.sorted { $0.name == countryName ? true : $1.name != countryName }
                
            } else {
                countries = data
            }


        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
    func removeCountry(_ country: Country) {
        if let index = countries.firstIndex(where: { $0 == country }) {
            countries.remove(at: index)
        }
    }
    
    func addCountry(_ country: Country) {
        countries.insert(country, at: 0)
    }
    
    func fetchCountryName() async -> String? {
        do {
            let location = try await locationManager.fetchCurrentLocation()
            let countryName = try await location.fetchCountryName()
            return countryName
        } catch {
            return nil
        }
    }
}
