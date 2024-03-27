import UIKit

final class AnswersCollectionView: UICollectionView {
    private let layout = {
        let inset = K.Cell.outerInset
        
        let size = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(K.AnswerCell.estimatedHeight))
        
        let item = NSCollectionLayoutItem(layoutSize: size)
        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(
            leading: nil,
            top: NSCollectionLayoutSpacing.fixed(inset),
            trailing: nil,
            bottom: nil)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: inset,
            leading: inset,
            bottom: inset,
            trailing: inset)
        
        return UICollectionViewCompositionalLayout(section: section)
    }()
    
    init() {
        super.init(frame: .zero, collectionViewLayout: layout)
        
        register(AnswerCell.self, forCellWithReuseIdentifier: AnswerCell.reuseIdentifier)
        
        backgroundColor = .clear
        
        delaysContentTouches = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
