import UIKit

final class SystemButton: UIButton {
    
    init(text: String) {
        super.init(frame: .zero)
        setup(with: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(with text: String) {
        var config = UIButton.Configuration.plain()
        var attributedTitle = AttributedString(text)
        attributedTitle.foregroundColor = Asset.Colors.primaryText.color
        attributedTitle.font = UIFont.systemFont(ofSize: K.Text.systemTextSize, weight: .medium)
        config.attributedTitle = attributedTitle
        configuration = config
        
        configurationUpdateHandler = { button in
            var config = button.configuration
            config?.attributedTitle?.foregroundColor = button.isHighlighted ? Asset.Colors.primaryText.color.withAlphaComponent(0.5) : Asset.Colors.primaryText.color
            button.configuration = config
        }
    }
}
