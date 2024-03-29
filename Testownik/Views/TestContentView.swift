import UIKit

final class TestContentView: UIView {
    private let zoomImageView = ZoomImageView()
    private let label = TestContentView.makeLabel()
    
    var font: UIFont {
        get {
            label.font
        }
        set {
            label.font = newValue
        }
    }
    
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
        zoomImageView.imageView.image = image
    }
    
    func setText(_ text: String) {
        hideImage()
        showText()
        label.text = text
    }
    
    private func setup() {
        backgroundColor = Asset.Colors.primary.color
        layer.cornerRadius = K.View.cornerRadius
        
        zoomImageView.imageView.tintColor = Asset.Colors.primaryText.color
    }
    
    private func showImage() {
        addSubview(zoomImageView)
        
        zoomImageView.snp.makeConstraints { make in
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
        zoomImageView.snp.removeConstraints()
        zoomImageView.removeFromSuperview()
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
