import UIKit
import SnapKit

final class TestsCollectionViewCell: BaseCell {
    private let verticalStackView = TestsCollectionViewCell.makeVerticalStackView()
    private let emojiLabel = UILabel(fontSize: 300, color: Asset.Colors.primaryText.color, shouldAdjustFontToWidth: true)
    private let nameLabel = UILabel(fontSize: K.Text.primaryTextSize, weight: .bold, color: Asset.Colors.primaryText.color)
    private let numberOfQuestionsLabel = UILabel(fontSize: K.Text.secondaryTextSize, color: Asset.Colors.primaryText.color)
    
    override func buildHierarchy() {
        contentView.addSubviews([
            verticalStackView
        ])
        
        verticalStackView.addArrangedSubviews([
            emojiLabel,
            nameLabel,
            numberOfQuestionsLabel
        ])
    }
    
    override func setupConstraints() {
        verticalStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: K.Cell.innerInset, left: K.Cell.innerInset, bottom: K.Cell.innerInset, right: K.Cell.innerInset))
        }
        
        emojiLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.width.equalTo(emojiLabel.snp.height)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(K.Text.primaryTextSize)
        }
        
        numberOfQuestionsLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(K.Text.secondaryTextSize)
        }
    }
    
    override func setupProperties() {
        contentView.backgroundColor = Asset.Colors.primary.color
        contentView.layer.cornerRadius = K.View.cornerRadius
    }
    
    func setupAppearance(emoji: String, testName: String, numberOfQuestions: Int) {
        emojiLabel.text = emoji
        nameLabel.text = testName
        numberOfQuestionsLabel.text = L10n.Tests.numberOfQuestions(numberOfQuestions)
    }
}

// MARK: - Builder
private extension TestsCollectionViewCell {
    static func makeVerticalStackView() -> UIStackView {
        return UIStackView(axis: .vertical, spacing: 5).also {
            $0.alignment = .leading
        }
    }
}
