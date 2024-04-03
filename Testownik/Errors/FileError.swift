import Foundation

enum FileError: Error {
    case cantAccessSecurityScoped
    case cantRetrieveEnumerator
    case cantRetrieveResourceValues
    case cantReadFileContents
    case incorrectFileFormat
}
