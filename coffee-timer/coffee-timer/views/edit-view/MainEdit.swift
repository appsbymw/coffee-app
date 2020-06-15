//
//  MainEdit.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/25/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct MainEdit: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @State var title: String = "UNKNOWN"
    @State var bloomLength: Int = 45
    @State var bloomRatio: Int = 2
    @State var coffeeGround: String = "60.0"
    @State var waterRatio: Int = 16
    @State var brewNotes: String = ""
    
    let bmm = BrewMethodManager()
    var brewMethod: BrewMethod
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Spacer()
                Button(action: {
                    self.updateBrewMethod()
                }){
                    Text("Done")
                        .foregroundColor(.green)
                }
            }
            TitleEdit(title: $title)
            RatioEdit(waterAmount: $waterRatio)
            CoffeeAmountEdit(coffeeGround: $coffeeGround)
            Divider()
            Group{
                BloomAmount(bloomRatio: $bloomRatio)
                BloomLength(bloomLength: $bloomLength)
            }
            Divider()
            NoteEdit(brewNotes: $brewNotes)
            Spacer()
            HStack{
                Spacer()
                Button(action: {
                    self.updateBrewMethod()
                }){
                    Text("Save")
                        .padding(.all, 10)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.vertical)
            }
        }
        .padding(.top)
        .padding(.horizontal)
        .onAppear{
            self.title = self.brewMethod.title ?? "UNKNOWN"
            self.bloomLength = Int(self.brewMethod.bloomLength)
            self.bloomRatio = Int(self.brewMethod.bloomRatio)
            self.coffeeGround = "\(self.brewMethod.coffeeGround)"
            self.waterRatio = Int(self.brewMethod.waterRatio)
        }
    }
    
    func updateBrewMethod(){
        brewMethod.title = title
        brewMethod.bloomLength = Int64(bloomLength)
        brewMethod.bloomRatio = Int64(bloomRatio)
        brewMethod.coffeeGround = Double(coffeeGround) ?? 0.0
        brewMethod.waterRatio = Int64(waterRatio)
        brewMethod.notes = brewNotes
        bmm.updateBrewMethod(context: moc, updatedBrew: brewMethod)
        presentationMode.wrappedValue.dismiss()
    }
}

struct MainEdit_Previews: PreviewProvider {
    static var previews: some View {
        MainEdit(brewMethod: BrewMethod())
    }
}
