//
//  CoffeeAmountEdit.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 6/1/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct CoffeeAmountEdit: View {
    let coffeeColor = Color(UIColor(named: "coffee")!)
    
    @Binding var coffeeGround: String
    
    
    var body: some View {
        HStack{
            Text("Coffee Amount")
            Spacer()
            TextField("New Coffee Amount", text: $coffeeGround)
                .keyboardType(.decimalPad)
                .multilineTextAlignment(.trailing)
                .foregroundColor(coffeeColor)
                .font(.title)
        }
    }
}

//struct CoffeeAmountEdit_Previews: PreviewProvider {
//    static var previews: some View {
//        CoffeeAmountEdit()
//    }
//}
