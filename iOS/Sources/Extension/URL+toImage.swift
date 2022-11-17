import Foundation

import UIKit

extension URL {
    func toImage() -> UIImage {
        var uiImage = UIImage()
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: self) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        uiImage = image
                    }
                }
            }
        }
        return uiImage
    }
}
