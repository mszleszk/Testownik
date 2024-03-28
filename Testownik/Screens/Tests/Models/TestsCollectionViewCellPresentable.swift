import Foundation

struct TestsCollectionViewCellPresentable {
    let name: String
    let emoji: String
    let numberOfQuestions: Int
    
    init(name: String, emoji: String, numberOfQuestions: Int) {
        self.name = name
        self.emoji = emoji
        self.numberOfQuestions = numberOfQuestions
    }
    
    init() {
        self.init(name: "", emoji: "", numberOfQuestions: 0)
    }
}
