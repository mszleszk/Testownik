//
//  TestsCollectionViewCell.swift
//  Testownik
//
//  Created by Michał Szleszkowski on 03/01/2024.
//

import UIKit
import SnapKit

final class TestsCollectionViewCell: BaseCell {
    private let verticalStackView = TestsCollectionViewCell.makeVerticalStackView()
    private let emojiLabel = UILabel(fontSize: 300, color: Asset.Colors.primaryText.color, shouldAdjustFontToWidth: true)
    private let nameLabel = UILabel(fontSize: 20, weight: .bold, color: Asset.Colors.primaryText.color)
    private let numberOfQuestionsLabel = UILabel(fontSize: 15, color: Asset.Colors.primaryText.color)
    
    override func buildHierarchy() {
        addSubviews([
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
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        }
        
        emojiLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.width.equalTo(emojiLabel.snp.height)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(20)
        }
        
        numberOfQuestionsLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(15)
        }
    }
    
    override func setupProperties() {
        self.backgroundColor = Asset.Colors.primary.color
        self.layer.cornerRadius = 15
    }
    
    func setupAppearance(emoji: String, testName: String, numberOfQuestions: Int? = nil) {
        emojiLabel.text = emoji
        nameLabel.text = testName
        
        guard let numberOfQuestions = numberOfQuestions else { return }
        
        numberOfQuestionsLabel.text = L10n.Home.numberOfQuestions(numberOfQuestions)
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
