//
//  RecipesGridView.swift
//  Recipes
//
//  Created by Julia on 3/15/21.
//

import SwiftUI

struct RecipesGridView: View {
    
    
//@ObservedObject var favorites = Favorites
    @EnvironmentObject var favorites: Favorites
    @State var text = ""
    @State private var showFavoritesOnly = false
    
    var filteredRecipes: [ListElement] {
        (Service.listData).filter { item in
                (!showFavoritesOnly || self.favorites.contains(item))
            }
        }
    
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        //NavigationView{
            
        VStack{
        
            SearchBar(text: $text)
            
            Toggle(isOn: $showFavoritesOnly) {
                Text("Favorites only")
                    .padding(.leading)
                            }
            .padding(.trailing)
            
            
            
        ScrollView{
            LazyVGrid(columns: gridItemLayout, alignment: .center, spacing: 10){
                ForEach(filteredRecipes.filter({ "\($0)".localizedCaseInsensitiveContains(text) || text.isEmpty}), id: \.self){ item in
                    
                    NavigationLink(
                        destination: ListDetailView(item: item).environmentObject(self.favorites)){
                        ZStack{
                        Image(item.icon)
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 125, height: 125, alignment: .center)
                            .cornerRadius(10)
                            
                        
                        if self.favorites.contains(item) {
                            //Spacer()
                            
                            Image(systemName: "heart.fill")
                            .accessibility(label: Text("This is a favorite recipe"))
                                .foregroundColor(.red)
                                .padding([.trailing, .top], 100)
                                
                            
                                
                        }
                        }
     
                }
                    
                    
            }
                .navigationBarTitle("Recipes")
                .navigationBarHidden(true)
               // .environmentObject(favorites)
                
                
        }

    }
}
        .environmentObject(favorites)
}
}
//}

struct RecipesGridView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesGridView().environmentObject(Favorites())
    }
}
