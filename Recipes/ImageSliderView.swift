import SwiftUI

struct ImageSliderView: View {
    @State var backgroundOffset: CGFloat = 0
    var item: ListElement
    var body: some View {
        GeometryReader { g in
            HStack(spacing : 0) {
                Rectangle()
                    .frame(width: g.size.width)
                    .foregroundColor(.white)
                    .overlay(
                        Image(item.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    )
                
                Rectangle()
                    .frame(width: g.size.width)
                    .foregroundColor(.white)
                    .overlay(
                        Image(item.imageSlide2)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    )
                
                Rectangle()
                    .frame(width: g.size.width)
                    .foregroundColor(.white)
                    .overlay(
                        Image(item.imageSlide3)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    )
            }
            .offset(x: -(self.backgroundOffset * g.size.width))
            .animation(.default)
        }
        
        //.clipShape(CustomShape(leftCorner: .bottomLeft, rightCorner: .bottomRight, radii: 40))
     
        
        .frame(height: (UIScreen.main.bounds.height / 2))
        .gesture(
            DragGesture()
                .onEnded({ value in
                    if value.translation.width > 10 {
                        if self.backgroundOffset > 0 {
                            self.backgroundOffset -= 1
                        }
                        
                    } else if value.translation.width < 10 {
                            if self.backgroundOffset < 2 {
                                self.backgroundOffset += 1
                            }
                    }
                })
        )
        HStack{
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.green.opacity(self.backgroundOffset == 0 ? 0.7 : 0.2))
                .frame(width: self.backgroundOffset == 0 ? 30 : 10, height: 10, alignment: .center)
            
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.green.opacity(self.backgroundOffset == 1 ? 0.7 : 0.2))
                .frame(width: self.backgroundOffset == 1 ? 30 : 10, height: 10, alignment: .center)
            
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.green.opacity(self.backgroundOffset == 2 ? 0.7 : 0.2))
                .frame(width: self.backgroundOffset == 2 ? 30 : 10, height: 10, alignment: .center)
        }
        .frame(width: UIScreen.main.bounds.width)
        .animation(.default)
    }
}


