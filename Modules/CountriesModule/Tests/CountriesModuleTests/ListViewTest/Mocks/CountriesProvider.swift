//
//  CountriesProvider.swift
//  CountriesTests
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation
import XCTest
@testable import CountriesModule

struct CountriesProvider {
    static func getCountryWithName(_ name: String) -> Country {
        return Country(
            name: name,
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
    }
}
