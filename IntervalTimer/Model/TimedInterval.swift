//
//  TimedInterval.swift
//  IntervalTimer
//
//  Created by Vanessa Flores on 1/16/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class TimedInterval: Object {
    @objc dynamic var title: String
    @objc dynamic var hour: Int
    @objc dynamic var minute: Int
    @objc dynamic var second: Int
    
    required init() {
        self.title = ""
        self.hour = 0
        self.minute = 0
        self.second = 0
        super.init()
    }
    
    convenience required init(title: String, hour: Int, minute: Int, second: Int) {
        self.init()
        self.title = title
        self.hour = hour
        self.minute = minute
        self.second = second
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        fatalError("init(realm:schema:) has not been implemented")
    }
    
    required init(value: Any, schema: RLMSchema) {
        fatalError("init(value:schema:) has not been implemented")
    }
    

}
