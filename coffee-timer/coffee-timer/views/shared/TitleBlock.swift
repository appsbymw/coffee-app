//
//  TitleBlock.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/4/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct TitleBlock: View {
    var isEditing: Bool = false
    
    var body: some View {
        HStack {
            Text("Chemex")
                .font(.largeTitle)
            Spacer()
            if isEditing == true {
                DoneButton
            } else {
                EditButton
            }
        }.frame(maxHeight: 75)
    }
    
    var EditButton: some View {
        VStack{
            Button(action: {
                print("Toggle edit")
            }){
                Text("Edit")
                    .foregroundColor(.red)
            }.padding(.bottom)
            HStack{
                VStack{
                    Text("16 g")
                    Text("Coffee")
                        .font(.footnote)
                }
                Text(":")
                VStack{
                    Text("1 g")
                    Text("Water")
                        .font(.footnote)
                }
            }
        }
    }
    
    var DoneButton: some View {
        VStack{
            Button(action:{
                print("done button pressed")
            }){
                Text("Done")
                    .foregroundColor(.green)
            }
            Spacer()
        }
    }
}

struct TitleBlock_Previews: PreviewProvider {
    static var previews: some View {
        TitleBlock(isEditing: true)
    }
}
