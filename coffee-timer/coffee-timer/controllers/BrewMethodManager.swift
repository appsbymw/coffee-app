//
//  BrewMethodManager.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 6/1/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import CoreData
import Foundation

struct BrewMethodManager {
    func addBrewMethod(context: NSManagedObjectContext) {
        let newBrewMethod = BrewMethod(context: context)
        newBrewMethod.title = "New Brew Method"
        newBrewMethod.id = UUID()
        newBrewMethod.bloomLength = 45
        newBrewMethod.bloomRatio = 2
        newBrewMethod.coffeeGround = 60.0
        newBrewMethod.waterRatio = 16
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    func updateBrewMethod(context: NSManagedObjectContext, updatedBrew: BrewMethod){
        let brewID = updatedBrew.id! as NSUUID
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "BrewMethod")
        fetchRequest.predicate = NSPredicate(format: "id == %@", brewID as CVarArg)
        fetchRequest.fetchLimit = 1
        do {
            let test = try context.fetch(fetchRequest)
            let brewUpdate = test[0] as! NSManagedObject
            brewUpdate.setValue(updatedBrew.title ?? "UNKNOWN", forKey: "title")
            brewUpdate.setValue(updatedBrew.bloomLength, forKey: "bloomLength")
            brewUpdate.setValue(updatedBrew.bloomRatio, forKey:"bloomRatio")
            brewUpdate.setValue(updatedBrew.coffeeGround, forKey: "coffeeGround")
            brewUpdate.setValue(updatedBrew.waterRatio, forKey: "waterRatio")
            try context.save()
        } catch {
            print(error)
        }
    }
    
    func deleteBrewMethod(context: NSManagedObjectContext, brewMethod: BrewMethod){
        context.delete(brewMethod)
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}
