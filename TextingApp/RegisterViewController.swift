//
//  RegisterViewController.swift
//  TextingApp
//
//  Created by stagiaire on 16/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {

    var configUser:ConfigUser = ConfigUser.shared
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var identifiantUnique: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //let uuid = UUID().uuidString
        
        //self.identifiantUnique.text = uuid
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createBtn() {
        print(self.password.text ?? " ")
        
        if((self.password.text) != nil){
            
            let parameters: Parameters = ["password": self.password.text ?? " "]
            
            Alamofire.request(CommunUrlApi.Global.urlPostUsersCreate, method: .post, parameters: parameters).responseJSON { response in
                
                //print(response.request ?? "")  // original URL request
                //print(response.response ?? "") // HTTP URL response
                //print(response.data ?? "")     // server data
                //print(response.result)   // result of response serialization
                
                print(response)
                
                if let result = response.result.value {
                    let JSON = result as! NSDictionary
                    print(JSON.object(forKey: "uid") ?? "")
                }
                
                if let status = response.response?.statusCode {
                    
                    print(status)
                    
                    switch(status){
                    case 200:
                        print("example success")
                        
                        if let result = response.result.value {
                            let JSON = result as! NSDictionary
                            print(JSON.object(forKey: "uid") ?? "")
                            
                            self.configUser.uid = JSON.object(forKey: "uid") as! String
                            let uid = JSON.object(forKey: "uid") as! String
                            
                            // Store
                            self.defaults.set(uid, forKey: "uid")
                            self.defaults.synchronize()
                            
                            self.dismiss(animated: true, completion: nil)
                            
                        }
                        
                    default:
                        print("error with response status: \(status)")
                    }
                }
                
            }
            
        }else{
            print("Vous devez taper un mot de passe !");
            
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
