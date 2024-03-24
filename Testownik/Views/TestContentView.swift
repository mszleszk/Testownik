import UIKit

final class TestContentView: UIView {
    private let imageView = ZoomImageView()
    private let label = TestContentView.makeLabel()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(_ image: UIImage) {
        hideText()
        showImage()
        imageView.setImage(image)
    }
    
    func setText(_ text: String) {
        hideImage()
        showText()
        label.text = text
    }
    
    private func setup() {
        backgroundColor = Asset.Colors.primary.color
        layer.cornerRadius = K.View.cornerRadius
    }
    
    private func showImage() {
        addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(K.View.inset)
        }
    }
    
    private func showText() {
        addSubview(label)
        
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(K.View.inset)
        }
    }
    
    private func hideImage() {
        imageView.snp.removeConstraints()
        imageView.removeFromSuperview()
    }
    
    private func hideText() {
        label.snp.removeConstraints()
        label.removeFromSuperview()
    }
}

// MARK: - Builder
private extension TestContentView {
    static func makeLabel() -> UILabel {
        return UILabel(
            fontSize: K.Text.primaryTextSize,
            color: Asset.Colors.primaryText.color,
            alignment: .left
        ).also {
            $0.numberOfLines = 0
        }
    }
}
