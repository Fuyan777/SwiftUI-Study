//
//  ContentView.swift
//  syntaxUI
//
//  Created by 山田楓也 on 2021/05/12.
//

import SwiftUI

struct ContentView: View {
    enum opType: CaseIterable {
        case sound, map, stop
    }
    
    enum valueType {
        case value1
        case value(Int)
    }
    
    let optype: opType = .sound
    let valuetype: valueType = .value(1)
    let opA: Any? = "a"
    let opB = Optional("b")
    
    init() {
//        showIflet()
//        showIfcase()
//        showGuardElse()
        showWhere()
    }
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
    
    // if-let文：値の有無による分岐
    func showIflet() {
        if let opA = opA as? String, let opB = opB {
            print("opA: \(opA), opB: \(opB)")
        } else {
            print("値なし")
        }
    }
    
    // if-case文：パターンマッチによる
    func showIfcase() {
        let value = 6
        if case 1...10 = value {
            print("pattern success: 1")
        }
        
        if case .sound = optype {
            print("pattern success: 2")
        }
    }
    
    // guard文：条件不成立時の早期退出する処理
    func showGuardElse() {
        guard opA != nil else {
            print("guard")
            return
        }
        print("non-guard")
    }
    
    func showSwitch() {
        switch optype {
        case .sound:
            print("map")
        default:
            print("other")//網羅生を保証
        // 基本的には個々のケースを利用するべき
        }
    }
    
    // where: ケースににマッチする条件
    func showWhere() {
        switch valuetype {
        case .value(let a) where a > 10:
            print("10以上やんww")
        case .value1:
            print("ちゃう")
        default:
            print("default")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
