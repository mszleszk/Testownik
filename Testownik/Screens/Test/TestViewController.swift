import UIKit

protocol TestViewControllerLogic: AnyObject, ErrorPresenting {
    func updateTest(with presentable: TestPresentable)
    func updateAnswers(with presentables: [AnswerPresentable])
}

final class TestViewController: UIViewController {
    var interactor: TestInteractorLogic?
    var router: TestRouterProtocol?
    
    private let dataSource = AnswersCollectionViewDataSource()
    private let testView = TestView()
    
    override func loadView() {
        self.view = testView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.getNextQuestion()
    }
    
    private func setup() {
        setupAnswersCollectionView()
        setupCloseButton()
        setupNextButton()
    }
    
    private func setupAnswersCollectionView() {
        testView.answersCollectionView.delegate = self
        testView.answersCollectionView.dataSource = dataSource
    }
    
    private func setupCloseButton() {
        let action = UIAction { [weak self] _ in
            self?.dismiss(animated: true)
        }
        testView.closeButton.addAction(action, for: .touchUpInside)
    }
    
    private func setupNextButton() {
        let action = UIAction { [weak self] _ in
            self?.interactor?.checkAnswers(
                selectedIndices: self?.testView.answersCollectionView.indexPathsForSelectedItems)
            self?.testView.answersCollectionView.allowsSelection = false
        }
        testView.nextButton.addAction(action, for: .touchUpInside)
    }
}

extension TestViewController: TestViewControllerLogic {
    func updateAnswers(with presentables: [AnswerPresentable]) {
        dataSource.answerPresentables = presentables
        testView.answersCollectionView.reloadData()
    }
    
    func updateTest(with presentable: TestPresentable) {
        testView.update(with: presentable)
        dataSource.answerPresentables = presentable.question.answers
        testView.answersCollectionView.reloadData()
    }
}

extension TestViewController: UICollectionViewDelegate {
    
}
