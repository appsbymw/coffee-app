//
//  CoffeeAmount.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/4/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct CoffeeAmount: View {
  let coffee = Color.init(UIColor(named: "coffee")!)
  
  var body: some View {
    HStack{
      Text("Coffee ground")
      Spacer()
      Text("60 g")
        .foregroundColor(coffee)
    }
  }
}

struct CoffeeAmount_Previews: PreviewProvider {
  static var previews: some View {
    CoffeeAmount()
  }
}
