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
    
    @Binding var bloomRatio: Int
    
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
                        Text("\(bloomRatio)x")
                            .font(.title) +
                            Text(" the coffee amount")
                    }
                }
            }
        }
    }
    
    private func increment(){
        bloomRatio = bloomRatio + 1
    }
    private func decrement(){
        if bloomRatio > 2 {
            bloomRatio = bloomRatio - 1
        } else {
            bloomRatio = 1
        }
    }
}
//
//struct BloomAmount_Previews: PreviewProvider {
//    static var previews: some View {
//        BloomAmount()
//    }
//}
