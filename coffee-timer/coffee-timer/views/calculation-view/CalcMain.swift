//
//  CalcMain.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/4/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct CalcMain: View {
    @EnvironmentObject var settings: UserSettings
    @State var isSettingsShown = false
    @State var coffeeAmount: Double = 60.0
    @State var chosenSetting: EditWindows = .coffeeAmount

    var body: some View {
      VStack {
        TitleBlock(isSettingShown: $isSettingsShown, chosenSetting: $chosenSetting)
        Divider()
        Button(action:{
            self.isSettingsShown = true
            self.chosenSetting = .coffeeAmount
        }){
            CoffeeAmount(coffeeAmount: settings.coffeeGround)
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
        if self.chosenSetting == .coffeeAmount {
            CoffeeAdjust()
                .environmentObject(self.settings)
        } else {
            MainEdit().environmentObject(self.settings)
        }
        }
    }
}

struct CalcMain_Previews: PreviewProvider {
    static var previews: some View {
        CalcMain()
    }
}
