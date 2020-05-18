//
//  Timer.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/4/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    
    @State private var time = ["00","00"] // [MINUTES, SECONDS]
    @State private var minutes = 0
    @State private var seconds = 0
    @State private var timerIsGoing = false
    @State private var timer: Timer? = nil
    
    var body: some View {
        VStack {
            Text("\(time[0]):\(time[1])")
                .font(.title)
                .padding(.bottom, 50)
            Button(action:{
                print("Toggle timer")
            }){
                Text("Start/Stop")
                    .padding(.all, 10)
                    .background(Color.green)
                    .foregroundColor(.primary)
                    .cornerRadius(10)
            }
            Spacer()
        }
    }
    
    func startTimer(){
        timerIsGoing = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
