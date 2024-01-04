//
//  TestsCollectionDataSource.swift
//  Testownik
//
//  Created by Michał Szleszkowski on 03/01/2024.
//

import UIKit

final class TestsCollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    private var tests: [Test] = [Test(name: "Podstawy Telekomunikacji", emoji: "📻", questions: [])]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tests.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell
        
        if indexPath.row == 0 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: TestsCollectionViewAdditionCell.reuseIdentifier, for: indexPath)
        } else {
            guard let testCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TestsCollectionViewCell.reuseIdentifier,
                for: indexPath) as? TestsCollectionViewCell else { return UICollectionViewCell() }
            
            let test = tests[indexPath.row - 1]
            testCell.setupAppearance(emoji: test.emoji, testName: test.name, numberOfQuestions: test.questions.count)
            cell = testCell
        }
        
        return cell
    }
    
}
