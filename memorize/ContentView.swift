//
//  ContentView.swift
//  memorize
//
//  Created by 11344243 on 2026/3/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View{
        HStack{
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .padding()
        .foregroundStyle(.orange)
    }
}

struct CardView: View {
    var isFaceUP: Bool = true
    var body: some View{
        ZStack {
            if isFaceUP{
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(lineWidth: 3)
                Text("hello")
            }
            else{
                RoundedRectangle(cornerRadius: 20)
            }
        }
    }
}

#Preview {
    ContentView()
}
