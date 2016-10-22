//
//  Extensions.swift
//  Tripod
//
//  Created by Yevhenii Veretennikov on 10/22/16.
//  Copyright © 2016 Yevhenii Veretennikov. All rights reserved.
//

import UIKit

private var imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func loadImageUsingCache(withUrlString urlString: String) {
        self.image = nil
        let url = URL(string: urlString)
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            self.image = cachedImage
            return
        }
        
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error)
                return
            }
            DispatchQueue.main.async {
                if let downloadedImage = UIImage(data: data!) {
                    imageCache.setObject(downloadedImage, forKey: urlString as NSString)
                    self.image = downloadedImage
                }
            }
        }).resume()
    }
    
    func makeBlurImage(named: String) {
        self.image = UIImage(named: named)
        self.image = image?.blurredImage(withRadius: 30, iterations: 20, tintColor: UIColor(white: 0.6, alpha: 1))
    }
    
    func createCircleImage(imageSize: CGFloat) {
        self.backgroundColor = UIColor.orange
        self.image = UIImage(named: "ph1")
        self.contentMode = .scaleAspectFill
        self.layer.cornerRadius = imageSize/2
        self.layer.masksToBounds = true
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.white.cgColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func createCircleImageShadow(imageSize: CGFloat) {
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = imageSize/2
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize.init(width: 0, height: 4)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 2
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}


extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}

extension UIView {
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

extension UIImage {
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage? {
        
        //        let scale = newWidth / image.size.width
        let newHeight = newWidth
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
