//
//  ContentView.swift
//  sensorUI
//
//  Created by 山田楓也 on 2021/03/28.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var sensor = SensorManager()
    
    var body: some View {
        VStack(spacing: 50) {
            VStack {
                SensorView(
                    sensorName: "Acceleration",
                    sensorValueX: sensor.xMotionStr,
                    sensorValueY: sensor.yMotionStr,
                    sensorValueZ: sensor.zMotionStr
                )
                SensorView(
                    sensorName: "Gyro",
                    sensorValueX: sensor.xGyroStr,
                    sensorValueY: sensor.yGyroStr,
                    sensorValueZ: sensor.zGyroStr
                )
                SensorView(
                    sensorName: "Magneto",
                    sensorValueX: sensor.xMagnetoStr,
                    sensorValueY: sensor.yMagnetoStr,
                    sensorValueZ: sensor.zMagnetoStr
                )
            }
            Button(action: {
                if self.sensor.isStarted {
                    self.sensor.stop()
                } else {
                    self.sensor.startMotion()
                    self.sensor.startGyro()
                    self.sensor.startMagnet()
                }
            }, label: {
                self.sensor.isStarted ? Text("STOP") : Text("START")
            })
            .frame(width: 80, height: 80)
            .background(Color(.lightGray))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
