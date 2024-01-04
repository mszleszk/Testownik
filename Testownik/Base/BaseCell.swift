//
//  BaseCell.swift
//  Testownik
//
//  Created by Michał Szleszkowski on 04/01/2024.
//

import UIKit

class BaseCell: UICollectionViewCell, ReuseIdentifying {
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildHierarchy()
        setupConstraints()
        setupProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildHierarchy() {}
    func setupConstraints() {}
    func setupProperties() {}
}
