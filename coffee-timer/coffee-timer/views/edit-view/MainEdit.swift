//
//  MainEdit.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/25/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct MainEdit: View {
    var body: some View {
        VStack(alignment: .leading){
            TitleBlock(isEditing: true)
            Divider()
            RatioEdit()
            Divider()
            BloomLength()
            Divider()
            BloomAmount()
            Spacer()
        }.padding(.horizontal)
    }
}

struct MainEdit_Previews: PreviewProvider {
    static var previews: some View {
        MainEdit()
    }
}
