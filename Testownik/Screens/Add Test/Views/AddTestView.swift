import UIKit
import SnapKit

final class AddTestView: UIView {
    let addEmojiButton = AddTestView.makeAddEmojiButton()
    let nameTextField = AddTestView.makeNameTextField()
    let addFolderButton = AddFolderButton()
    let doneButton = BarButton(text: L10n.General.done)
    let cancelButton =  BarButton(text: L10n.General.cancel)
    
    private let verticalStackView = UIStackView(axis: .vertical, spacing: 15, alignment: .center)
    
    init() {
        super.init(frame: .zero)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setEmojiSize()
    }
    
    func setEmoji(_ emoji: String) {
        let config = UIImage.SymbolConfiguration(hierarchicalColor: Asset.Colors.systemGray.color)
        let image = UIImage(systemName: "circle.fill", withConfiguration: config)
        addEmojiButton.setBackgroundImage(image, for: .normal)
        addEmojiButton.setTitle(emoji, for: .normal)
    }
    
    func getEmoji() -> String? {
        return addEmojiButton.titleLabel?.text
    }
    
    func getName() -> String? {
        return nameTextField.text == "" ? nil : nameTextField.text
    }
    
    private func setEmojiSize() {
        let emojiSize = addEmojiButton.bounds.height * 0.5
        addEmojiButton.titleLabel?.font = UIFont.systemFont(ofSize: emojiSize)
    }
}

extension AddTestView: ViewCodeProtocol {
    func buildHierarchy() {
        addSubviews([
            verticalStackView,
            doneButton,
            cancelButton
        ])
        
        verticalStackView.addArrangedSubviews([
            addEmojiButton,
            nameTextField,
            addFolderButton
        ])
    }
    
    func setupConstraints() {
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
        
        addFolderButton.snp.makeConstraints { make in
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
    
    func setupProperties() {
        backgroundColor = Asset.Colors.background.color
        verticalStackView.setCustomSpacing(50, after: nameTextField)
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
}
