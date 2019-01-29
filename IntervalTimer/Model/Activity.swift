//
//  Activity.swift
//  IntervalTimer
//
//  Created by Vanessa Flores on 1/16/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class Activity: Object {
    @objc dynamic var name: String
    var timedIntervals: [TimedInterval]
    
    required init() {
        self.name = ""
        self.timedIntervals = []
        
        super.init()
    }
    
    convenience required init(name: String, timedIntervals: [TimedInterval]) {
        self.init()
        self.name = name
        self.timedIntervals = timedIntervals
        
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        fatalError("init(realm:schema:) has not been implemented")
    }
    
    required init(value: Any, schema: RLMSchema) {
        fatalError("init(value:schema:) has not been implemented")
    }
    
   
}
