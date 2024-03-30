import UIKit

final class ZoomImageView: UIScrollView {
    let imageView = ZoomImageView.makeImageView()
    let paddingView = UIView()
    
    init(image: UIImage? = nil) {
        super.init(frame: .zero)
        
        applyViewCode()
        
        imageView.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
            paddingView
        ])
        
        paddingView.addSubviews([
            imageView
        ])
    }
    
    func setupConstraints() {
        paddingView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.center.equalToSuperview()
        }
         
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(K.View.inset)
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
        return paddingView
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
