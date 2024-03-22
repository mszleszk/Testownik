import Foundation

extension String {
    func slice(from: String, to: String) -> String? {
        guard let fromRange = self.range(of: from)?.upperBound else { return nil }
        guard let toRange = self.range(of: to)?.lowerBound else { return nil }
        return String(self[fromRange..<toRange])
    }
}
