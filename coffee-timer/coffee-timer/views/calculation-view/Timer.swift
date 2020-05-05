//
//  Timer.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/4/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct Timer: View {
  var body: some View {
    VStack {
      Text("00:00")
        .font(.title)
        .padding(.bottom, 50)
      Button(action:{
        print("Toggle timer")
      }){
        Text("Start/Stop")
          .padding(.all, 10)
          .background(Color.green)
          .foregroundColor(.white)
          .cornerRadius(10)
      }
      Spacer()
    }
  }
}

struct Timer_Previews: PreviewProvider {
  static var previews: some View {
    Timer()
  }
}
