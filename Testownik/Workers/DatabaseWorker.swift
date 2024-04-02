import Foundation
import RealmSwift

protocol DatabaseWorkerProtocol {
    func saveTest(_ test: Test) throws
    func getTests() -> Results<Test>
    func deleteTest(test: Test) throws
    func setQuestionCompleted(_ question: Question) throws
}

final class DatabaseWorker {
    private let realm = try! Realm()
}

extension DatabaseWorker: DatabaseWorkerProtocol {
    func setQuestionCompleted(_ question: Question) throws {
        try realm.write {
            question.isCompleted = true
        }
    }
    
    func saveTest(_ test: Test) throws {
        try realm.write {
            realm.add(test)
        }
    }
    
    func getTests() -> Results<Test> {
        realm.objects(Test.self)
    }
    
    func deleteTest(test: Test) throws {
        try realm.write {
            realm.delete(test)
        }
    }
}
