//
//  File.swift
//  
//
//  Created by Chris Heinrich on 8/3/21.
//

import Foundation

#if canImport(UIKit)
import UIKit

extension UIImage {
    
    static func setMaxSize(image: inout UIImage, maxSize: CGSize) {
        let size = image.size
        print("Original image size= \(size)")
        print("Maximum image size= \(maxSize)")
        let widthRatio = maxSize.width / size.width
        let heightRatio = maxSize.height / size.height
        if widthRatio >= 1.0, heightRatio >= 1.0 {
            return
        }
        
        let resizeRatio = min(widthRatio, heightRatio)

        let newSize = CGSize(width: size.width * resizeRatio, height: size.height * resizeRatio)
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        print("Resized image size= \(image.size)")
    }
    
    
    func setMaxSize(maxSize: CGSize) -> UIImage {
        let size = self.size
        print("Original image size= \(size)")
        print("Maximum image size= \(maxSize)")
        let widthRatio = maxSize.width / size.width
        let heightRatio = maxSize.height / size.height
        if widthRatio >= 1.0, heightRatio >= 1.0 {
            return self
        }
        
        let resizeRatio = min(widthRatio, heightRatio)

        let newSize = CGSize(width: size.width * resizeRatio, height: size.height * resizeRatio)
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        print("Resized image size= \(newImage.size)")
        
        return newImage
    }
}







#endif
