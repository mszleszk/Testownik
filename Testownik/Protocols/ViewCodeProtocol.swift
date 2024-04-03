import Foundation

protocol ViewCodeProtocol {
    func buildHierarchy()
    func setupConstraints()
    func setupProperties()
}

extension ViewCodeProtocol {
    func applyViewCode() {
        buildHierarchy()
        setupConstraints()
        setupProperties()
    }
    
    func setupProperties() {}
}
