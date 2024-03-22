import Foundation
import RealmSwift

struct QuestionParser {
    func parse(_ content: String) -> Question {
        let contentLines = content.components(separatedBy: .newlines).filter { !$0.isEmpty }
        
        let answers = parseAnswers(Array(contentLines[2...]), correctAnswersString: contentLines[0])
        
        let question = Question(answers: answers)
        
        if let imagePath = contentLines[1].slice(from: K.Tags.imageBegin, to: K.Tags.imageEnd) {
            question.imageName = imagePath
        } else {
            question.text = contentLines[1]
        }
        
        return question
    }
    
    private func parseAnswers(_ answerStrings: [String], correctAnswersString: String) -> List<Answer> {
        let correctAnswers = correctAnswersString.dropFirst().map { $0 == "1" }
        
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
