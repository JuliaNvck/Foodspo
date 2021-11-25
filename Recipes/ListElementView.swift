

import SwiftUI

struct ListElementView: View {

    var item: ListElement

    @EnvironmentObject var favorites: Favorites
    var body: some View {
        HStack{
            Image(item.icon)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
            //VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)



        }
    }
}

