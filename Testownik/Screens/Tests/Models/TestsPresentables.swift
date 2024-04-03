import Foundation

struct TestsPresentables {
    private var presentables: [TestsCollectionViewCellPresentable] = []
    
    var count: Int {
        return presentables.count + 1
    }
    
    subscript(index: Int) -> TestsCollectionViewCellPresentable {
        get {
            if index != 0 {
                return presentables[index - 1]
            } else {
                return TestsCollectionViewCellPresentable()
            }
        }
    }
    
    mutating func set(_ presentables: [TestsCollectionViewCellPresentable]) {
        self.presentables = presentables
    }
    
    mutating func remove(at index: Int) {
        presentables.remove(at: index - 1)
    }
}
