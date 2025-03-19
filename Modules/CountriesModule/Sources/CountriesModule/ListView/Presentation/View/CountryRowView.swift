//
//  CountryRowView.swift
//  Countries
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation
import UIModule
import SwiftUI

struct CountryRowView: View {
    let country: Country
    @StateObject var viewModel: ListViewModel
    @EnvironmentObject var appRouter: AppRouter

    var body: some View {
        HStack {
            Text(country.name ?? "")
                .onTapGesture {
                    appRouter.push(DetailsView(model: country))
                }
            Spacer()
            Button(action: {
                viewModel.removeCountry(country)
            }) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
            .buttonStyle(BorderlessButtonStyle()) // Allows tap inside List row
        }
    }
}
