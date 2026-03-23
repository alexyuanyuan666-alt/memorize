//
//  ContentView.swift
//  memorize
//
//  Created by 11344243 on 2026/3/16.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["A" ,"B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O"]
    
    @State var emojiCount = 6
    
    var body: some View{
        VStack{
            HStack{
                ForEach(emojis[0..<emojiCount], id: \.self){emojis in
                    CardView(content: emojis)
                }
            }
            
            HStack {
                Button(action: {
                    if emojiCount > 1 {
                        emojiCount -= 1
                    }
                }, label: {
                    Image(systemName: "minus.circle")
                })
                
                Spacer()
                
                Button(action: {
                    if emojiCount < emojis.count{
                        emojiCount += 1
                    }
                }, label: {
                    Image(systemName: "plus.circle")
                })
            }
        }
        .padding()
        .foregroundStyle(.orange)
    }
    
}

struct CardView: View {
    @State var isFaceUP: Bool = true
    var content:String
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUP{
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }
            else{
                shape
            }
        }
        .onTapGesture {
            isFaceUP = !isFaceUP
        }
    }
}

#Preview {
    ContentView()
}
