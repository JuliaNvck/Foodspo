//make it so you can choose your goal
//      in the incrementProgress() func: instead of 0.1 you do 1/(input value) -- make sure it is a float
//      where it says 10 new recipes: do a picker from 1 - 20 (or Service.listData.count) and this is the input value

import SwiftUI

struct TrackProgress: View {
    
    @State var progressValue: Float = 0.0
    
    var body: some View {

            
            
        ZStack {
            Color.gray
                .opacity(0.1)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators: false){
            
            VStack {
                
                Text("Track Progress")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding(.top, 40)
                    .padding(.bottom, 10)
                    .textCase(.uppercase)
                Text("Try New Recipes")
                    .font(.title)
                    .fontWeight(.bold)
                    .opacity(0.75)
                
                ProgressBar(progress: self.$progressValue)
                    .frame(width: 150.0, height: 150.0)
                    .padding(30.0)
                
                Button(action: {
                    self.incrementProgress()
                    
                }) {
                    HStack {
                        Image(systemName: "plus.rectangle.fill")
                        Text("New Recipe Tried")
                    }
                    .padding(15.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15.0)
                            .stroke(lineWidth: 2.0)
                    )
                }
                .padding(.bottom, 20)
                
                Button(action: {
                    self.resetProgress()
                    
                }) {
                    HStack {
                        Image(systemName: "arrow.counterclockwise")
                        Text("Reset")
                    }
                    .padding(15.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15.0)
                            .stroke(lineWidth: 2.0)
                    )
                }
                
                Text("Goal:")
                   // .font(.largeTitle)
                    .fontWeight(.bold)
                    .font(.title)
                    .padding(.top, 20)
                HStack{
                Text("10")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .font(.title)
                    .padding(.top, 7)
                    .foregroundColor(Color("textColor"))
                Text("New Recipes")
                       // .font(.largeTitle)
                        .fontWeight(.bold)
                        .font(.title)
                        .padding(.top, 7)
                }
                
                
            }
                
            }
            

    }
    }
    
    func incrementProgress() {
        let incrementValue = Float(0.1)
        self.progressValue += incrementValue
        
    }
    
    func resetProgress(){
            self.progressValue = 0.0
    }
}
struct ProgressBar: View {
    @Binding var progress: Float
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.3)
                .foregroundColor(Color("textColor"))
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color("textColor"))
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)

            Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
                .font(.largeTitle)
                .bold()
        }.navigationBarHidden(true)
    }
}

struct TrackProgress_Previews: PreviewProvider {
    static var previews: some View {
        TrackProgress()
    }
}


