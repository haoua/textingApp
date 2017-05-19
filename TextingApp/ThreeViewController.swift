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
    
    var contactsList:ContactsList = ContactsList.shared
    
    @IBOutlet weak var inputSearchUid: UITextField!
    @IBOutlet weak var msgTextInfo: UITextField!
    @IBOutlet weak var inputAddPseudo: UITextField!
    @IBOutlet weak var showAddForm: UIView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // No need for semicolon
        
        let displayAddForm = UserDefaults.standard.bool(forKey: "showAddForm")
        self.showAddForm.isHidden = (displayAddForm == false)
        
        
        self.inputSearchUid.text = "46bad495-4f55-44d2-aa01-1793ae36df4f"
        
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
        
        if(self.token != "" && self.inputSearchUid.text != nil && (self.inputSearchUid.text != self.myUid) ){
            
            let uid = self.inputSearchUid.text
            let headers: HTTPHeaders = ["x-access-token": self.token]
            let parameters: Parameters = ["uid": uid!]
            
            Alamofire.request(CommunUrlApi.Global.urlPostFindContact, method: .post, parameters: parameters, headers: headers).responseJSON { response in
                
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
                            self.showAddForm.isHidden = false
                        }
                    }
                    
                    
                }else{
                    
                }
            }
            
        }else{
            self.msgTextInfo.text = "Vous devez taper un uid !"
            
        }
        
    }
    
    @IBAction func addContactBtn(_ sender: UIButton) {
        print("click add")
        
        if(self.token != "" && self.inputSearchUid.text != nil){
            
            let uid = self.inputSearchUid.text
            //let pseudo = self.inputAddPseudo.text
            let headers: HTTPHeaders = ["x-access-token": self.token]
            let parameters: Parameters = ["uid": uid!]
            
            Alamofire.request(CommunUrlApi.Global.urlPostAddContact, method: .post, parameters: parameters, headers: headers).responseJSON { response in
                
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
                            let error:String = JSON.object(forKey: "error") as! String
                            let add:String = JSON.object(forKey: "add") as! String
                            
                            if(error == "false" && add == "true"){
                                
                                //self.contactsList.contacts.append(Contact(uid: uid!, pseudo: pseudo!, publicKey: "publicKeyUser"))
                                self.contactsList.contacts.append(Contact(uid: uid!))

                            }else{
                                
                            }
                        }
                    }
                }else{
                    
                }
            }
            
        }else{
            self.msgTextInfo.text = ""
            
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
