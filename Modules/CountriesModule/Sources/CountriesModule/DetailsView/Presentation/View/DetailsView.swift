//
//  DetailsView.swift
//  Countries
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation
import UIModule
import SwiftUI

// MARK: - ViewWrapper
//
struct DetailsView: NavigatablePath {
    let model: Country
    
    init(model: Country) {
        self.model = model
    }
    
    var body: some View {
        Content(model: model)
    }
}

#Preview {
    DetailsView(model:
                    Country(
                        name: "Egypt",
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
    )
}


// MARK: - Content
//
fileprivate struct Content: View {
    @State var model: Country
    
    var body: some View {
        VStack {
            Text(
"""
Capital city:   \(model.capital ?? "")

Currency:       \(model.currencies?.first?.name ?? "") \(model.currencies?.first?.code ?? "")
"""
            )
            Spacer()
        }
        .padding(.top)
        .navigationTitle(model.name ?? "")
    }
}
