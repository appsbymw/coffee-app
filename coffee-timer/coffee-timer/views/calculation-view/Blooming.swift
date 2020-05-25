//
//  Blooming.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/4/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct Blooming: View {
    @EnvironmentObject var settings: UserSettings
    
    var coffeeAmount: Double
    
    var body: some View {
      VStack{
        HStack{
          Text("Water for Bloom")
          Spacer()
            Text("\((coffeeAmount * Double(settings.bloomRatio)).toString(fractionDigits: 2)) g")
            .foregroundColor(.blue)
        }
        .padding(.vertical)
        HStack{
          Text("Time for Bloom")
          Spacer()
            Text(settings.bloomTime)
            .foregroundColor(.orange)
        }
        .padding(.vertical)
      }.onAppear{
        self.settings.formatTime()
        }
    }
}

struct Blooming_Previews: PreviewProvider {
    static var previews: some View {
        Blooming(coffeeAmount: 60.0)
    }
}
