//
//  UIView+Extension.swift
//  DrawingApp
//
//  Created by 山田楓也 on 2021/01/10.
//

import UIKit

extension UIView {
    var renderdImage: UIImage {
        let rect = self.bounds
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        self.layer.render(in: context)
        
        let capturedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return capturedImage
    }
}
