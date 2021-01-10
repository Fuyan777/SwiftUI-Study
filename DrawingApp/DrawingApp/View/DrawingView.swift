//
//  DrawingView.swift
//  DrawingApp
//
//  Created by 山田楓也 on 2021/01/10.
//

import SwiftUI

struct DrawingView: View {
    @State private var startPoint: CGPoint = CGPoint.zero
    @State private var endedDrawPoints: [DrawPoints] = []
    @State private var selectedColor: DrawColor = .red
    @State private var canvasRect: CGRect = .zero
    @StateObject private var viewModel = DrawingViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Canvas(
                    endedDrawPoints: $endedDrawPoints,
                    selectedColor: $selectedColor,
                    canvasRect: $canvasRect
                )
                HStack(spacing: 10) {
                    Spacer()
                    Button(action: {
                        selectedColor = .red
                    }) {
                        Text("赤")
                            .frame(width: 80, height: 80, alignment: .center)
                            .background(Color.red)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                    }
                    
                    Button(action: {
                        selectedColor = .clear
                    }) {
                        Text("消しゴム")
                            .frame(width: 80, height: 80, alignment: .center)
                            .background(Color.red)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.gray, lineWidth: 2)
                            )
                    }
                    
                    Button(action: {
                        let captureImage = capture(rect: geometry.frame(in: .global))
                        viewModel.apply(inputs: .tappedCaptureButton(canvasRect: canvasRect, image: captureImage))
                    }) {
                        Text("保存")
                            .frame(width: 80, height: 80, alignment: .center)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.gray, lineWidth: 2)
                            )
                    }
                    Spacer()
                }
            }
            .alert(isPresented: $viewModel.isShowAlert) {
                Alert(title: Text(viewModel.alertTitle))
            }
        }
    }
}

extension DrawingView {
    func capture(rect: CGRect) -> UIImage {
        let window = UIWindow(frame: CGRect(origin: rect.origin, size: rect.size))
        let hosting = UIHostingController(rootView: self.body)
        hosting.view.frame = window.frame
        window.addSubview(hosting.view)
        window.makeKeyAndVisible()
        return hosting.view.renderdImage
    }
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView()
    }
}
