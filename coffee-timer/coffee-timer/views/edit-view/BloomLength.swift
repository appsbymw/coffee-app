//
//  BloomLength.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/25/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct BloomLength: View {
    @State private var bloomLength: Int = 90
    @State private var minutes: String = "00"
    @State private var seconds: String = "00"
    var body: some View {
        VStack(alignment: .leading){
            Text("Bloom length")
                .font(.subheadline)
            Stepper(onIncrement: {
                self.increment()
            }, onDecrement: {
                self.decrement()
            }) {
                Text("\(minutes):\(seconds)")
                    .font(.title)
            }
        }.onAppear{
            self.formatTime()
        }
    }
    
    private func increment(){
        bloomLength = bloomLength + 1
        formatTime()
    }
    
    private func decrement(){
        if bloomLength > 2 {
            bloomLength = bloomLength - 1
        } else {
            bloomLength = 1
        }
        formatTime()
    }
    
    private func formatTime(){
        let tempMinutes = bloomLength / 60
        let tempSeconds = bloomLength % 60
        minutes = String(format: "%02d", tempMinutes)
        seconds = String(format: "%02d", tempSeconds)
    }
}

struct BloomLength_Previews: PreviewProvider {
    static var previews: some View {
        BloomLength()
    }
}
