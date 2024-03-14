import UIKit
import MCEmojiPicker

protocol AddTestRouterProtocol {
    func presentEmojiController(toSourceView sourceView: UIView)
    func presentDocumentPicker()
    func dismissWithSuccess()
}

final class AddTestRouter {
    // MARK: - Public Properties
    weak var viewController: AddTestViewController?
    var dataStore: AddTestDataStore?
    
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
    
    func dismissWithSuccess() {
        guard let parentViewController = viewController?.presentingViewController as? TestsViewController,
              let test = dataStore?.testToAdd
        else { return }
        
        parentViewController.addTest(test)
        viewController?.dismiss(animated: true)
    }
}
