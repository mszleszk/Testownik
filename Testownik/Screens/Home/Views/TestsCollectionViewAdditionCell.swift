//
//  TestsCollectionViewAdditionCell.swift
//  Testownik
//
//  Created by Michał Szleszkowski on 04/01/2024.
//

import UIKit

final class TestsCollectionViewAdditionCell: BaseCell {
    private let verticalStackView = UIStackView(axis: .vertical, spacing: 5)
    private let plusImageView = TestsCollectionViewAdditionCell.makePlusImageView()
    private let addLabel = UILabel(text: L10n.Home.addTest, fontSize: 20, weight: .bold, color: Asset.Colors.systemBlue.color, alignment: .center)
    
    override func buildHierarchy() {
        addSubviews([
            verticalStackView
        ])
        
        verticalStackView.addArrangedSubviews([
            plusImageView,
            addLabel
        ])
    }
    
    override func setupConstraints() {
        verticalStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        }
    }
    
    override func setupProperties() {
        backgroundColor = Asset.Colors.systemBlue.color.withAlphaComponent(0.2)
        self.layer.cornerRadius = 10
    }
}

// MARK: - Builder
private extension TestsCollectionViewAdditionCell {
    static func makePlusImageView() -> UIImageView {
        return UIImageView().also {
            $0.image = UIImage(systemName: "plus.circle.fill")?.withRenderingMode(.alwaysTemplate)
            $0.contentMode = .scaleAspectFit
            $0.tintColor = UIColor.systemBlue
        }
    }
}
