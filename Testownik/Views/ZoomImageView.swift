import UIKit

final class ZoomImageView: UIScrollView {
    private let imageView = ZoomImageView.makeImageView()
    
    init(image: UIImage? = nil) {
        super.init(frame: .zero)
        
        applyViewCode()
        
        imageView.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(_ image: UIImage) {
        imageView.image = image
    }
    
    @objc private func handleDoubleTap() {
        if zoomScale == 1 {
            setZoomScale(2, animated: true)
        } else {
            setZoomScale(1, animated: true)
        }
    }
}

extension ZoomImageView: ViewCodeProtocol {
    func buildHierarchy() {
        addSubviews([
            imageView
        ])
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.center.equalToSuperview()
        }
    }
    
    func setupProperties() {
        minimumZoomScale = 1
        maximumZoomScale = 3
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        delegate = self
        
        let doubleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
        doubleTapRecognizer.numberOfTapsRequired = 2
        addGestureRecognizer(doubleTapRecognizer)
    }
}

extension ZoomImageView: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}

// MARK: - Builder
private extension ZoomImageView {
    static func makeImageView() -> UIImageView {
        return UIImageView().also {
            $0.contentMode = .scaleAspectFit
        }
    }
}
