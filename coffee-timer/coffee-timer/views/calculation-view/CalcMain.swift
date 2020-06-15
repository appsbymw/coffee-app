//
//  CalcMain.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/4/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct CalcMain: View {
    @Environment(\.managedObjectContext) var moc
    @EnvironmentObject var settings: UserSettings
    @State var isSettingsShown = false
    @State var coffeeAmount: Double = 60.0
    @State var chosenSetting: EditWindows = .coffeeAmount
    
    let coffeeColor = Color(UIColor(named: "coffee")!)
    
    var brewMethod: BrewMethod
    
    var body: some View {
        VStack {
            HStack{
                VStack{
                    Text("1g")
                    Text("coffee")
                }
                .foregroundColor(coffeeColor)
                Text(" : ")
                VStack{
                    Text("\(brewMethod.waterRatio)g")
                        Text("water")
                }.foregroundColor(.blue)
            }
            Button(action:{
                self.isSettingsShown = true
                self.chosenSetting = .coffeeAmount
            }){
                CoffeeAmount(coffeeAmount: brewMethod.coffeeGround)
            }
            WaterAmount(coffeeGround: brewMethod.coffeeGround, ratio: Double(brewMethod.waterRatio))
            Divider()
            Blooming(coffeeGround: brewMethod.coffeeGround,
                     bloomRatio: Int(brewMethod.bloomRatio),
                     bloomTime: Int(brewMethod.bloomLength))
            Divider()
            Button(action: {
                self.isSettingsShown = true
                self.chosenSetting = .brewNotes
            }){
                BrewNoteSection(brewNotes: brewMethod.notes)
            }
            Divider()
            TimerView(bloomTime: Int(brewMethod.bloomLength))
                .padding(.top)
        }
        .padding(.horizontal)
        .navigationBarTitle(Text(brewMethod.title ?? "☕"), displayMode: .large)
        .navigationBarItems(trailing: EditButton)
        .sheet(isPresented: $isSettingsShown) {
            if self.chosenSetting == .coffeeAmount {
                CoffeeAdjust(brewMethod: self.brewMethod, newAmount: "\(self.brewMethod.coffeeGround)")
                    .environment(\.managedObjectContext, self.moc)
            }else if self.chosenSetting == .brewNotes{
                NotesAdjust(brewMethod: self.brewMethod)
                    .environment(\.managedObjectContext, self.moc)
            } else {
                MainEdit(brewMethod: self.brewMethod)
                    .environment(\.managedObjectContext, self.moc)
            }
        }
    }
    var EditButton: some View {
        VStack{
            Button(action: {
                print("Toggle edit")
                self.chosenSetting = .brewSettings
                self.isSettingsShown = true
                
            }){
                Text("Edit")
                    .foregroundColor(.red)
            }.padding(.bottom)
        }
    }
}

struct CalcMain_Previews: PreviewProvider {
    static var previews: some View {
        CalcMain(brewMethod: BrewMethod())
    }
}
