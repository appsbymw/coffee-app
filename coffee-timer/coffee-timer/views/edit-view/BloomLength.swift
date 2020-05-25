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
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Bloom length")
                .font(.subheadline)
            Stepper(onIncrement: {
                self.increment()
            }, onDecrement: {
                self.decrement()
            }) {
                Text(settings.bloomTime)
                    .font(.title)
            }
        }
    }
    
    private func increment(){
        settings.bloomLength = settings.bloomLength + 1
    }
    
    private func decrement(){
        if settings.bloomLength > 2 {
            settings.bloomLength = settings.bloomLength - 1
        } else {
            settings.bloomLength = 1
        }
    }
}

struct BloomLength_Previews: PreviewProvider {
    static var previews: some View {
        BloomLength()
    }
}
