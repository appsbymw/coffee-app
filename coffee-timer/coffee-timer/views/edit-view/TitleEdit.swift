//
//  TitleEdit.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 6/1/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct TitleEdit: View {
    @Binding var title: String
    var body: some View {
        HStack{
            Text("Brew Title")
            Spacer()
            TextField("Brew Title", text: $title)
                .multilineTextAlignment(.trailing)
                .font(.title)
        }
    }
}

//struct TitleEdit_Previews: PreviewProvider {
//    static var previews: some View {
//        TitleEdit()
//    }
//}
