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
struct ListView: NavigatablePath {
    var body: some View {
        Content()
    }
}

#Preview {
    ListView()
}


// MARK: - Content
//
fileprivate struct Content: View {
    @StateObject private var viewModel: ListViewModel
    
    init(viewModel: ListViewModel = .init()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        List(viewModel.countries, id: \.self) { country in
            Text(country.name ?? "")
        }
        .overlay {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let error = viewModel.errorMessage {
                Text("Error: \(error)").foregroundColor(.red)
            }
        }
        .navigationTitle("Countries")
        .task {
            await viewModel.loadCountries()
        }
    }
}
