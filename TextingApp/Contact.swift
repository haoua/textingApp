//  Format contact
//  Contact.swift
//  TextingApp
//
//  Created by Mambot on 17/05/2017.
//  Copyright © 2017 Mambot. All rights reserved.
//

class Contact {
    
    var uid:String
    var pseudo:String
    var publicKey:String

    
    init(uid:String, pseudo:String, publicKey:String) {
        self.uid = uid
        self.pseudo = pseudo
        self.publicKey = publicKey
    }
    
    var contact:String {
        return "\(self.pseudo) \(self.uid)"
    }
}
