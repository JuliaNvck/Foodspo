

import SwiftUI

struct ContentView: View {
    @State var isActive: Bool = false
    
    var body: some View {
        NavigationView{
            ZStack(){
                
                
                if self.isActive {
                    MainView()
                } else {
                    
                Color("background")
                    .ignoresSafeArea()
                Text("What to Eat?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.376, green: 0.392, blue: 0.416, opacity: 1.0))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 80)
                    .padding(.bottom, 300)
                Text("Food")
                    .font(.title3)
                    .fontWeight(.light)
                    .padding(.bottom, 210)
                    .padding(.trailing, 30)
                    Text("spo")
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(Color("spo"))
                        .padding(.bottom, 210)
                        .padding(.leading, 48)
                        
                Image(systemName: "leaf.fill")
                    .foregroundColor(.green)
                    .font(.system(size: 50, weight: .bold))
                    .frame(width: 200.0, height: 500.0)
                    .imageScale(.large)
                    .padding(.trailing, 55)
                    
                    
                Image(systemName: "leaf")
                        .foregroundColor(.green)
                    .padding(.bottom, 50)
                   // .padding(.leading, 60)
                    
                    .font(.system(size: 50, weight: .bold))
                        .frame(width: 200.0, height: 500.0)
                        .imageScale(.large)
                    .rotationEffect(.degrees(90))
                    
                    
                   //.resizable()
                    //.clipShape(Circle())
                    
                  //.aspectRatio(contentMode: .fill)
                  //  .frame(width: 500, height: 500)
                    //.padding(.leading, 75)
                    //.padding(.bottom, 125)
                    
                    //.opacity(0.6)
                    
                    
                    
                    
                    .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                    withAnimation {
                        self.isActive = true
                    }
                }
                    }
                    
                    
        }
    }
}
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Favorites())
    }
}


