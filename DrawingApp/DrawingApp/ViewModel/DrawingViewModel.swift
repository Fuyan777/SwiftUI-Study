//
//  DrawingViewModel.swift
//  DrawingApp
//
//  Created by 山田楓也 on 2021/01/10.
//

import SwiftUI

final class DrawingViewModel: NSObject, ObservableObject {
    enum Inputs {
        case tappedCaptureButton(canvasRect: CGRect, image: UIImage)
    }
    
    @Published var isShowAlert: Bool = false
    private(set) var alertTitle: String = ""
    
    func apply(inputs: Inputs) {
        switch inputs {
        case let .tappedCaptureButton(canvasRect, image):
            let croppedImage = cropImage(with: image, rect: canvasRect)
            UIImageWriteToSavedPhotosAlbum(croppedImage!, self, #selector(imageSaveCompletion(_: didFinishSavingWithError:contextInfo:)), nil)
        }
    }
    
    private func cropImage(with image: UIImage, rect: CGRect) -> UIImage? {
        let ajustRect = CGRect(
            x: rect.origin.x * image.scale,
            y: rect.origin.y * image.scale,
            width: rect.width * image.scale,
            height: rect.height * image.scale
        )
        guard let img = image.cgImage?.cropping(to: ajustRect) else { return nil }
        let croppedImage = UIImage(
            cgImage: img,
            scale: image.scale,
            orientation: image.imageOrientation
        )
        return croppedImage
    }
    
    @objc func imageSaveCompletion(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        alertTitle = error == nil ? "画像が保存されました" : error?.localizedDescription ?? ""
        isShowAlert = true
    }
}
