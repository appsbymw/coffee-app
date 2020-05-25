//
//  CoffeeAdjust.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/11/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct CoffeeAdjust: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var settings: UserSettings
    
    @State private var newAmount = ""
    
    let coffeeColor = Color.init(UIColor(named: "coffee")!)
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Text("Cancel")
                        .foregroundColor(.red)
                }
            }
            .padding(.top)
            Spacer()
            HStack{
                Text("New Coffee Amount")
                Spacer()
                TextField("New Coffee Amount", text: $newAmount)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(coffeeColor)
            }
            
            HStack{
                Spacer()
                Button(action: {
                    self.saveNewValue()
                }){
                    Text("Save")
                        .padding(.all, 10)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.vertical)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .onAppear{
            self.newAmount = "\(self.settings.coffeeGround)"
        }
    }
    
    func saveNewValue(){
        settings.coffeeGround = Double(newAmount) ?? 0.0
        presentationMode.wrappedValue.dismiss()
    }
}

struct CoffeeAdjust_Previews: PreviewProvider {
    @State static var amt: Double = 10.0
    static var previews: some View {
        CoffeeAdjust()
    }
}
