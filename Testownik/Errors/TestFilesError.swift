import Foundation

enum TestFileError: Error {
    case cantAccessSecurityScoped
    case cantRetrieveEnumerator
    case cantRetrieveResourceValues
}
