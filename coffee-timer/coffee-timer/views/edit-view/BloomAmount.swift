//
//  BloomAmount.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/25/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct BloomAmount: View {
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Bloom water amount")
                .font(.subheadline)
                .padding(.bottom)
            HStack{
                VStack(alignment: .leading){
                    Stepper(onIncrement: {
                        self.increment()
                    }, onDecrement: {
                        self.decrement()
                    }) {
                        Text("\(settings.bloomRatio)x")
                            .font(.title) +
                            Text(" the coffee amount")
                    }
                }
            }
        }
    }
    
    private func increment(){
        settings.bloomRatio = settings.bloomRatio + 1
    }
    private func decrement(){
        if settings.bloomRatio > 2 {
            settings.bloomRatio = settings.bloomRatio - 1
        } else {
            settings.bloomRatio = 1
        }
    }
}

struct BloomAmount_Previews: PreviewProvider {
    static var previews: some View {
        BloomAmount()
    }
}
