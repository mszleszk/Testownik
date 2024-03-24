import UIKit

final class ProgressView: UIView {
    private let progressBar = UIProgressView()
    private let progressLabel = UILabel(
        text: "-/-",
        fontSize: K.Text.secondaryTextSize,
        color: Asset.Colors.primaryText.color)
    
    init() {
        super.init(frame: .zero)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setProgress(completed: Int, outOf total: Int) {
        progressBar.setProgress(Float(completed) / Float(total), animated: false)
        progressLabel.text = "\(completed)/\(total)"
    }
}

extension ProgressView: ViewCodeProtocol {
    func buildHierarchy() {
        addSubviews([
            progressBar,
            progressLabel
        ])
    }
    
    func setupConstraints() {
        progressBar.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalTo(progressLabel.snp.left).offset(-5)
        }
        
        progressLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
}

// MARK: - Builder
private extension ProgressView {
    
}
