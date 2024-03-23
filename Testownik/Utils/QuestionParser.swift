import Foundation
import RealmSwift

struct QuestionParser {
    func parse(_ content: String) -> Question? {
        let contentLines = content.components(separatedBy: .newlines).filter { !$0.isEmpty }
        
        guard contentLines.count >= 3 else { return nil }
        
        guard let answers = parseAnswers(Array(contentLines[2...]), correctAnswersString: contentLines[0]) else {
            return nil
        }
        
        let question = Question(answers: answers)
        
        if let imagePath = contentLines[1].slice(from: K.Tags.imageBegin, to: K.Tags.imageEnd) {
            question.imageName = imagePath
        } else {
            question.text = contentLines[1]
        }
        
        return question
    }
    
    private func parseAnswers(_ answerStrings: [String], correctAnswersString: String) -> List<Answer>? {
        let correctAnswers = correctAnswersString.dropFirst().map { $0 == "1" }
        
        guard correctAnswers.count == answerStrings.count else { return nil }
        
        let answers = answerStrings.enumerated().map { (index, answerText) in
            let answer = Answer(isCorrect: correctAnswers[index])
            
            if let imageName = answerText.slice(from: K.Tags.imageBegin, to: K.Tags.imageEnd) {
                answer.imageName = imageName
            } else {
                answer.text = answerText
            }
            
            return answer
        }
        
        let answersList = List<Answer>()
        answersList.append(objectsIn: answers)
        
        return answersList
    }
}
