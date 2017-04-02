//
//  TextReply.swift
//  Sentiment Analysis
//
//  Created by Jean-Marc Kampol Mieville on 4/2/2560 BE.
//  Copyright © 2560 Jean-Marc Kampol Mieville. All rights reserved.
//

import UIKit

class Message: NSObject, DateSortable {
    
    let date: Date
    let text: String
    let user: User
    
    init(date: Date, text: String, user: User) {
        self.date = date
        self.text = text
        self.user = user
    }
    
}
