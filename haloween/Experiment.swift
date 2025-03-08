//
//  Untitled.swift
//  haloween
//
//  Created by Earbaj Md Saria on 7/3/25.
//

import SwiftUI

struct rectangel:View {
    var content:String
    @State var isCardShow:Bool = false
    var body: some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if isCardShow {
                shape.fill().foregroundStyle(.white)
                shape.stroke(lineWidth: 3).foregroundColor(.green)
                Text(content).font(.largeTitle)
            }else{
                shape.fill(.blue)
            }
            
        }.onTapGesture {
            isCardShow = !isCardShow
        }
    }
}

struct Experiment: View{
    var emojis = ["🚗","🚕","🚙","🚌","🚎","🏎️","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🚲","🛴","🛵","🏍️","🚤","⛵","🛥️","🚢","✈️","🛩️","🚁","🚂","🚆","🚊","🚇","🚉","🚀"]
    @State var contentItem = 4
    @Environment(\.colorScheme) var colorSceme
    var body:some View{
        VStack{
            HStack{
                ForEach(emojis[0..<contentItem], id: \.self){ emoji in
                    rectangel(content: emoji)
                }
                
            }
            HStack{
                plusButton
                Spacer()
                minusButton
            }
        }.padding()
        
    }
    var plusButton:some View{
        Button(action:{
            if contentItem < emojis.count{
                contentItem += 1
            }
        }){
            Image(systemName: "plus.circle").font(.largeTitle).foregroundColor(
                colorSceme == .dark ? .white : .black)
        }
    }
    var minusButton:some View{
        Button(action:{
            if contentItem > 1{
                contentItem -= 1
            }
        }){
            Image(systemName: "minus.circle").font(.largeTitle).foregroundColor(colorSceme == .dark ? .white :.black)
        }
    }
}

#Preview {
    Experiment().preferredColorScheme(.dark)
}
