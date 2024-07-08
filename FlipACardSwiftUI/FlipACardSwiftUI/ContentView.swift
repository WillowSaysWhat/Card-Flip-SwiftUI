//
//  ContentView.swift
//  FlipACardSwiftUI
//
//  Created by Huw Williams on 08/07/2024.
//
// This is how to code a card rotation in SwiftUI.

import SwiftUI

struct ContentView: View {
    
    @State var isFlipped: Bool = false
    
    let width: CGFloat = 300
    let height: CGFloat = 200
    
    var body: some View {
        ZStack {
            
            
            RoundedRectangle(cornerRadius: 15) // this shape is hidden because it is at 90 degrees.
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .frame(width: width, height: height)
                .rotation3DEffect(
                    .degrees(isFlipped ? 0 : -90),
                     axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/ // the rotation is on the y-axis
                ).animation(isFlipped ? .linear(duration: 0.15).delay(0.35) : .linear, value: isFlipped)
               
                
            
            
            RoundedRectangle(cornerRadius: 15) // you can see this one.
                .foregroundColor(.red)
                .frame(width: width, height: height)
                .rotation3DEffect( // this is the front 90 degrees in the card flip
                    .degrees(isFlipped ? 90 : 0),
                    axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
                ).animation(isFlipped ? .linear : .linear(duration: 0.15).delay(0.35), value: isFlipped)
                
            
            
        }
        .padding(.top, 100)
        .onTapGesture { // this bool is toggled when the rectangle is tapped.
            isFlipped.toggle()
        }
    }
}

#Preview {
    ContentView()
}
