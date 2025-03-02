//
//  ContentView.swift
//  haloween
//
//  Created by Earbaj Md Saria on 1/3/25.
//

import SwiftUI


struct CardView: View{
    @State var isFaceUp: Bool = false
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text("🦅").font(.largeTitle)
            }else{
                shape.fill()
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
        
    }
}

struct ContentView: View {
    var body: some View {
        VStack{
            HStack{
                CardView()
                CardView()
                CardView()
                CardView()
            }
        }
        .padding(.horizontal).foregroundColor(.red)
        
      
    }
}

#Preview {
    ContentView().preferredColorScheme(.light)
}
