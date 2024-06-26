import UIKit

final class TestView: UIView {
    private let container = UIView()
    private let topBarView = UIView()
    private let progressView = ProgressView()
    private let questionView = TestView.makeQuestionView()
    
    let answersCollectionView = AnswersCollectionView()
    let closeButton = UIButton(type: .close)
    let confirmButton = TestView.makeConfirmButton()
    
    init() {
        super.init(frame: .zero)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with presentable: TestPresentable) {
        answersCollectionView.allowsMultipleSelection = presentable.question.isMultipleChoice
        
        progressView.setProgress(
            completed: presentable.completedQuestionsCount,
            outOf: presentable.totalQuestionsCount)
        
        if let text = presentable.question.text {
            questionView.setText(text)
        } else if let image = presentable.question.image {
            questionView.setImage(image)
        }
    }
}

extension TestView: ViewCodeProtocol {
    func buildHierarchy() {
        addSubview(container)
        
        container.addSubviews([
            topBarView,
            questionView,
            confirmButton,
            answersCollectionView
        ])
        
        topBarView.addSubviews([
            closeButton,
            progressView
        ])
    }
    
    func setupConstraints() {
        container.snp.makeConstraints { make in
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
            make.left.equalTo(closeButton.snp.right).offset(K.View.inset)
        }
        
        questionView.snp.makeConstraints { make in
            make.top.equalTo(topBarView.snp.bottom).offset(K.View.inset)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(200)
        }
        
        confirmButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().inset(K.View.inset)
            make.right.equalToSuperview().inset(K.View.inset)
        }
        
        answersCollectionView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(questionView.snp.bottom).offset(K.View.smallInset)
            make.bottom.equalTo(confirmButton.snp.top).inset(-K.View.smallInset)
        }
    }
    
    func setupProperties() {
        backgroundColor = Asset.Colors.background.color
    }
}

// MARK: - Builder
private extension TestView {
    static func makeQuestionView() -> TestContentView {
        return TestContentView().also {
            $0.font = .systemFont(ofSize: K.Text.questionTextSize, weight: .bold)
        }
    }
    
    static func makeConfirmButton() -> DefaultButton {
        return DefaultButton().also {
            $0.setTitle(L10n.Test.confirm)
        }
    }
}
