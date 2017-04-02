//
//  User.swift
//  Sentiment Analysis
//
//  Created by Jean-Marc Kampol Mieville on 4/2/2560 BE.
//  Copyright © 2560 Jean-Marc Kampol Mieville. All rights reserved.
//

import Foundation

class User: NSObject {
    
    let id: Int
    let name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
}
