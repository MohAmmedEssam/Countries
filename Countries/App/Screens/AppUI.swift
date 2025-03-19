//
//  AppUI.swift
//  Countries
//
//  Created by Mohammed Essam on 18/03/2025.
//

import SwiftUI
import UIModule

struct AppUI: View {
    @StateObject var appRouter = AppRouter.shared
    
    var body: some View {
        NavigationStack(path: $appRouter.stackPaths) {
            ListView()
                .navigationDestination(for: NavigationDestination.self) { destination in
                    destination.view
                }
        }
    }
}
#Preview {
    AppUI()
}
