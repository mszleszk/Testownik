import Foundation
import RealmSwift

class TestsCollectionViewData {
    private var tests: Results<Test>?
    
    subscript(index: Int) -> Test? {
        get {
            if index != 0 {
                return tests?[index - 1]
            } else {
                return Test(name: "", emoji: "", questions: List<Question>())
            }
        }
    }
    
    func set(_ results: Results<Test>) {
        self.tests = results
    }
}
