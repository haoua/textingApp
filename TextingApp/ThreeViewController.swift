//
//  ThreeViewController.swift
//  TextingApp
//
//  Created by stagiaire on 15/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

import UIKit
import Alamofire
import Foundation


class ThreeViewController: UIViewController {

    let defaults = UserDefaults.standard
    var token:String = ""
    var myUid = "";
    
    
    @IBOutlet weak var inputSearchUid: UITextField!
    @IBOutlet weak var msgTextInfo: UITextField!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // No need for semicolon
        
        self.inputSearchUid.text = "718ece65-ab5b-45f2-aa2c-3265e3beebc3"
        
        if let token = defaults.string(forKey: "token"){
            print(token)
            self.token = token
        }else{
            self.token = ""
        }
        
        if let uid = defaults.string(forKey: "uid"){
            print(uid)
            self.myUid = uid
            
        }else{
            self.myUid = ""
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func searchBtn(_ sender: Any) {
        
        print(CommunUrlApi.Global.urlPostFindContact)
        
        
        if(self.token != "" && self.inputSearchUid.text != nil && (self.inputSearchUid.text != self.myUid) ){
            
            let uid = self.inputSearchUid.text
            let headers: HTTPHeaders = ["x-access-token": self.token]
            let parameters: Parameters = ["uid": uid!]
            
            Alamofire.request("http://192.168.1.138:3000/contacts/find/contact", method: .post, parameters: parameters, headers: headers).responseJSON { response in
                
                print(response.request ?? "")  // original URL request
                print(response.response ?? "") // HTTP URL response
                print(response.data ?? "")     // server data
                print(response.result)   // result of response serialization
                
                print(response)
                
                if let result = response.result.value {
                    let JSON = result as! NSDictionary
                    
                    //let uid:String = (JSON.object(forKey: "uid") as! String)
                    let msg:String = JSON.object(forKey: "msg") as! String
                    self.msgTextInfo.text = msg
                    
                    if let responseStatus = response.response?.statusCode {
                        if responseStatus != 200 {
                            // error
                            
                            
                        } else {
                            // Afficher le form pour ajouter le contact
                            
                        }
                    }
                    
                    
                }else{
                    
                }
            }
            
        }else{
            self.msgTextInfo.text = "Vous devez taper un uid !"
            
        }
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
