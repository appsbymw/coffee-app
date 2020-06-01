//
//  BloomLength.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/25/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct BloomLength: View {
    @EnvironmentObject var settings: UserSettings
    @Binding var bloomLength: Int
    
    @State private var time: String = ""
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Bloom length")
                .font(.subheadline)
            Stepper(onIncrement: {
                self.increment()
            }, onDecrement: {
                self.decrement()
            }) {
                Text(time)
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
    
    func formatTime() {
        let tempMinutes = bloomLength / 60
        let tempSeconds = bloomLength % 60
        let minutes = String(format: "%02d", tempMinutes)
        let seconds = String(format: "%02d", tempSeconds)
        time = minutes + ":" + seconds
    }
}

//struct BloomLength_Previews: PreviewProvider {
//    static var previews: some View {
//        BloomLength()
//    }
//}
