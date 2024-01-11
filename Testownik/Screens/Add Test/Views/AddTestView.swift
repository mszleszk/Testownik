import UIKit
import SnapKit

final class AddTestView: BaseView {
    internal let addEmojiButton = AddTestView.makeAddEmojiButton()
    internal let nameTextField = AddTestView.makeNameTextField()
    
    private let verticalStackView = UIStackView(axis: .vertical, spacing: 15, alignment: .center)
    private let addFileButton = AddTestView.makeAddFileButton()
    private let doneButton = SystemButton(text: L10n.General.done)
    private let cancelButton =  SystemButton(text: L10n.General.cancel)
    
    override func buildHierarchy() {
        addSubviews([
            verticalStackView,
            doneButton,
            cancelButton
        ])
        
        verticalStackView.addArrangedSubviews([
            addEmojiButton,
            nameTextField,
            addFileButton
        ])
    }
    
    override func setupConstraints() {
        verticalStackView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(K.View.inset)
            make.right.equalToSuperview().inset(K.View.inset)
            make.centerY.equalTo(safeAreaLayoutGuide.snp.centerY)
        }
        
        addEmojiButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(K.View.largeInset)
            make.right.equalToSuperview().inset(K.View.largeInset)
            make.height.equalTo(addEmojiButton.snp.width)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.height.equalTo(K.Text.largeTextSize)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        addFileButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(K.View.inset)
            make.right.equalToSuperview().inset(K.View.inset)
            make.height.equalTo(150)
        }
        
        doneButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(K.View.inset)
            make.top.equalToSuperview().inset(K.View.inset)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(K.View.inset)
            make.top.equalToSuperview().inset(K.View.inset)
        }
    }
    
    override func setupProperties() {
        backgroundColor = Asset.Colors.background.color
        verticalStackView.setCustomSpacing(50, after: nameTextField)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupAddFileButtonBorder()
        setEmojiSize()
    }
    
    internal func setEmoji(_ emoji: String) {
        let config = UIImage.SymbolConfiguration(hierarchicalColor: Asset.Colors.systemGray.color)
        let image = UIImage(systemName: "circle.fill", withConfiguration: config)
        addEmojiButton.setBackgroundImage(image, for: .normal)
        addEmojiButton.setTitle(emoji, for: .normal)
    }
    
    private func setupAddFileButtonBorder() {
        let dashBorder = CAShapeLayer()
        dashBorder.lineWidth = 3
        dashBorder.strokeColor = Asset.Colors.systemGray.color.cgColor
        dashBorder.lineDashPattern = [6, 3] as [NSNumber]
        dashBorder.frame = addFileButton.bounds
        dashBorder.fillColor = nil
        dashBorder.path = UIBezierPath(roundedRect: addFileButton.bounds, cornerRadius: 20).cgPath
        addFileButton.layer.addSublayer(dashBorder)
    }
    
    private func setEmojiSize() {
        let emojiSize = addEmojiButton.bounds.height * 0.5
        addEmojiButton.titleLabel?.font = UIFont.systemFont(ofSize: emojiSize)
    }
}

// MARK: - Builder
private extension AddTestView {
    static func makeAddEmojiButton() -> UIButton {
        return UIButton().also {
            let config = UIImage.SymbolConfiguration(paletteColors: [Asset.Colors.systemBlue.color, Asset.Colors.systemBlue.color.withAlphaComponent(0.5)])
            let image = UIImage(systemName: "plus.circle.fill", withConfiguration: config)
            $0.setBackgroundImage(image, for: .normal)
            $0.layoutIfNeeded()
            let backgroundImageView = $0.subviews.first
            backgroundImageView?.contentMode = .scaleAspectFit
        }
    }
    
    static func makeNameTextField() -> UITextField {
        return UITextField().also {
            $0.textColor = Asset.Colors.primaryText.color
            $0.font = UIFont.systemFont(ofSize: K.Text.largeTextSize, weight: .bold)
            $0.textAlignment = .center
            let placeholderText = NSAttributedString(string: L10n.AddTest.inputName, attributes: [NSAttributedString.Key.foregroundColor: Asset.Colors.systemGray.color])
            $0.attributedPlaceholder = placeholderText
        }
    }
    
    static func makeAddFileButton() -> UIButton {
        return UIButton().also {
            let config = UIImage.SymbolConfiguration(paletteColors: [Asset.Colors.primaryText.color, Asset.Colors.systemBlue.color])
            var buttonConfiguration = UIButton.Configuration.plain()
            buttonConfiguration.image = UIImage(systemName: "plus.circle.fill", withConfiguration: config)
            buttonConfiguration.imagePadding = 10
            var attributedTitle = AttributedString(L10n.AddTest.addFiles)
            attributedTitle.foregroundColor = Asset.Colors.primaryText.color
            attributedTitle.font = UIFont.systemFont(ofSize: K.Text.primaryTextSize, weight: .bold)
            buttonConfiguration.attributedTitle = attributedTitle
            $0.configuration = buttonConfiguration
            
            $0.configurationUpdateHandler = { button in
                var config = button.configuration
                config?.attributedTitle?.foregroundColor = button.isHighlighted ? Asset.Colors.primaryText.color.withAlphaComponent(0.5) : Asset.Colors.primaryText.color
                button.configuration = config
            }
        }
    }
}
