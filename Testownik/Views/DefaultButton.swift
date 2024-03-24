import UIKit

final class DefaultButton: UIButton {
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title: String) {
        configuration?.attributedTitle = AttributedString(title)
        configuration?.attributedTitle?.font = UIFont.systemFont(
            ofSize: K.Text.systemTextSize,
            weight: .bold
        )
    }
    
    private func setup() {
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = Asset.Colors.systemBlue.color
        config.baseForegroundColor = Asset.Colors.primaryText.color
        config.cornerStyle = .capsule
        config.buttonSize = .large
        self.configuration = config
        
        titleLabel?.font = .systemFont(ofSize: K.Text.primaryTextSize, weight: .bold)
    }
}
