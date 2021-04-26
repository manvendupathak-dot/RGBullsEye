//
//  ContentView.swift
//  practise
//
//  Created by Manvendu Pathak on 24/04/21.
//

import SwiftUI

struct ContentView: View {
 
//MARK: - PROPERTIES

    let rTarget = Double.random(in: 0..<1)
    let gtarget = Double.random(in: 0..<1)
    let btarget = Double.random(in: 0..<1)
    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double
    @State var showAlert = false
    
    
    func computeScore() -> Int {
        let rDiff = rGuess - rTarget
        let gDiff = gGuess - gtarget
        let bDiff = bGuess - btarget
        let diff = sqrt(rDiff * rDiff + gDiff + bDiff * bDiff)
        return Int((1.0 - diff) * 100.0 + 0.5)
    }
   
//MARK:- BODY
    
    var body: some View {
      VStack {
            HStack {
                VStack {
                    Color(red: rTarget, green: gtarget, blue: btarget)
                    Text("Match this code")
                 }
                VStack{
                    Color(red: rGuess, green: gGuess, blue: bGuess)
                    Text("R:\(Int(rGuess * 255.0))  "
                        + "G:\(Int(gGuess * 255.0))  "
                         + "B:\(Int(bGuess * 255.0))  ")
                }
            }
        Button(action: {self.showAlert = true}) {
                   Text("Hit Me")
        }.alert(isPresented: $showAlert) {
            Alert(title: Text("Your Score "),message: Text(String(computeScore())))
        }.padding()
      
        
        ColorSlider(value: $rGuess, textColor: .red)
        ColorSlider(value: $gGuess, textColor: .green)
        ColorSlider(value: $bGuess, textColor: .blue)
    }
      }
    
}
    
//MARK:- PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rGuess: 0.8, gGuess: 0.3, bGuess: 0.7)
            .previewLayout(.fixed(width: 568, height: 320))
         }
}







struct ColorSlider: View {
    
    @Binding var value : Double
    var textColor: Color
    var body: some View {
        HStack{
            Text("0").foregroundColor(textColor)
            Slider(value: $value)
            Text("255").foregroundColor(textColor)
        }.padding(.horizontal)
    }
}
