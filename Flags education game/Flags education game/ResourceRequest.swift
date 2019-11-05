
import UIKit

enum GetResourcesRequest<ResourceType> {
    // 1
    case success([ResourceType])
    // 2
    case failure
}

enum SaveResult<ResourceType> {
    case success(ResourceType)
    case failure
}

struct ResourceRequest<ResourceType> where ResourceType: Codable {
    
    // 2
    let baseURL = "http://localhost:48001/"
    let resourceURL: URL
    
    // 3
    init(resourcePath: String) {
        guard let resourceURL = URL(string: baseURL) else {
            fatalError()
        }
        self.resourceURL = resourceURL.appendingPathComponent(resourcePath)
    }
    
    //data response erroe
    //Data tasks send and receive data with URLSessionDataTask, by using NSData objects. They’re the most common for webservice requests, for example when working with JSON.
    
    func getAll(completion: @escaping(GetResourcesRequest<ResourceType>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) {
            data, _, _ in
            guard let jsonData = data else {
                completion(.failure)
                return
            }
            do {
                let resources = try JSONDecoder().decode([ResourceType].self, from: jsonData)
                completion(.success(resources))
            } catch {
                completion(.failure)
            }
        }
        dataTask.resume()
}
}

