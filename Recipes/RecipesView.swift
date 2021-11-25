

import SwiftUI

struct RecipesView: View {

    //@ObservedObject var favorites = Favorites

    @EnvironmentObject var favorites: Favorites
    @State var text = ""
    @State private var showFavoritesOnly = false
    
    var filteredRecipes: [ListElement] {
        (Service.listData).filter { item in
                (!showFavoritesOnly || self.favorites.contains(item))
            }
        }
    
    
    var body: some View {
        
            VStack{

            SearchBar(text: $text)
            
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                        .padding(.leading)
                                }
                .padding(.trailing)
                
                
                List((filteredRecipes).filter({ "\($0)".localizedCaseInsensitiveContains(text) || text.isEmpty })){ item in
                
                    
                    NavigationLink(
                        destination: ListDetailView(item: item).environmentObject(self.favorites)){
                        ListElementView(item: item)
                    
                    if self.favorites.contains(item) {
                        //Spacer()
                        Image(systemName: "heart.fill")
                        .accessibility(label: Text("This is a favorite recipe"))
                            .foregroundColor(.red)
                    }
                }
                    
               
            }
                .navigationBarTitle("Recipes")
                .navigationBarHidden(true)
                //.environmentObject(favorites)
                
        }
            .environmentObject(favorites)
    }
    
}




struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView().environmentObject(Favorites())
    }
}
