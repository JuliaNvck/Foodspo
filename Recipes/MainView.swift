//favorites do not save between grid and list view

import SwiftUI

struct MainView: View {

    var body: some View {
        TabView{
            RecipesView()
                .tabItem{
                    Label("List", systemImage: "list.dash")
                }
            RecipesGridView()
                .tabItem{
                    Label("Grid", systemImage: "square.grid.2x2")
                }
//            TrackProgress()
//                .tabItem{
//                    Label("Track Progress", systemImage: "battery.25")
//                }
        }
        .accentColor(Color("textColor"))
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
