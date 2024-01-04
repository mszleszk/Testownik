//
//  CoursesCollectionViewCell.swift
//  Testownik
//
//  Created by Michał Szleszkowski on 03/01/2024.
//

import UIKit
import SnapKit

final class CoursesCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: CoursesCollectionViewCell.self)
    
    private let verticalStackView = CoursesCollectionViewCell.makeVerticalStackView()
    private let emojiLabel = UILabel(fontSize: 100, color: Asset.Colors.primaryText.color)
    private let nameLabel = UILabel(fontSize: 20, weight: .bold, color: Asset.Colors.primaryText.color)
    private let numberOfQuestionsLabel = UILabel(fontSize: 15, color: Asset.Colors.primaryText.color)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildHierarchy()
        setupConstraints()
        setupProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildHierarchy() {
        addSubviews([
            verticalStackView
        ])
        
        verticalStackView.addArrangedSubviews([
            emojiLabel,
            nameLabel,
            numberOfQuestionsLabel
        ])
    }
    
    private func setupConstraints() {
        verticalStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        }
        
        [emojiLabel,
         nameLabel,
         numberOfQuestionsLabel
        ].forEach { view in
            view.snp.makeConstraints { make in
                make.left.equalToSuperview()
                make.right.equalToSuperview()
            }
        }
    }
    
    private func setupProperties() {
        self.backgroundColor = Asset.Colors.primary.color
        self.layer.cornerRadius = 10
    }
    
    func setupAppearance(emoji: String, courseName: String, numberOfQuestions: Int? = nil) {
        emojiLabel.text = emoji
        nameLabel.text = courseName
        
        guard let numberOfQuestions = numberOfQuestions else { return }
        
        numberOfQuestionsLabel.text = L10n.Home.numberOfQuestions(numberOfQuestions)
    }
}

// MARK: - Builder
private extension CoursesCollectionViewCell {
    static func makeVerticalStackView() -> UIStackView {
        return UIStackView(axis: .vertical, spacing: 5).also {
            $0.alignment = .leading
        }
    }
}