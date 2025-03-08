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
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }else{
                shape.fill(.green)
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
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
                    ForEach(emojis[0..<countEmojis], id: \.self){ emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                   
                }
            }
            Spacer()
            HStack{
                ButtonAdd
                Spacer()
                ButtonMinus
                
            }.padding(.horizontal)
            
        }
        .padding(.horizontal).foregroundColor(.red)
        
    
    }
    var ButtonAdd: some View{
        Button(action: {
            if countEmojis < emojis.count {
                countEmojis += 1
            }
        }) {
            Image(systemName: "plus.circle")
                .font(.largeTitle)
                .foregroundColor(.black)
        }
    }
    var ButtonMinus:some View{
       Button(action: {
            if countEmojis > 1 {
                countEmojis -= 1
            }
        }){
            Image(systemName: "minus.circle")
                .font(.largeTitle)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    ContentView().preferredColorScheme(.light)
}

