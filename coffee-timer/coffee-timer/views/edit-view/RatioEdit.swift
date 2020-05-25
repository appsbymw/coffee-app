//
//  RatioEdit.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/25/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct RatioEdit: View {
    @State private var coffeeAmount = 16
    @State private var waterAmount = 1
    
    let coffeeColor = Color.init(UIColor(named: "coffee")!)
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Coffee").foregroundColor(coffeeColor) +
                    Text(" to ") +
                    Text("Water").foregroundColor(.blue) +
                    Text(" ratio")
                Spacer()
            }.font(.subheadline)
            HStack{
                Spacer()
                VStack{
                    Text("\(coffeeAmount) g")
                        .font(.title)
                        .foregroundColor(coffeeColor)
                    Stepper(onIncrement: {
                        self.coffeeAmount = self.coffeeAmount + 1
                    }, onDecrement: {
                        self.decrementCoffee()
                    }) {
                        Text("grams of coffee")
                    }
                }
                Text("to").padding(.all)
                VStack{
                    Text("\(waterAmount) g")
                        .font(.title)
                        .foregroundColor(.blue)
                    Stepper(onIncrement: {
                        self.waterAmount = self.waterAmount + 1
                    }, onDecrement: {
                        self.decrementWater()
                    }) {
                        Text("grams of water")
                    }
                }
                Spacer()
            }
            .padding(.all)
        }.labelsHidden()
    }
    
    private func decrementWater(){
        if waterAmount > 2 {
            waterAmount = waterAmount - 1
        } else {
            waterAmount = 1
        }
    }
    
    private func decrementCoffee(){
        if coffeeAmount > 2 {
            coffeeAmount = coffeeAmount - 1
        } else {
            coffeeAmount = 1
        }
    }
}

struct RatioEdit_Previews: PreviewProvider {
    static var previews: some View {
        RatioEdit()
    }
}
