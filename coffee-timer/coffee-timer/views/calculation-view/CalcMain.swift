//
//  CalcMain.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/4/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct CalcMain: View {
    @State private var isSettingsShown = false
    @State var coffeeAmount: Double = 60.0
    @State private var chosenSetting: EditWindows = .coffeeAmount

    var body: some View {
      VStack {
        TitleBlock()
        Divider()
        Button(action:{
            self.isSettingsShown = true
            self.chosenSetting = .coffeeAmount
        }){
            CoffeeAmount(coffeeAmount: coffeeAmount)
        }
        WaterAmount(coffeeAmount: coffeeAmount)
        Divider()
        Blooming(coffeeAmount: coffeeAmount)
        Divider()
        TimerView()
          .padding(.top)
      }
      .padding(.horizontal)
      .sheet(isPresented: $isSettingsShown) {
        CoffeeAdjust(coffeeAmount: self.$coffeeAmount)
        }
    }
}

struct CalcMain_Previews: PreviewProvider {
    static var previews: some View {
        CalcMain()
    }
}
