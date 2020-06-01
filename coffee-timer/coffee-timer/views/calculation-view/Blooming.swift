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
    
    var coffeeGround: Double
    var bloomRatio: Int
    var bloomTime: Int
    
    var body: some View {
      VStack{
        HStack{
          Text("Water for Bloom")
          Spacer()
            Text("\((coffeeGround * Double(bloomRatio)).toString(fractionDigits: 2)) g")
            .foregroundColor(.blue)
        }
        .padding(.vertical)
        HStack{
          Text("Time for Bloom")
          Spacer()
            Text(formatTime())
            .foregroundColor(.orange)
        }
        .padding(.vertical)
      }.onAppear{
        self.settings.formatTime()
        }
    }
    
    func formatTime() -> String{
        let tempMinutes = bloomTime / 60
        let tempSeconds = bloomTime % 60
        let minutes = String(format: "%02d", tempMinutes)
        let seconds = String(format: "%02d", tempSeconds)
        return minutes + ":" + seconds
    }
}

struct Blooming_Previews: PreviewProvider {
    static var previews: some View {
        Blooming(coffeeGround: 60.0, bloomRatio: 2, bloomTime: 45)
    }
}
