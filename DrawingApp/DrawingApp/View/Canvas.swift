//
//  Canvas.swift
//  DrawingApp
//
//  Created by 山田楓也 on 2021/01/10.
//

import SwiftUI

struct Canvas: View {
    @State private var tmpDrawPoints: DrawPoints = DrawPoints(points: [], color: .red)
    @Binding var endedDrawPoints: [DrawPoints]
    @Binding var selectedColor: DrawColor
    @Binding var canvasRect: CGRect
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .foregroundColor(Color.white)
                    .border(Color.black, width: 2)
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged({ value in
                                tmpDrawPoints.points.append(value.location)
                                tmpDrawPoints.color = selectedColor.color
                            })
                            .onEnded({ _ in
                                endedDrawPoints.append(tmpDrawPoints)
                                tmpDrawPoints = DrawPoints(points: [], color: selectedColor.color)
                            })
                    )
                    .onAppear {
                        canvasRect = geometry.frame(in: .local)
                    }
                
                ForEach(endedDrawPoints) { data in
                    Path { path in
                        path.addLines(data.points)
                    }
                    .stroke(data.color, lineWidth: 10)
                }
                Path { path in
                    path.addLines(tmpDrawPoints.points)
                }
                .stroke(tmpDrawPoints.color, lineWidth: 10)
            }
        }
    }
}
