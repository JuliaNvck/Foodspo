//
//  RecipesApp.swift
//  Recipes
//
//  Created by Julia on 3/4/21.
//

import SwiftUI

@main
struct RecipesApp: App {
    @StateObject private var favorites = Favorites()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(favorites)
        }
    }
}
