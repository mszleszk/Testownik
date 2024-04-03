import Foundation
import SPIndicator

protocol ErrorPresenting {
    func showError(withMessage: String?)
}

extension ErrorPresenting {
    func showError(withMessage message: String?) {
        SPIndicator.present(
            title: L10n.General.Error.somethingWentWrong,
            message: message,
            preset: .error,
            haptic: .error)
    }
}
