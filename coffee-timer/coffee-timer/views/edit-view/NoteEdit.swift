//
//  NoteEdit.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 6/15/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct NoteEdit: View {
    @Binding var brewNotes: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Brew Method Notes")
                .font(.headline)
            TextField("Brew Method Notes", text: $brewNotes)
        }
    }
}

//struct NoteEdit_Previews: PreviewProvider {
//    static var previews: some View {
//        NoteEdit()
//    }
//}
