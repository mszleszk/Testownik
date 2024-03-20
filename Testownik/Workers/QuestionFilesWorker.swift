import Foundation

protocol QuestionFilesWorkerProtocol {
    func fetchQuestions(from url: URL) throws /*-> [Question]*/
}

final class QuestionFilesWorker {
    private func getFileContents(_ file: URL) throws -> String {
        let data = try Data(contentsOf: file)
        let rawValue = NSString.stringEncoding(
            for: data,
            convertedString: nil,
            usedLossyConversion: nil)
        let encoding = String.Encoding(rawValue: rawValue)
        guard let fileContents = String(data: data, encoding: encoding) else {
            throw FileError.cantReadFileContents }
        
        return fileContents
    }
}

extension QuestionFilesWorker: QuestionFilesWorkerProtocol {
    func fetchQuestions(from url: URL) throws /*-> [Question]*/ {
        let keys: [URLResourceKey] = [.contentTypeKey]
        guard let files = FileManager.default.enumerator(
            at: url,
            includingPropertiesForKeys: keys) else { throw FileError.cantRetrieveEnumerator }
        
        for case let file as URL in files {
            guard file.startAccessingSecurityScopedResource() else { throw FileError.cantAccessSecurityScoped }
            
            guard let resourceValues = try? file.resourceValues(forKeys: Set(keys)),
                  let type = resourceValues.contentType else { throw FileError.cantRetrieveResourceValues }
            
            if type == .plainText {
                let fileContents = try getFileContents(file)
            }
            
            file.stopAccessingSecurityScopedResource()
        }
    }
}
