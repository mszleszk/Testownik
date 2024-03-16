import Foundation

protocol TestFilesWorkerProtocol {
    func saveImagesInAppFiles(from url: URL) throws -> String?
    func removeFolder(withName name: String) throws
//    func parseQuestions(from url: URL) -> [Question]
}

final class TestFilesWorker {
    private func createDirectory() throws -> URL {
        let uniqueFolderName = UUID().uuidString
        let directory = URL.documentsDirectory.appending(path: uniqueFolderName)
        
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: false)

        return directory
    }
    
    private func copyImages(from sourceUrl: URL, to destinationUrl: URL) throws {
        let keys : [URLResourceKey] = [.nameKey, .contentTypeKey]
        guard let files = FileManager.default.enumerator(
            at: sourceUrl,
            includingPropertiesForKeys: keys) else { throw TestFileError.cantRetrieveEnumerator }
        
        for case let file as URL in files {
            guard file.startAccessingSecurityScopedResource() else {
                throw TestFileError.cantAccessSecurityScoped
            }
            
            guard let resourceValues = try? file.resourceValues(forKeys: Set(keys)),
                    let name = resourceValues.name,
                    let type = resourceValues.contentType else { throw TestFileError.cantRetrieveResourceValues }
            
            if type == .image || type == .jpeg || type == .png {
                try FileManager.default.copyItem(at: file, to: destinationUrl.appending(path: name))
            }
            
            file.stopAccessingSecurityScopedResource()
        }
    }
    
    private func containsImages(at url: URL) throws -> Bool {
        let keys : [URLResourceKey] = [.contentTypeKey]
        guard let files = FileManager.default.enumerator(
            at: url,
            includingPropertiesForKeys: keys) else { throw TestFileError.cantRetrieveEnumerator }
        
        for case let file as URL in files {
            guard file.startAccessingSecurityScopedResource() else {
                throw TestFileError.cantAccessSecurityScoped
            }
            
            guard let resourceValues = try? file.resourceValues(forKeys: Set(keys)),
                    let type = resourceValues.contentType else { throw TestFileError.cantRetrieveResourceValues }
            
            if type == .image || type == .jpeg || type == .png {
                return true
            }
            
            file.stopAccessingSecurityScopedResource()
        }
        
        return false
    }
}

extension TestFilesWorker: TestFilesWorkerProtocol {
    func removeFolder(withName name: String) throws {
        let documents = URL.documentsDirectory
        try FileManager.default.removeItem(at: documents.appending(path: name))
    }
    
    func saveImagesInAppFiles(from url: URL) throws -> String? {
        guard url.startAccessingSecurityScopedResource() else { throw TestFileError.cantAccessSecurityScoped }
        defer { url.stopAccessingSecurityScopedResource() }
        
        guard try containsImages(at: url) else { return nil }
        
        let imageDirectoryUrl = try createDirectory()

        try copyImages(from: url, to: imageDirectoryUrl)
        
        return imageDirectoryUrl.lastPathComponent
    }
    
//    func parseQuestions(from url: URL) -> [Question] {
//
//    }
}
