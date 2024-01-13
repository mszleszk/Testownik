//
//  ReuseIdentifying.swift
//  Testownik
//
//  Created by Michał Szleszkowski on 04/01/2024.
//

import Foundation

protocol ReuseIdentifying {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifying {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
