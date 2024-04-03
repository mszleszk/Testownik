import UIKit

class BaseCell: UICollectionViewCell, ReuseIdentifying {
    override var isHighlighted: Bool {
        didSet {
            if self.isHighlighted {
                alpha = 0.5
            } else {
                alpha = 1
            }
        }
    }
}
