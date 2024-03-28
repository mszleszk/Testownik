import Foundation

struct TestsCollectionViewCellPresentable {
    let id: String
    let name: String
    let emoji: String
    let numberOfQuestions: Int
    
    init(id: String, name: String, emoji: String, numberOfQuestions: Int) {
        self.id = id
        self.name = name
        self.emoji = emoji
        self.numberOfQuestions = numberOfQuestions
    }
    
    init() {
        self.init(id: "", name: "", emoji: "", numberOfQuestions: 0)
    }
}
