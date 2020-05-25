//
//  UserDefaults+PropertyWrapper.swift
//  coffee-timer
//
//  Created by Maegan Wilson on 5/25/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import Foundation
import Combine

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T
    
    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

class UserSettings: ObservableObject {
    
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    @UserDefault("bloomLength", defaultValue: 45)
    var bloomLength: Int {
        willSet{
            objectWillChange.send()
        }
        didSet{
            self.formatTime()
        }
    }
    
    @UserDefault("coffeeGround", defaultValue: 60.0)
    var coffeeGround: Double {
        willSet{
            objectWillChange.send()
        }
    }
    
    @UserDefault("coffeeAmount", defaultValue: 16)
    var coffeeAmount: Int {
        willSet{
            objectWillChange.send()
        }
    }
    
    @UserDefault("waterAmount", defaultValue: 1)
    var waterAmount: Int {
        willSet{
            objectWillChange.send()
        }
    }
    
    @UserDefault("bloomRatio", defaultValue: 2)
    var bloomRatio: Int {
        willSet {
            objectWillChange.send()
        }
    }
    
    var bloomTime: String = "" {
        willSet {
            objectWillChange.send()
        }
    }
    
    func formatTime(){
        print(bloomLength)
        let tempMinutes = bloomLength / 60
        let tempSeconds = bloomLength % 60
        let minutes = String(format: "%02d", tempMinutes)
        let seconds = String(format: "%02d", tempSeconds)
        bloomTime = minutes + ":" + seconds
    }
}
