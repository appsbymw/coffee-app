//
//  WaterAmount.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/4/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct WaterAmount: View {
    @EnvironmentObject var settings: UserSettings
    
    var coffeeGround: Double
    var ratio: Double
    
    var body: some View {
        HStack{
            Text("Water Amount")
            Spacer()
            Text("\((coffeeGround * ratio).toString(fractionDigits: 2)) g")
                .foregroundColor(.blue)
        }
        .padding(.vertical)
    }
}

struct WaterAmount_Previews: PreviewProvider {
    static var previews: some View {
        WaterAmount(coffeeGround: 60.0, ratio: 16.0)
    }
}
