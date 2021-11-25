

import SwiftUI

struct ListDetailView: View{
    
    var item: ListElement
    @EnvironmentObject var favorites: Favorites
    //@ObservedObject var favorites = Favorites()
    
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    Text(item.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .font(.title)
                    
                    
                    Button(action: {
                      if self.favorites.contains(item) {
                          self.favorites.remove(item)
                      } else {
                          self.favorites.add(item)
                      }
                    }) {
                      HStack {
                          Image(systemName: favorites.contains(item) ? "heart.fill" : "heart").foregroundColor(favorites.contains(item) ? .red : .black)
                      }
                    }
                    
                }.frame(minWidth: 0, maxWidth: .infinity)
//                Image(item.image)
//                    .resizable()
//                    .renderingMode(.original)
//                    .aspectRatio(contentMode: .fit)
                ImageSliderView(backgroundOffset: 0, item: item)
                    
                Text(item.subtitle)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding()
                Text(item.text)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                Text("Recommended Recipes:")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding(.bottom, 12)
//                Link(item.linkName,
//                     destination: URL(string: item.link)!)
//                    .foregroundColor(Color("textColor"))
//                    .padding()
                

                
                ForEach(Array(zip(item.links, item.linkNames)), id: \.0) { item in
                    Link(item.1, destination: URL(string: item.0)!)
                        .foregroundColor(Color("textColor"))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 12)
                }
                
//                ForEach(item.links, id: \.self) { link in
//                    ForEach(item.linkNames, id: \.self){ name in
//                        Link(name,
//                         destination: URL(string: link)!)
//                        .foregroundColor(Color("textColor"))
//                        .padding(.bottom, 12)
//                }
//                }
                
                

               
 
            
            
        }
    }
}
}

struct CustomShape: Shape {
    var leftCorner: UIRectCorner
    var rightCorner: UIRectCorner
    var radii: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners:[leftCorner, rightCorner], cornerRadii: CGSize(width: radii, height: radii))
        
        return Path(path.cgPath)
    }
}


