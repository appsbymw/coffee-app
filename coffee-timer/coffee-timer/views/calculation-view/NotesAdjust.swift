//
//  NotesAdjust.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 6/15/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct NotesAdjust: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    let bmm = BrewMethodManager()
    var brewMethod: BrewMethod
    @State private var newNote = ""
    
    var body: some View {
        VStack{
            // MARK: Cancel button
            HStack{
                Spacer()
                Button(action:{
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Text("Cancel")
                        .foregroundColor(.red)
                }
            }.padding(.bottom, 10)
            NoteEdit(brewNotes: $newNote)
            HStack{
                Spacer()
                Button(action: {
                    self.saveNewValue()
                }){
                    Text("Save")
                        .padding(.all, 10)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.vertical)
            }
            Spacer()
            
        }.padding(.all)
            .onAppear{
                self.newNote = self.brewMethod.notes ?? "No note given"
        }
    }
    
    private func saveNewValue(){
        brewMethod.notes = newNote
        bmm.updateBrewMethod(context: moc, updatedBrew: brewMethod)
        presentationMode.wrappedValue.dismiss()
    }
}

//struct NotesAdjust_Previews: PreviewProvider {
//    static var previews: some View {
//        NotesAdjust()
//    }
//}
