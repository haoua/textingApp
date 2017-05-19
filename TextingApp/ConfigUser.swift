//
//  ConfigUser.swift
//  TextingApp
//
//  Created by Mambot on 17/05/2017.
//  Copyright © 2017 Mambot. All rights reserved.
//

class ConfigUser {

    // Personal data
    var uid: String = "";
    var token: String = "";
    
    // Storage in keychain ?
    var myPublicKey = "";
    var myPrivateKey = "";
    
    
    // Options
    
    // 0 no time destruction after read sms
    var timeSmsAutoDestruction: Int = 0// in seconde
    
    // expire date no reading sms in seconde
    // 0 no expire, 3600 = auto delete in 1 hour even no reading
    var expireSmsIn: Int = 0
    
    
    
    private init(){
      
    }
    
    static let shared = ConfigUser()
    
}
