import UIKit
import RealmSwift

final class TestsCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    var presentables = TestsPresentables()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presentables.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell
        
        if indexPath.row == 0 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: TestsCollectionViewAdditionCell.reuseIdentifier, for: indexPath)
        } else {
            guard let testCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TestsCollectionViewCell.reuseIdentifier,
                for: indexPath) as? TestsCollectionViewCell else { return UICollectionViewCell() }
            
            let presentable = presentables[indexPath.row]
            testCell.setupAppearance(emoji: presentable.emoji, testName: presentable.name, numberOfQuestions: presentable.numberOfQuestions)
            cell = testCell
        }
        
        return cell
    }
    
}
