import UIKit

class BaseView: UIView {
    
    // MARK: - Initializers
    init() {
        super.init(frame: .zero)
        
        buildHierarchy()
        setupConstraints()
        setupProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    func buildHierarchy() {}
    func setupConstraints() {}
    func setupProperties() {}
}
