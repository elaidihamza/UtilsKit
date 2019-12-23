//
//  UIImage+File.swift
//  UtilsKit
//
//  Created by RGMC on 28/03/2018.
//  Copyright © 2018 RGMC. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    /**
     Convenience initializer to initialize an image from cache.
     
     - parameter path: path of the image.
     - parameter documentDirectory: directory of the image. Default is document directory.
     
     */
    public convenience init?(from path: String,
                      documentDirectory: FileManager.SearchPathDirectory = .documentDirectory) {
        let nsUserDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, nsUserDomainMask, true)
        if let dirPath = paths.first {
            let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent(path)
            self.init(contentsOfFile: imageURL.path)
        }
        return nil
    }
    
    /**
     Cache an image to given path and directory.
     
     - parameter path: path of the image.
     - parameter documentDirectory: directory of the image to save in. Default is document directory.
     
     */
    public func save(to path: String,
              documentDirectory: FileManager.SearchPathDirectory = .documentDirectory) {
        let imageData = self.pngData()
        let imagePath = try! FileManager.default.url(for: documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(path)
        do {
            try imageData?.write(to: imagePath, options: .atomic)
        } catch let error {
            log(.photo, error: error)
        }
    }
}
