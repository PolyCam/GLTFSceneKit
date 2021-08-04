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
    
    /**
     Resizes image in-place if image size exceeds maxSize
     Otherwise does nothing
     */
    static func setMaxSize(image: inout UIImage, maxSize: CGSize) {
        let size = image.size
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
    }
}

#endif
