//  Global var for application
//
//  CommunUrlApi.swift
//  TextingApp
//
//  Created by Mambot on 17/05/2017.
//  Copyright © 2017 Mambot. All rights reserved.
//

import UIKit

class CommunUrlApi: NSObject {

    struct Global {
        
        // Route root
        static let urlApi : String = "http://192.168.1.138:3000"
        
        // Route user test
        static let urlGetUsersTest : String = CommunUrlApi.Global.urlApi + "/users"
        
        // Routes for users
        static let urlUsers : String = CommunUrlApi.Global.urlApi + "/users"
        static let urlPostUsersLogin : String = CommunUrlApi.Global.urlUsers + "/login"
        static let urlPostUsersCreate : String = CommunUrlApi.Global.urlUsers + "/create"
        
        // Routes for contacts
        static let urlContacts : String = CommunUrlApi.Global.urlApi + "/contacts"
        static let urlPostFindContact : String = CommunUrlApi.Global.urlContacts + "/find/contact"
        static let urlPostAddContact : String = CommunUrlApi.Global.urlContacts + "/add/contact"
        
    }
    
}
