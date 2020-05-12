//
//  CoffeeAdjust.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/11/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct CoffeeAdjust: View {
    @Binding var coffeeAmount: Double
    @State private var newAmount = ""
    
    var body: some View {
        VStack{
            HStack{
                Text("New Coffee Amount")
                Spacer()
                TextField("New Coffee Amount",
                          text: Binding(get:{
                            self.newAmount
                          }, set: { (newValue) in
                            self.newAmount = newValue
                            self.coffeeAmount = Double(self.newAmount) ?? 0.0
                          }))
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.trailing)
            }
            .onAppear{
                self.newAmount = "\(self.coffeeAmount)"
            }
            .padding(.horizontal)
        }
    }
}

struct CoffeeAdjust_Previews: PreviewProvider {
    @State static var amt: Double = 10.0
    static var previews: some View {
        CoffeeAdjust(coffeeAmount: $amt)
    }
}
