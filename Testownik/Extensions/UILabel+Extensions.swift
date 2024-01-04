import UIKit

extension UILabel {
    convenience init(text: String = "", fontSize: CGFloat, weight: UIFont.Weight = .regular, color: UIColor) {
        self.init(frame: .zero)
        
        self.text = text
        self.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        self.textColor = color
    }
}
