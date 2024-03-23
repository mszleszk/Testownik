import UIKit

final class ProgressView: BaseView {
    private let progressBar = UIProgressView()
    private let progressLabel = UILabel(
        text: "-/-",
        fontSize: K.Text.secondaryTextSize,
        color: Asset.Colors.primaryText.color)
    
    
    override func buildHierarchy() {
        addSubviews([
            progressBar,
            progressLabel
        ])
    }
    
    override func setupConstraints() {
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
    
    func setProgress(completed: Int, outOf total: Int) {
        progressBar.setProgress(Float(completed) / Float(total), animated: false)
        progressLabel.text = "\(completed)/\(total)"
    }
}

// MARK: - Builder
private extension ProgressView {
    
}
