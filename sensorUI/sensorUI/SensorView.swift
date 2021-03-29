//
//  SensorView.swift
//  sensorUI
//
//  Created by 山田楓也 on 2021/03/29.
//

import SwiftUI

struct SensorView: View {
    var sensorName: String
    var sensorValueX: String
    var sensorValueY: String
    var sensorValueZ: String
    
    var body: some View {
        VStack {
            Text(sensorName)
            VStack(alignment: .leading, spacing: 8) {
                Text("X: " + sensorValueX)
                Text("Y: " + sensorValueY)
                Text("Z: " + sensorValueZ)
            }
            .frame(width: 300)
            .padding()
            .background(Color(.lightGray))
        }
        .frame(width: 350, height: 150)
        .padding()
    }
}

struct SensorComponentView_Previews: PreviewProvider {
    static var previews: some View {
        SensorView(
            sensorName: "Gyro",
            sensorValueX: "0.2222",
            sensorValueY: "0.4444444",
            sensorValueZ: "0.2222211"
        )
        .previewLayout(.sizeThatFits)
    }
}
