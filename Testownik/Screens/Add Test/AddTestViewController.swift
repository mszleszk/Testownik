import UIKit
import MCEmojiPicker
import SPIndicator

protocol AddTestViewControllerLogic: AnyObject {
    func showAddedFolder(withName name: String)
    func showError(withMessage message: String?)
    func success()
}

final class AddTestViewController: UIViewController {
    var interactor: AddTestInteractorLogic?
    var router: AddTestRouterProtocol?
    
    private let addTestView = AddTestView()
    
    override func loadView() {
        self.view = addTestView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setupEmojiButton()
        setupAddFolderButton()
        setupCancelButton()
        setupDoneButton()
        dismissKeyboardOnTouchOutside()
        
        addTestView.nameTextField.delegate = self
        isModalInPresentation = UIDevice.current.userInterfaceIdiom == .pad
    }
    
    private func setupEmojiButton() {
        let action = UIAction { [weak self] action in
            guard let sender = action.sender as? UIButton else { return }
            self?.router?.presentEmojiController(toSourceView: sender)
        }
        addTestView.addEmojiButton.addAction(action, for: .touchUpInside)
    }
    
    private func setupAddFolderButton() {
        let action = UIAction { [weak self] action in
            self?.router?.presentDocumentPicker()
        }
        addTestView.addFolderButton.addAction(action, for: .touchUpInside)
    }
    
    private func setupCancelButton() {
        let action = UIAction { [weak self] action in
            self?.dismiss(animated: true)
        }
        addTestView.cancelButton.addAction(action, for: .touchUpInside)
    }
    
    private func setupDoneButton() {
        let action = UIAction { [weak self] action in
            self?.interactor?.addTest(
                name: self?.addTestView.getName(),
                emoji: self?.addTestView.getEmoji())
        }
        addTestView.doneButton.addAction(action, for: .touchUpInside)
    }
}

extension AddTestViewController: AddTestViewControllerLogic {
    func success() {
        router?.dismiss()
    }
    
    func showAddedFolder(withName name: String) {
        addTestView.addFolderButton.setAsFolderAdded(withFolderName: name)
    }
    
    func showError(withMessage message: String?) {
        SPIndicator.present(
            title: L10n.General.somethingWentWrong,
            message: message,
            preset: .error,
            haptic: .error)
    }
}

extension AddTestViewController: MCEmojiPickerDelegate {
    func didGetEmoji(emoji: String) {
        addTestView.setEmoji(emoji)
    }
}

extension AddTestViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        view.gestureRecognizers?.first?.delaysTouchesBegan = true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        view.gestureRecognizers?.first?.delaysTouchesBegan = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension AddTestViewController: UIDocumentPickerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let url = urls.first else { return }
        interactor?.addFolder(withUrl: url)
    }
}
