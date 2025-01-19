import UIKit

protocol ImageFilesWorkerProtocol {
    func saveImagesInAppFiles(from url: URL) throws -> String?
    func removeFolder(withName name: String) throws
    func getImage(withName name: String, fromFolder imageFolderName: String) -> UIImage?
}

final class ImageFilesWorker {
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
            includingPropertiesForKeys: keys) else { throw FileError.cantRetrieveEnumerator }
        
        for case let file as URL in files {
            let successRequestingAccess = file.startAccessingSecurityScopedResource()
            
            guard let resourceValues = try? file.resourceValues(forKeys: Set(keys)),
                    let name = resourceValues.name,
                    let type = resourceValues.contentType else { throw FileError.cantRetrieveResourceValues }
            
            if type == .image || type == .jpeg || type == .png {
                try FileManager.default.copyItem(at: file, to: destinationUrl.appending(path: name))
            }
            
            if successRequestingAccess {
                file.stopAccessingSecurityScopedResource()
            }
        }
    }
    
    private func containsImages(at url: URL) throws -> Bool {
        let keys : [URLResourceKey] = [.contentTypeKey]
        guard let files = FileManager.default.enumerator(
            at: url,
            includingPropertiesForKeys: keys) else { throw FileError.cantRetrieveEnumerator }
        
        for case let file as URL in files {
            let successRequestingAccess = file.startAccessingSecurityScopedResource()
            
            guard let resourceValues = try? file.resourceValues(forKeys: Set(keys)),
                    let type = resourceValues.contentType else { throw FileError.cantRetrieveResourceValues }
            
            if type == .image || type == .jpeg || type == .png {
                return true
            }
            
            if successRequestingAccess {
                file.stopAccessingSecurityScopedResource()
            }
        }
        
        return false
    }
}

extension ImageFilesWorker: ImageFilesWorkerProtocol {
    func removeFolder(withName name: String) throws {
        let documents = URL.documentsDirectory
        try FileManager.default.removeItem(at: documents.appending(path: name))
    }
    
    func saveImagesInAppFiles(from url: URL) throws -> String? {
        let successRequestingAccess = url.startAccessingSecurityScopedResource()
        
        guard try containsImages(at: url) else { return nil }
        
        let imageDirectoryUrl = try createDirectory()

        try copyImages(from: url, to: imageDirectoryUrl)
        
        if successRequestingAccess {
            url.stopAccessingSecurityScopedResource()
        }
        
        return imageDirectoryUrl.lastPathComponent
    }
    
    func getImage(withName name: String, fromFolder imageFolderName: String) -> UIImage? {
        let imageUrl = URL.documentsDirectory.appending(path: imageFolderName).appending(path: name)
        guard let imageData = try? Data(contentsOf: imageUrl) else { return nil }
        return UIImage(data: imageData)
    }
}
