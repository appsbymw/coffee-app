//
//  TitleBlock.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/4/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct TitleBlock: View {
    @EnvironmentObject var settings: UserSettings
    @Binding var isSettingShown: Bool
    @Binding var chosenSetting: EditWindows
    
    var body: some View {
        HStack {
            Text("Chemex")
                .font(.largeTitle)
            Spacer()
            EditButton
        }.frame(maxHeight: 75)
    }
    
    var EditButton: some View {
        VStack{
            Button(action: {
                print("Toggle edit")
                self.chosenSetting = .brewSettings
                self.isSettingShown = true
                
            }){
                Text("Edit")
                    .foregroundColor(.red)
            }.padding(.bottom)
            HStack{
                VStack{
                    Text("\(settings.coffeeAmount) g")
                    Text("Coffee")
                        .font(.footnote)
                }
                Text(":")
                VStack{
                    Text("\(settings.waterAmount) g")
                    Text("Water")
                        .font(.footnote)
                }
            }
        }
    }
}

//struct TitleBlock_Previews: PreviewProvider {
//    private var isSettingShown: Bool = true
//    private var chosenSetting = Binding(
//    static var previews: some View {
//        TitleBlock(isSettingShown: isSettingShown, chosenSetting: chosenSetting)
//    }
//}
