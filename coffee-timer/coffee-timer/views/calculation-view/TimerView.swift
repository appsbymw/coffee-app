//
//  TimerView.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/4/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    @Environment(\.managedObjectContext) var moc
    let bmm = BrewMethodManager()
    
    var brewMethod: BrewMethod
    
    var bloomTime: Int = 45
    
    @State private var time = ["00","00"] // [MINUTES, SECONDS]
    @State private var minutes = 0
    @State private var seconds = 0
    @State private var totalSeconds = 0
    @State private var timerIsGoing = false
    @State private var timer: Timer? = nil
    
    var body: some View {
        VStack {
            if totalSeconds >= bloomTime {
                Text("\(time[0]):\(time[1])")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(.system(size: 50, design: .monospaced))
                    .padding(.bottom, 50)
                    .foregroundColor(.orange)
            } else {
                Text("\(time[0]):\(time[1])")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(.system(size: 50, design: .monospaced))
                    .padding(.bottom, 50)
            }
            if timerIsGoing {
                StopButton
            } else {
                StartButton
            }
            Spacer()
        }
        .font(.system(size: 50))
        .onAppear{
            self.setValues()
        }
        .onDisappear{
            self.brewMethod.isTimerGoing = self.timerIsGoing
            self.brewMethod.secondsUsed = Int64(self.totalSeconds)
            self.brewMethod.timerLastUpdated = Date()
            self.bmm.udateTimerOptions(context: self.moc, updatedBrew: self.brewMethod)
        }
    }
    
    // MARK: Button for start
    private var StartButton: some View {
        Button(action:{
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
        brewMethod.isTimerGoing = timerIsGoing
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTime in
            if self.seconds >= 59{
                self.seconds = 0
                self.minutes = self.minutes + 1
                self.time[0] = String(format: "%02d", self.minutes)
            } else {
                self.seconds = self.seconds + 1
            }
            self.totalSeconds = self.totalSeconds + 1
            self.time[1] = String(format: "%02d", self.seconds)
            self.brewMethod.secondsUsed = Int64(self.totalSeconds)
            self.brewMethod.timerLastUpdated = Date()
            self.bmm.udateTimerOptions(context: self.moc, updatedBrew: self.brewMethod)
        }
    }
    
    func stopTimer(){
        timerIsGoing = false
        timer?.invalidate()
        timer = nil
        self.minutes = 0
        self.seconds = 0
        self.totalSeconds = 0
        brewMethod.timerLastUpdated = Date()
        brewMethod.secondsUsed = 0
        brewMethod.isTimerGoing = false
        bmm.udateTimerOptions(context: self.moc, updatedBrew: self.brewMethod)
    }
    
    func setValues(){
        timerIsGoing = brewMethod.isTimerGoing
        
        if timerIsGoing == false {
            totalSeconds = 0
        } else {
            totalSeconds = Int(brewMethod.secondsUsed)
        }
        
        // format time
        minutes = totalSeconds / 60
        seconds = totalSeconds % 60
        
        time[0] = String(format: "%02d", self.minutes)
        time[1] = String(format: "%02d", self.seconds)
        
        if timerIsGoing == true {
            startTimer()
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(brewMethod: BrewMethod())
    }
}
