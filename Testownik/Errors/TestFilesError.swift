//
//  TestFilesError.swift
//  Testownik
//
//  Created by Michał Szleszkowski on 14/01/2024.
//

import Foundation

enum TestFileError: Error {
    case cantAccessSecurityScoped
    case cantRetrieveEnumerator
    case cantRetrieveResourceValues
}
