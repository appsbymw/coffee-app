//
//  RatioEdit.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/25/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct RatioEdit: View {
    @EnvironmentObject var settings: UserSettings
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
                    Text("\(settings.coffeeAmount) g")
                        .font(.title)
                        .foregroundColor(coffeeColor)
                    Stepper(onIncrement: {
                        self.settings.coffeeAmount = self.settings.coffeeAmount + 1
                    }, onDecrement: {
                        self.decrementCoffee()
                    }) {
                        Text("grams of coffee")
                    }
                }
                Text("to").padding(.all)
                VStack{
                    Text("\(settings.waterAmount) g")
                        .font(.title)
                        .foregroundColor(.blue)
                }
                Spacer()
            }
            .padding(.all)
        }.labelsHidden()
    }
    
    private func decrementWater(){
        if settings.waterAmount > 2 {
            settings.waterAmount = settings.waterAmount - 1
        } else {
            settings.waterAmount = 1
        }
    }
    
    private func decrementCoffee(){
        if settings.coffeeAmount > 2 {
            settings.coffeeAmount = settings.coffeeAmount - 1
        } else {
            settings.coffeeAmount = 1
        }
    }
}

struct RatioEdit_Previews: PreviewProvider {
    static var previews: some View {
        RatioEdit().environmentObject(UserSettings())
    }
}
