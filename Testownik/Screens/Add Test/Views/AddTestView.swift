import UIKit

final class AddTestView: BaseView {
    private let verticalStackView = UIStackView(axis: .vertical, spacing: 10)
    private let addEmojiButton = AddTestView.makeAddEmojiButton()
    
    override func buildHierarchy() {
        addSubviews([
            verticalStackView
        ])
        
        verticalStackView.addArrangedSubviews([
            addEmojiButton
        ])
    }
    
    override func setupConstraints() {
        verticalStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        }
        
        addEmojiButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func setupProperties() {
        backgroundColor = Asset.Colors.background.color
    }
}

// MARK: - Builder
private extension AddTestView {
    static func makeAddEmojiButton() -> UIButton {
        return UIButton().also {
            let config = UIImage.SymbolConfiguration(paletteColors: [Asset.Colors.systemLightGray.color, Asset.Colors.systemGray.color])
            let image = UIImage(systemName: "plus.circle.fill")?.applyingSymbolConfiguration(config)
            $0.setBackgroundImage(image, for: .normal)
            $0.layoutIfNeeded()
            let backgroundImageView = $0.subviews.first
            backgroundImageView?.contentMode = .scaleAspectFit
            backgroundImageView?.tintColor = Asset.Colors.systemGray.color
        }
    }
}
