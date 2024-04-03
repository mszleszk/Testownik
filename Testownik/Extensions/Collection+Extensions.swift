import Foundation

extension Collection {
    func count(where condition: (Element) throws -> Bool) rethrows -> Int {
        return try self.filter(condition).count
    }
}
