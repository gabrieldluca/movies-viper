import UIKit

class ImageDataManager {

    static let shared = ImageDataManager()

    private var imageCache = NSCache<AnyObject, AnyObject>()

    private init() { }

    func loadImage(urlString: String, indexPath: IndexPath, completionHandler: @escaping (UIImage, IndexPath) -> Void) {

        if let cacheImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            return completionHandler(cacheImage, indexPath)
        }

        guard let url = URL(string: urlString) else { return }

        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            if let error = error {
                print("Couldn't download image: ", error)
                return
            }

            guard let data = data, let image = UIImage(data: data) else { return }
            self?.imageCache.setObject(image, forKey: urlString as AnyObject)

            DispatchQueue.main.async {
                completionHandler(image, indexPath)
            }
        }

        DispatchQueue.global(qos: .background).async {
            dataTask.resume()
        }
    }
}
