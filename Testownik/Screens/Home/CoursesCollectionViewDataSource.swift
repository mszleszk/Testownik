//
//  CoursesCollectionDataSource.swift
//  Testownik
//
//  Created by Michał Szleszkowski on 03/01/2024.
//

import UIKit

final class CoursesCollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CoursesCollectionViewCell.reuseIdentifier, for: indexPath) as? CoursesCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setupAppearance(emoji: "🔊", courseName: "PPS", numberOfQuestions: 5)
        
        return cell
    }
    
    
}
