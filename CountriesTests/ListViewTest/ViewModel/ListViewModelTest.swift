//
//  ListViewModelTest.swift
//  CountriesTests
//
//  Created by Mohammed Essam on 20/03/2025.
//

import Foundation
import XCTest
@testable import Countries

class ListViewModelTests: XCTestCase {
    var viewModel: ListViewModel!
    var useCase: MockFetchListUseCase!
    var repository: MockListRepository!
    var service: MockListService!

    override func setUp() {
        super.setUp()
        service = MockListService()
        repository = MockListRepository(service: service)
        useCase = MockFetchListUseCase(repository: repository)
        viewModel = ListViewModel(fetchCountriesUseCase: useCase)
    }

    override func tearDown() {
        viewModel = nil
        useCase = nil
        repository = nil
        service = nil
        super.tearDown()
    }

    func test_loadCountries_success() async {
        await viewModel.loadCountries()
        
        XCTAssertEqual(viewModel.countries.count, 2)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
    }

    func test_loadCountries_failure() async {
        service.shouldThrowError = true
        await viewModel.loadCountries()
        
        XCTAssertEqual(viewModel.countries.count, 0)
        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
    }
}
