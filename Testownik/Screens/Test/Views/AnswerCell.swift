import UIKit

final class AnswerCell: UICollectionViewCell, ReuseIdentifying {
    private let answerView = AnswerCell.makeAnswerView()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                answerView.backgroundColor = Asset.Colors.primary.color.withAlphaComponent(0.3)
            } else {
                answerView.backgroundColor = Asset.Colors.primary.color.withAlphaComponent(1.0)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with presentable: AnswerPresentable) {
        if let text = presentable.text {
            answerView.setText(text)
        } else if let image = presentable.image {
            answerView.setImage(image)
        }
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
    }
}

// MARK: - Builder
private extension AnswerCell {
    static func makeAnswerView() -> TestContentView {
        return TestContentView().also {
            $0.font = .systemFont(ofSize: K.Text.answerTextSize)
            $0.shouldAllowZoom = false
        }
    }
}
