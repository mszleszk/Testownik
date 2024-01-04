//
//  TestsCollectionView.swift
//  Testownik
//
//  Created by Michał Szleszkowski on 03/01/2024.
//

import UIKit

final class TestsCollectionView: UICollectionView {
    private let layout = {
        let inset = 5.0
        let cellFractionalWidth: CGFloat = UIScreen.main.bounds.width > 500 ? 1/3 : 1/2
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(cellFractionalWidth), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(cellFractionalWidth * 1.1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        return UICollectionViewCompositionalLayout(section: section)
    }()
    
    init() {
        super.init(frame: .zero, collectionViewLayout: layout)
        
        register(TestsCollectionViewCell.self, forCellWithReuseIdentifier: TestsCollectionViewCell.reuseIdentifier)
        register(TestsCollectionViewAdditionCell.self, forCellWithReuseIdentifier: TestsCollectionViewAdditionCell.reuseIdentifier)
        
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
