import UIKit

final class TestsCollectionView: UICollectionView {
    private let layout = {
        let inset = K.Cell.outerInset
        let cellFractionalWidth: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 1/3 : 1/2
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(cellFractionalWidth),
            heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: inset,
            leading: inset,
            bottom: inset,
            trailing: inset)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(cellFractionalWidth * 1.1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
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
        
        register(TestsCollectionViewCell.self, forCellWithReuseIdentifier: TestsCollectionViewCell.reuseIdentifier)
        register(TestsCollectionViewAdditionCell.self, forCellWithReuseIdentifier: TestsCollectionViewAdditionCell.reuseIdentifier)
        
        backgroundColor = .clear
        
        delaysContentTouches = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
