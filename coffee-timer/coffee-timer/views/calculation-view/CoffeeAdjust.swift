//
//  CoffeeAdjust.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/11/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct CoffeeAdjust: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    let bmm = BrewMethodManager()
    var brewMethod: BrewMethod
    
    @State var newAmount = ""
    
    let coffeeColor = Color.init(UIColor(named: "coffee")!)
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Text("Cancel")
                        .foregroundColor(.red)
                }
            }
            .padding(.top)
            .padding(.bottom, 10)
            CoffeeAmountEdit(coffeeGround: $newAmount)
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
        }
        .padding(.horizontal)
    }
    
    func saveNewValue(){
        brewMethod.coffeeGround = Double(newAmount) ?? 0.0
        bmm.updateBrewMethod(context: moc, updatedBrew: brewMethod)
        presentationMode.wrappedValue.dismiss()
    }
}

struct CoffeeAdjust_Previews: PreviewProvider {
    @State static var amt: Double = 10.0
    static var previews: some View {
        CoffeeAdjust(brewMethod: BrewMethod())
    }
}
