//
//  BrewNoteSection.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 6/15/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct BrewNoteSection: View {
    @Environment(\.managedObjectContext) var moc
    var brewNotes: String?
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Notes")
                    .font(.headline)
                    .foregroundColor(.primary)
                Spacer()
            }
            Text(brewNotes ?? "No note given")
                .foregroundColor(.secondary)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
        }
    }
}

//struct BrewNoteSection_Previews: PreviewProvider {
//    static var previews: some View {
//        BrewNoteSection(brew: BrewMethod())
//    }
//}
