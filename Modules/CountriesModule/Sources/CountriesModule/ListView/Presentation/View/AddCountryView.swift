//
//  AddCountryView.swift
//  Countries
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation
import SwiftUI

struct AddCountryView: View {
    @StateObject var viewModel: ListViewModel
    @State private var newCountryName: String = ""

    var body: some View {
        HStack {
            TextField("Enter country name", text: $newCountryName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(maxWidth: .infinity)
            
            Button(action: addCountry) {
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.blue)
                    .font(.title)
            }
            .disabled(newCountryName.isEmpty)
        }
        .padding()
    }

    private func addCountry() {
        let newCountry =  Country(
            name: newCountryName,
            topLevelDomain: nil,
            alpha2Code: nil,
            alpha3Code: nil,
            callingCodes: nil,
            capital: nil,
            altSpellings: nil,
            subregion: nil,
            region: nil,
            population: nil,
            latlng: nil,
            demonym: nil,
            area: nil,
            timezones: nil,
            borders: nil,
            nativeName: nil,
            numericCode: nil,
            flags: nil,
            currencies: nil,
            languages: nil,
            translations: nil,
            flag: nil,
            regionalBlocs: nil,
            cioc: nil,
            independent: nil,
            gini: nil
        )
        viewModel.addCountry(newCountry)
        newCountryName = "" // Clear the input field
    }
}
