//
//  User.swift
//  newsReader
//
//  Created by omar kh on 8/22/17.
//  Copyright © 2017 omar kh. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot
class User {
    
    // MARK: - Properties
    
    let uid: String
    let username: String
    
    // MARK: - Init
    
    init(uid: String, username: String) {
        self.uid = uid
        self.username = username
    }
}
