import UIKit

final class TestView: BaseView {
    private let contentView = UIView()
    private let topBarView = UIView()
    private let closeButton = UIButton(type: .close)
    private let progressView = ProgressView()
    
    override func buildHierarchy() {
        addSubview(contentView)
        
        contentView.addSubviews([
            topBarView
        ])
        
        topBarView.addSubviews([
            closeButton,
            progressView
        ])
    }
    
    override func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide).inset(K.View.inset)
        }
        
        topBarView.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        closeButton.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        progressView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalTo(closeButton.snp.right).offset(10)
        }
    }
    
    override func setupProperties() {
        backgroundColor = Asset.Colors.background.color
    }
}

// MARK: - Builder
private extension TestView {
    
}
