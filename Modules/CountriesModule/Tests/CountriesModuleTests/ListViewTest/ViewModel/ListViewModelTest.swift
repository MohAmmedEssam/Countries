//
//  ListViewModelTest.swift
//  CountriesTests
//
//  Created by Mohammed Essam on 19/03/2025.
//

import Foundation
import XCTest
@testable import CountriesModule

@MainActor
final class ListViewModelTests: XCTestCase {
    var viewModel: ListViewModel!
    var useCase: MockFetchListUseCase!
    var repository: MockListRepository!
    var service: MockListService!

    func test_loadCountries_success() async {
        service = MockListService()
        repository = MockListRepository(service: service)
        useCase = MockFetchListUseCase(repository: repository)
        viewModel = ListViewModel(fetchCountriesUseCase: useCase)
        
        await viewModel.loadCountries()

        XCTAssertEqual(viewModel.countries.count, 3)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
    }

    func test_loadCountries_failure() async {
        
        service = MockListService(shouldThrowError: true)
        repository = MockListRepository(service: service)
        useCase = MockFetchListUseCase(repository: repository)
        viewModel = ListViewModel(fetchCountriesUseCase: useCase)
        
        await viewModel.loadCountries()

        XCTAssertEqual(viewModel.countries.count, 0)
        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
    }

    func test_addCountry() async {
        service = MockListService()
        repository = MockListRepository(service: service)
        useCase = MockFetchListUseCase(repository: repository)
        viewModel = ListViewModel(fetchCountriesUseCase: useCase)
        
        let country = CountriesProvider.getCountryWithName("France")
        viewModel.addCountry(country)

        XCTAssertEqual(viewModel.countries.first, country)
    }

    func test_removeCountry() async {
        service = MockListService()
        repository = MockListRepository(service: service)
        useCase = MockFetchListUseCase(repository: repository)
        viewModel = ListViewModel(fetchCountriesUseCase: useCase)
        
        let country = CountriesProvider.getCountryWithName("Germany")
        viewModel.addCountry(country)
        XCTAssertEqual(viewModel.countries.count, 1)

        viewModel.removeCountry(country)
        XCTAssertEqual(viewModel.countries.count, 0)
    }
}
