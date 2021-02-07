//
//  widget_wid.swift
//  widget_wid
//
//  Created by 山田楓也 on 2021/02/07.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct widget_widEntryView : View {
    var entry: Provider.Entry
    var program = [
        "運コミュ",
        "Radio Puya",
        "ラジテクFM - RadiotalkTechFM"
    ]
    
    var body: some View {
        ZStack {
            Color(red: 1.0, green: 0.790, blue: 0.0)
            VStack {
                Rectangle()
                    .foregroundColor(.white)
                    .clipShape(ContainerRelativeShape())
                    .overlay(
                        HStack(alignment: .center, spacing: 30) {
                            Text("究極の2択筋トレ\n〜決めるのは〜")
                                .font(.title3)
                                .foregroundColor(Color(red: 0.078, green: 0.233, blue: 0.280))
                            Image("hokkaido")
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                    )
                
                HStack(alignment: .center, spacing: 110) {
                    Image("radio")
                        .resizable()
                        .frame(width: 90, height: 30)
                    Text("新着トークをチェック！")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.078, green: 0.233, blue: 0.280))
                }
            }
            .font(.body)
            .foregroundColor(.white)
            .padding(8)
            .shadow(radius: 4)
            //                Text(entry.date, style: .time)
        }
    }
}

@main
struct widget_wid: Widget {
    let kind: String = "widget_wid"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            widget_widEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct widget_wid_Previews: PreviewProvider {
    static var previews: some View {
        widget_widEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

//ForEach(0..<program.count) { itemNum in
//    VStack(alignment: .leading, spacing: 4) {
//        HStack(alignment: .center, spacing: 8) {
//            Text(program[itemNum])
//                .font(.caption)
//                .foregroundColor(.black)
//        }
//        Divider()
//    }
//}
