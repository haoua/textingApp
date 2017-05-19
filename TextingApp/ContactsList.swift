//  Contacts of user
//  ContactsList.swift
//  TextingApp
//
//  Created by Mambot on 17/05/2017.
//  Copyright © 2017 Mambot. All rights reserved.
//

class ContactsList {
    
    var contacts:[Contact] = []
    
    private init() {
    }
    
    static let shared = ContactsList()
}
