//
//  RatioEdit.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/25/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct RatioEdit: View {
    @Binding var waterAmount: Int
    
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
                Text("1g")
                    .foregroundColor(coffeeColor)
                    + Text(" to ")
                    + Text("\(waterAmount)g")
                        .font(.title)
                        .foregroundColor(.blue)
                Stepper(onIncrement: {
                    self.waterAmount = self.waterAmount + 1
                }, onDecrement: {
                    self.decrementWater()
                }) {
                    Text("grams of coffee")
                }
            }
        }.labelsHidden()
    }
    
    private func decrementWater(){
        if waterAmount > 2 {
            waterAmount = waterAmount - 1
        } else {
            waterAmount = 1
        }
    }
}

//struct RatioEdit_Previews: PreviewProvider {
//    static var previews: some View {
//        RatioEdit(waterAmount: <#Binding<Int>#>).environmentObject(UserSettings())
//    }
//}
