//
//  CardView.swift
//  swiftui-github-client
//
//  Created by 山田楓也 on 2021/01/04.
//

import SwiftUI

struct CardView: View {
    struct Input: Identifiable {
        let id: UUID = UUID()
        let iconImage: UIImage
        let title: String
        let language: String?
        let star: Int
        let description: String?
        let url: String
    }
    
    let input: Input
    
    init(input: Input) {
        self.input = input
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(uiImage: input.iconImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                .shadow(color: .gray, radius: 1, x: 0, y: 0)
            
            Text(input.title)
                .foregroundColor(.black)
                .font(.footnote)
                .fontWeight(.bold)
            HStack {
                Text(input.language ?? "")
                    .font(.footnote)
                    .foregroundColor(.gray)
                Spacer()
                
                HStack(spacing: 4) {
                    Image(systemName: "star")
                        .renderingMode(.template)
                        .foregroundColor(.gray)
                    Text(String(input.star))
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            
            Text(input.description ?? "")
                .foregroundColor(.black)
                .lineLimit(nil)
        }
        .padding(24)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 1)
        )
        .frame(minWidth: 140, minHeight: 180)
        .padding()
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(input: .init(iconImage: UIImage(named: "rocket")!,
                              title: "SwfitUI",
                              language: "Swift",
                              star: 10000,
                              description: "dddddddddddddddddddddddddddd",
                              url: "https:example.com")
        )
        .previewLayout(.sizeThatFits)
    }
}
