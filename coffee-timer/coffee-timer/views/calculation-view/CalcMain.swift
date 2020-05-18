//
//  CalcMain.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/4/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct CalcMain: View {
    @State private var isCoffeeAmountEditable = false
    @State var coffeeAmount: Double = 60.0
    
    var body: some View {
      VStack {
        TitleBlock()
        Divider()
        Button(action:{
            self.isCoffeeAmountEditable.toggle()
        }){
            CoffeeAmount(coffeeAmount: coffeeAmount)
                .padding(.vertical)
        }
        WaterAmount(coffeeAmount: coffeeAmount)
        Divider()
        Blooming(coffeeAmount: coffeeAmount)
        Divider()
        TimerView()
          .padding(.top)
      }
      .padding(.horizontal)
      .sheet(isPresented: $isCoffeeAmountEditable) {
        CoffeeAdjust(coffeeAmount: self.$coffeeAmount)
        }
    }
}

struct CalcMain_Previews: PreviewProvider {
    static var previews: some View {
        CalcMain()
    }
}
