//
//  Blooming.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/4/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct Blooming: View {
    var body: some View {
      VStack{
        HStack{
          Text("Water for Bloom")
          Spacer()
          Text("120 g")
            .foregroundColor(.blue)
        }
        HStack{
          Text("Time for Bloom")
          Spacer()
          Text("01:30")
            .foregroundColor(.orange)
        }
      }
    }
}

struct Blooming_Previews: PreviewProvider {
    static var previews: some View {
        Blooming()
    }
}