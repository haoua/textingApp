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
import Security

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
        
        configureCustomTextField()
        
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
    
    func configureCustomTextField() {
        
        let txtLoginImage = UIImage(named: "search")!
        
        // 2. Définition d'un conteneur pour l'image
        let txtLoginImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        txtLoginImageView.image = txtLoginImage
        
//        // 3. Ajout de notre conteneur d'image à gauche de la zone de texte
        inputSearchUid.leftView = txtLoginImageView
        inputSearchUid.leftViewMode = .always
//        
//        // 4. Paramètrage de la zone
        inputSearchUid.placeholder = NSLocalizedString("Identifiant", comment: "")  // texte affiché tant qu'aucune saisie n'est effectuée
       inputSearchUid.autocorrectionType = .no   // Pas de correction automatique
       inputSearchUid.returnKeyType = .done      // Paramètrage de la touche "Retour" sur Done
    }
    

//    @IBOutlet weak var btncrypto: UIButton!
//    
//    @IBAction func btnActioncrypto(_ sender: UIButton) {
//        let parameters: [String: AnyObject] = [
//            kSecAttrKeyType as String: kSecAttrKeyTypeRSA,
//            kSecAttrKeySizeInBits as String: 1024 as AnyObject]
//        
//        var publicKey, privateKey: SecKey?
//        
//        SecKeyGeneratePair(parameters as CFDictionary, &publicKey, &privateKey)
//        
//        //Encrypt a string with the public key
//        let message = textidentifiant.text
//        let blockSize = SecKeyGetBlockSize(publicKey!)
//        var messageEncrypted = [UInt8](repeating: 0, count: blockSize)
//        var messageEncryptedSize = blockSize
//        
//        var status: OSStatus!
//        
//        status = SecKeyEncrypt(publicKey!, SecPadding.PKCS1, message!, (message?.characters.count)!, &messageEncrypted, &messageEncryptedSize)
//        
//        if status != noErr {
//            print("Encryption Error!")
//            return
//        }
//        
//        //Decrypt the entrypted string with the private key
//        var messageDecrypted = [UInt8](repeating: 0, count: blockSize)
//        var messageDecryptedSize = messageEncryptedSize
//        
//        status = SecKeyDecrypt(privateKey!, SecPadding.PKCS1, &messageEncrypted, messageEncryptedSize, &messageDecrypted, &messageDecryptedSize)
//        
//        if status != noErr {
//            print("Decryption Error!")
//            return
//        }
//        
//        print(NSString(bytes: &messageDecrypted, length: messageDecryptedSize, encoding: String.Encoding.utf8.rawValue)!)
//    }

    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
}
