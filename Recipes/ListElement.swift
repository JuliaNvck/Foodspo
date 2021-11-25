
import Foundation

struct ListElement: Identifiable, Hashable {
    var id = UUID()
    var icon: String
    var image: String
    var title: String
    var subtitle: String 
    var text: String
    var imageSlide2: String
    var imageSlide3: String
    var linkNames : [String]
    var links : [String]

    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}
