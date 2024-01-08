import UIKit

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis, spacing: CGFloat, alignment: Alignment = .fill) {
        self.init(frame: .zero)
        
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
    }
    
    func addArrangedSubviews(_ subviews: [UIView]) {
        subviews.forEach(addArrangedSubview)
    }
}
