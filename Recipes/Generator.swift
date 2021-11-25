import SwiftUI

struct Generator: View {
    
    let randomInt = Int.random(in: 1..<(Service.listData.count - 1))
    var body: some View {
        VStack{
            Text("Recipe Generator")
                .font(.largeTitle)
                .fontWeight(.bold)
                .font(.title)
        ZStack{
            Rectangle()
                .frame(width: 350.0, height: 350.0)
                .foregroundColor(Color("background"))
            
            NavigationLink(
                
                destination: ListDetailView(item: Service.listData[randomInt])
                           ) {
                Text("Generate Recipe")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(40)
                    .foregroundColor(.white)
                    .padding(10)
                    .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color("textColor"), lineWidth: 5))
                           }
            
//            Button(action: {
//
//
//            }) {
//                Text("Generate Recipe")
//                    .fontWeight(.bold)
//                    .font(.title)
//                    .padding()
//                    .background(Color.gray)
//                    .cornerRadius(40)
//                    .foregroundColor(.white)
//                    .padding(10)
//                    .overlay(
//                            RoundedRectangle(cornerRadius: 40)
//                                .stroke(Color("textColor"), lineWidth: 5)
//                        )
//
 //           }
        }
        }
        
    }
    
//    func displayRecipe(){
//        let randomInt = Int.random(in: 1..<(Service.listData.count - 1))
//        ListElementView(item: Service.listData[randomInt])
//    }
}

struct Generator_Previews: PreviewProvider {
    static var previews: some View {
        Generator()
    }
}
