//
//  CountryListView.swift
//  Countries
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation
import UIModule
import SwiftUI

struct CountryListView: View {
    @StateObject var viewModel: ListViewModel
    @Binding var searchText: String

    var body: some View {
        List {
            ForEach(filteredCountries, id: \.self) { country in
                CountryRowView(country: country, viewModel: viewModel)
            }
        }
        .overlay {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let error = viewModel.errorMessage {
                Text("Error: \(error)").foregroundColor(.red)
            }
        }
    }
    
    private var filteredCountries: [Country] {
        if searchText.isEmpty {
            return viewModel.countries
        } else {
            return viewModel.countries.filter { country in
                country.name?.localizedCaseInsensitiveContains(searchText) == true
            }
        }
    }
}
