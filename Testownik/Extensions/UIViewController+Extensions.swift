//
//  UIViewController+Extensions.swift
//  Testownik
//
//  Created by Michał Szleszkowski on 10/01/2024.
//

import UIKit

extension UIViewController {
    func dismissKeyboardOnTouchOutside() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
