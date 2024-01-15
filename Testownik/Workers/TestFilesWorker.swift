import Foundation

protocol TestFilesWorkerProtocol {
    func saveImagesInAppFiles(from url: URL) throws -> URL?
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
            guard file.startAccessingSecurityScopedResource() else { throw TestFileError.cantAccessSecurityScoped }
            
            guard let resourceValues = try? file.resourceValues(forKeys: Set<URLResourceKey>(keys)),
                    let name = resourceValues.name,
                    let type = resourceValues.contentType else { throw TestFileError.cantRetrieveResourceValues }
            
            if type == .image {
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
            guard file.startAccessingSecurityScopedResource() else { throw TestFileError.cantAccessSecurityScoped }
            
            guard let resourceValues = try? file.resourceValues(forKeys: Set<URLResourceKey>(keys)),
                    let type = resourceValues.contentType else { throw TestFileError.cantRetrieveResourceValues }
            
            if type == .image {
                return true
            }
            
            file.stopAccessingSecurityScopedResource()
        }
        
        return false
    }
}

extension TestFilesWorker: TestFilesWorkerProtocol {
    func saveImagesInAppFiles(from url: URL) throws -> URL? {
        guard url.startAccessingSecurityScopedResource() else { throw TestFileError.cantAccessSecurityScoped }
        defer { url.stopAccessingSecurityScopedResource() }
        
        guard try containsImages(at: url) else { return nil }
        
        let imageDirectory = try createDirectory()

        try copyImages(from: url, to: imageDirectory)
        
        return imageDirectory
    }
    
//    func parseQuestions(from url: URL) -> [Question] {
//
//    }
}
