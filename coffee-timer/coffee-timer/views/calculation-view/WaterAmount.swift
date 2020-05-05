//
//  WaterAmount.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/4/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct WaterAmount: View {
  
  var body: some View {
    HStack{
      Text("Water Amount")
      Spacer()
      Text("960 g")
        .foregroundColor(.blue)
    }
  }
}

struct WaterAmount_Previews: PreviewProvider {
  static var previews: some View {
    WaterAmount()
  }
}
