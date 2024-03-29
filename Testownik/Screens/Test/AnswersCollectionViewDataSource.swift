import UIKit

final class AnswersCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    var answerPresentables = [AnswerPresentable]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        answerPresentables.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AnswerCell.reuseIdentifier,
            for: indexPath
        ) as? AnswerCell else {
            return UICollectionViewCell()
        }
        
        cell.update(with: answerPresentables[indexPath.row])
        
        return cell
    }
    
    
}
