//
//  ListView.swift
//  CountriesModule
//
//  Created by Mohammed Essam on 19/03/2025.
//

import UIModule
import SwiftUI

// MARK: - ListViewWrapper
//
public struct ListView: NavigatablePath {
    public init () {}
    public var body: some View {
        Content()
    }
}

#Preview {
    ListView()
}

// MARK: - Content
//
fileprivate struct Content: View {
    @StateObject private var viewModel = ListViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        VStack {
            // Add Country Section
            AddCountryView(viewModel: viewModel)
            
            // Country List Section
            CountryListView(viewModel: viewModel, searchText: $searchText)
        }
        .navigationTitle("Countries")
        .searchable(text: $searchText, prompt: "Search for a country")
        .task {
            await viewModel.loadCountries()
        }
    }
}
