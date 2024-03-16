import Foundation
import SPIndicator

protocol ErrorShowing {
    func showError(withMessage: String?)
}

extension ErrorShowing {
    func showError(withMessage message: String?) {
        SPIndicator.present(
            title: L10n.General.somethingWentWrong,
            message: message,
            preset: .error,
            haptic: .error)
    }
}
