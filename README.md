# **Countries App**

## **Overview**
The **Countries App** is a modular **SwiftUI**-based application that allows users to fetch, search, add, and remove countries using the **REST Countries API**. It follows **clean architecture ** and is structured into multiple Swift Package Manager (SPM) modules.

## **Features**
✅ Fetch and display a list of countries.  
✅ Search for a country offline.  
✅ Add a country manually.  
✅ Remove a country from the list.  
✅ Modularized architecture for scalability.  
✅ Handles loading states and errors gracefully.  
✅ Unit tests for all layers.  

## **Project Structure & Modularity**
This app follows a **modular architecture** to improve scalability and maintainability. It consists of the following Swift packages:

### **1. AppModule** (Main Application)
- The entry point of the app.
- Uses the `CoreModule`, and `UIModule`.

### **2. CoreModule** (Shared Business Logic)
- Contains reusable utilities, **networking layer**, and base protocols.
- Provides services like `NetworkManager` for API calls.

### **3. UIModule** (Reusable UI Components)
- Contains common UI components used throughout the app.
- Ensures UI consistency across multiple features.

## **Architecture**
The app follows **clean architecture**, with three key layers:

### **1. Presentation Layer** (SwiftUI Views & ViewModel)
- `ListView.swift` → Displays the list of countries.
- `ListViewModel.swift` → Handles business logic and interacts with the use case.

### **2. Domain Layer** (Use Case)
- `FetchListUseCaseContract.swift` → Defines the contract for fetching countries.
- `FetchListUseCaseImpl.swift` → Implements fetching logic using the repository.

### **3. Data Layer** (Repository & Service)
- `ListRepositoryContract.swift` → Defines repository contract.
- `ListRepositoryImpl.swift` → Implements repository logic by calling the service.
- `ListServiceContract.swift` → Defines network service contract.
- `ListServiceImpl.swift` → Calls REST API to fetch country data.

## **Unit Tests**
Unit tests are provided for all layers. To run them:
1. Open Xcode.
2. Press **Cmd + U** to run all tests.

### **Test Coverage**
✅ `ListViewModelTests.swift` → Tests loading, success, and error cases.  
✅ `FetchListUseCaseTests.swift` → Ensures data is fetched correctly from repository.  
✅ `ListRepositoryTests.swift` → Mocks service responses for various scenarios.  
✅ `ListServiceTests.swift` → Tests REST API calls with mock responses.

## **API Reference**
- [REST Countries API](https://restcountries.com)

## **License**
This project is licensed under the MIT License. See the LICENSE file for more details.
