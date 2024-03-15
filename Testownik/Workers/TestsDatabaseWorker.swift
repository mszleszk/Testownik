import Foundation
import RealmSwift

protocol TestsDatabaseWorkerProtocol {
    func saveTest(_ test: Test) throws
    func getTests() -> Results<Test>
}

final class TestsDatabaseWorker {
    private let realm = try! Realm()
}

extension TestsDatabaseWorker: TestsDatabaseWorkerProtocol {
    func saveTest(_ test: Test) throws {
        try realm.write({
            realm.add(test)
        })
    }
    
    func getTests() -> Results<Test> {
        realm.objects(Test.self)
    }
}
