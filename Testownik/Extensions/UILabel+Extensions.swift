import UIKit

extension UILabel {
    convenience init(text: String = "", fontSize: CGFloat, weight: UIFont.Weight = .regular, color: UIColor, shouldAdjustFontToWidth: Bool = false, alignment: NSTextAlignment = .natural) {
        self.init(frame: .zero)
        
        self.text = text
        self.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        self.textColor = color
        
        self.minimumScaleFactor = 0.2
        self.adjustsFontSizeToFitWidth = shouldAdjustFontToWidth
        
        self.textAlignment = alignment
    }
}
