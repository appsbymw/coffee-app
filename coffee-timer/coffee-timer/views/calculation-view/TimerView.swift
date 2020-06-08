//
//  TimerView.swift
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
                .frame(minWidth: 0, maxWidth: .infinity)
                .font(.system(size: 50))
                .padding(.bottom, 50)
            if timerIsGoing {
                StopButton
            } else {
                StartButton
            }
            Spacer()
        }.font(.system(size: 50))
    }
    
    // MARK: Button for start
    private var StartButton: some View {
        Button(action:{
            print("Toggle timer")
            self.time[1] = String(format: "%02d", self.seconds)
            self.time[0] = String(format: "%02d", self.minutes)
            withAnimation{
                self.startTimer()
            }
        }){
            Text("Start")
                .padding(.all, 10)
                .background(Color.green)
                .foregroundColor(.black)
                .cornerRadius(10)
        }
        .transition(.scale)
    }
    
    // MARK: Button for stop
    private var StopButton: some View {
        Button(action:{
            print("Toggle timer")
            withAnimation{
                self.stopTimer()
            }
        }){
            Text("Stop")
                .padding(.all, 10)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .transition(.scale)
    }
    
    func startTimer(){
        
        timerIsGoing = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTime in
            if self.seconds >= 59{
                self.seconds = 0
                self.minutes = self.minutes + 1
                self.time[0] = String(format: "%02d", self.minutes)
            } else {
                self.seconds = self.seconds + 1
            }
            self.time[1] = String(format: "%02d", self.seconds)
        }
    }
    
    func stopTimer(){
        timerIsGoing = false
        timer?.invalidate()
        timer = nil
        self.minutes = 0
        self.seconds = 0
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
