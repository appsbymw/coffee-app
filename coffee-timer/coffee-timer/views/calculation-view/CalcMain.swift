//
//  CalcMain.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/4/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct CalcMain: View {
    var body: some View {
      VStack {
        TitleBlock()
        Divider()
        CoffeeAmount()
        WaterAmount()
        Divider()
        Blooming()
        Divider()
        Timer()
          .padding(.top)
      }
      .padding(.horizontal)
    }
}

struct CalcMain_Previews: PreviewProvider {
    static var previews: some View {
        CalcMain()
    }
}
