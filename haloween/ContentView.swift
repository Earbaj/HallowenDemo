//
//  ContentView.swift
//  haloween
//
//  Created by Earbaj Md Saria on 1/3/25.
//

import SwiftUI


struct CardView: View{
    var content: String
    @State var isFaceUp: Bool = false
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(content).font(.largeTitle)
            }else{
                shape.fill()
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
        
    }
}

struct ContentView: View {
    var emojis = ["🚗","🚕","🚙","🚌","🚎","🏎️","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🚲","🛴","🛵","🏍️","🚤","⛵","🛥️","🚢","✈️","🛩️","🚁","🚂","🚆","🚊","🚇","🚉","🚀"]
    @State var countEmojis = 4
    var body: some View {
        VStack{
            HStack{
                ForEach(emojis[0..<countEmojis], id: \.self){ emoji in
                    CardView(content: emoji)
                }
               
            }
            HStack{
                Button("+"){
                    if countEmojis < emojis.count {
                        countEmojis += 1
                    }
                }
                .font(.largeTitle).foregroundColor(.black)
                .frame(width: 50,height: 50)
                .background(Circle().fill(.white)).shadow(radius: 20)
                Spacer()
                Button("-"){
                    if countEmojis > 1 {
                        countEmojis -= 1
                    }
                }.font(.largeTitle).foregroundColor(.black)
                    .frame(width: 50,height: 50)
                    .background(Circle().fill(.white)).shadow(radius: 20)
            }
            
        }
        .padding(.horizontal).foregroundColor(.red)
        
      
    }
}

#Preview {
    ContentView().preferredColorScheme(.light)
}
