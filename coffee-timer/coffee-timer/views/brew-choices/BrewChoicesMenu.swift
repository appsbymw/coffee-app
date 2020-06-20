//
//  BrewChoicesMenu.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 6/1/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import CoreData
import SwiftUI

struct BrewChoicesMenu: View {
    @Environment(\.managedObjectContext) var moc
    @EnvironmentObject var settings: UserSettings
    
    @FetchRequest(entity: BrewMethod.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \BrewMethod.title, ascending: true)]) var brewMethods: FetchedResults<BrewMethod>
    
    @State private var editIsPresented = false
    
    let brewMethodManager = BrewMethodManager()
    let coffeeColor = Color(UIColor(named: "coffee")!)
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                ForEach(brewMethods, id: \.id) { brewMethod in
                    NavigationLink(destination: CalcMain(brewMethod: brewMethod).environmentObject(self.settings)){
                        VStack{
                            Text(brewMethod.title ?? "UNKNOWN")
                                .foregroundColor(.primary)
                                .multilineTextAlignment(.center)
                            Spacer()
                            Text("1g")
                                .foregroundColor(self.coffeeColor)
                                + Text(" : ")
                                    .foregroundColor(.primary)
                                + Text("\(brewMethod.waterRatio)g")
                                    .foregroundColor(.blue)
                        }
                        .frame(width: 100, height: 100)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2))
                        .foregroundColor(.gray)
                        .contextMenu {
                            Button(action: {
                                self.editIsPresented = true
                            }) {
                                Image(systemName: "pencil")
                                Text("Edit")
                            }
                            Button(action:{
                                self.deleteBrewMethod(brewMethod)
                            }){
                                Image(systemName: "trash")
                                Text("Delete \(brewMethod.title ?? "UNKNOWN")")
                            }.foregroundColor(.red)
                        }
                        .sheet(isPresented: self.$editIsPresented){
                            MainEdit(brewMethod: brewMethod).environment(\.managedObjectContext, self.moc)
                        }
                    }
                    .padding()
                }
                Button(action: {
                    print("Add brew method")
                    self.addBrewMethod()
                }){
                    VStack{
                        Image(systemName: "plus.circle.fill").foregroundColor(.black)
                        Text("Add").foregroundColor(.black)
                    }
                    .frame(width: 100, height: 100)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 2))
                    .foregroundColor(.gray)
                    .background(Color.green)
                    .cornerRadius(10)
                }
            }.navigationBarHidden(true)
        }
    }
    
    func addBrewMethod(){
        brewMethodManager.addBrewMethod(context: moc)
    }
    
    func deleteBrewMethod(_ brewMethod: BrewMethod){
        brewMethodManager.deleteBrewMethod(context: moc, brewMethod: brewMethod)
    }
}

struct BrewChoicesMenu_Previews: PreviewProvider {
    static var previews: some View {
        BrewChoicesMenu()
    }
}
