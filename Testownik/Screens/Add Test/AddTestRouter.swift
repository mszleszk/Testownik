import UIKit
import MCEmojiPicker

protocol AddTestRouterProtocol {
    func presentEmojiController(toSourceView sourceView: UIView)
    func presentDocumentPicker()
    func dismiss()
}

final class AddTestRouter {
    // MARK: - Public Properties
    weak var viewController: AddTestViewController?
    
    // MARK: - Initializers
    init(viewController: AddTestViewController?) {
        self.viewController = viewController
    }
}

extension AddTestRouter: AddTestRouterProtocol {
    func presentEmojiController(toSourceView sourceView: UIView) {
        let emojiController = MCEmojiPickerViewController()
        emojiController.delegate = viewController
        emojiController.sourceView = sourceView
        viewController?.present(emojiController, animated: true)
    }
    
    func presentDocumentPicker() {
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [.folder])
        documentPicker.delegate = viewController
        viewController?.present(documentPicker, animated: true)
    }
    
    func dismiss() {
        (viewController?.presentingViewController as? TestsViewController)?.interactor?.fetchTests()
        viewController?.dismiss(animated: true)
    }
}
