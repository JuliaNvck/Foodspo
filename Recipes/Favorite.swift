import SwiftUI

class Favorites: ObservableObject {
    private var recipes: Set<String>
    let defaults = UserDefaults.standard
    @Published var recipeElements: [ListElement] = Service.listData
    
    
    init() {
        let decoder = JSONDecoder()
        if let data = defaults.value(forKey: "Favorites") as? Data {
            let taskData = try? decoder.decode(Set<String>.self, from: data)
            self.recipes = taskData ?? []
        } else {
            self.recipes = []
        }
    }
    
    func getTaskIds() -> Set<String> {
        return self.recipes
        
    }
    
    func isEmpty() -> Bool {
        recipes.count < 1
    }
    
    func contains(_ recipe: ListElement) -> Bool {
        recipes.contains(recipe.title)
    }
    
    func add(_ recipe: ListElement) {
        objectWillChange.send()
        recipes.insert(recipe.title)
        save()
    }
    
    func remove(_ recipe: ListElement) {
        objectWillChange.send()
        recipes.remove(recipe.title)
        save()
    }
    
    func save() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(recipes)  {
            defaults.set(encoded, forKey: "Favorites")
        }
    }
    }
