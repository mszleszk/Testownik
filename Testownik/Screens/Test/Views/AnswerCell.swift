import UIKit

final class AnswerCell: UICollectionViewCell, ReuseIdentifying {
    private let answerView = TestContentView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AnswerCell: ViewCodeProtocol {
    func buildHierarchy() {
        contentView.addSubviews([
            answerView
        ])
    }
    
    func setupConstraints() {
        answerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        answerView.setText("fkjdshfkjhdskjfhkjdh")
    }
}

// MARK: - Builder
private extension AnswerCell {
    
}
