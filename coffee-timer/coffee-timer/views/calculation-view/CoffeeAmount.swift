//
//  CoffeeAmount.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/4/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct CoffeeAmount: View {
    
    let coffeeColor = Color.init(UIColor(named: "coffee")!)
    
    var coffeeAmount: Double
    
    var body: some View {
        HStack{
            Text("Coffee ground")
                .foregroundColor(.primary)
            Spacer()
            Text("\(coffeeAmount.toString(fractionDigits: 2)) g")
                .foregroundColor(coffeeColor)
        }
    }
}

struct CoffeeAmount_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeAmount(coffeeAmount: 60.5)
    }
}
