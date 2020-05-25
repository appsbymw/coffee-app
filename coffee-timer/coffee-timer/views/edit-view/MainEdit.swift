//
//  MainEdit.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/25/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct MainEdit: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Spacer()
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Text("Done")
                        .foregroundColor(.green)
                }
            }
            RatioEdit()
            Divider()
            BloomLength()
            Divider()
            BloomAmount()
            Spacer()
        }
        .padding(.top)
        .padding(.horizontal)
    }
}

struct MainEdit_Previews: PreviewProvider {
    static var previews: some View {
        MainEdit()
    }
}
