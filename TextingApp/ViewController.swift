//
//  ViewController.swift
//  TextingApp
//
//  Created by stagiaire on 15/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

class ViewController: UIViewController {
    
    var configUser:ConfigUser = ConfigUser.shared
    
    let defaults = UserDefaults.standard
    
    
    //Variables
    @IBOutlet weak var textIdentifiant: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var btnConnection: UIButton!
    @IBOutlet weak var btnInscription: UIButton!
    @IBOutlet weak var textStoredUid: UITextField!
    @IBOutlet weak var msgTextInfo: UITextField!
    
    
    func auth (auth: String, msg: String) -> Void {
        
        if(auth == "no"){
        
            self.msgTextInfo.text = msg
            
            //Store
            self.defaults.set("", forKey: "token")
            self.defaults.set("", forKey: "auth")
            self.defaults.synchronize()
        }else{
            
            self.msgTextInfo.text = msg
 
        }
       
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // No need for semicolon
        
        if let uid = defaults.string(forKey: "uid"){
            print(uid)
            self.textIdentifiant.text = uid
            self.textStoredUid.text = uid
        }else{
            self.textIdentifiant.text = ""
            self.textStoredUid.text = ""
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let uid = defaults.string(forKey: "uid"){
            print(uid)
            self.textIdentifiant.text = uid
            
        }else{
            self.textIdentifiant.text = ""
        }
     
        configureCustomTextField()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func btnConnexion(_ sender: UIButton) {
        
        if((self.textPassword.text) != nil && (self.textIdentifiant.text) != nil ){
            
            let parameters: Parameters = ["password": self.textPassword.text ?? " ",
                                          "uid": self.textIdentifiant.text ?? " "
                                          ]
            
            Alamofire.request(CommunUrlApi.Global.urlPostUsersLogin, method: .post, parameters: parameters).responseJSON { response in
                
                print(response.request ?? "")  // original URL request
                print(response.response ?? "") // HTTP URL response
                print(response.data ?? "")     // server data
                print(response.result)   // result of response serialization
                
                print(response)
                
                if let result = response.result.value {
                    let JSON = result as! NSDictionary
                    
                    let auth:String = (JSON.object(forKey: "auth") as! String)
                    let msg:String = JSON.object(forKey: "msg") as! String
                    
                    print("***")
                    print(auth )
                    print("***")
                    
                    // Store
                    self.defaults.set(auth, forKey: auth )
                    self.defaults.synchronize()
                    
                    if let responseStatus = response.response?.statusCode {
                        if responseStatus != 200 {
                            // error
                            self.auth(auth: auth, msg: msg)
                            
                        } else {
                            var allCookies: [HTTPCookie]?
                            if let headerFields = response.response?.allHeaderFields as? [String: String],
                                let URL = response.request?.url {
                                allCookies = HTTPCookie.cookies(withResponseHeaderFields: headerFields, for: URL)
                                for cookie in allCookies! {
                                    print(cookie)
                                    let name = cookie.name
                                    if name == "access_token" {
                                        let value = cookie.value
                                        
                                        self.auth(auth: auth, msg: msg)
                                        // Store
                                        self.defaults.set(value, forKey: "token")
                                        self.defaults.set(auth, forKey: "auth")
                                        self.defaults.synchronize()
                                        
                                        print(value)
                                        
                                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                                        
                                        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "homeContacts") as! ThreeViewController
                                        self.present(nextViewController, animated:true, completion:nil)
                                        
                                    }else{
                                        
                                        self.auth(auth: auth, msg: msg)
                                        //self.defaults.set("", forKey: "token")
                                        //self.defaults.set("", forKey: "auth")
                                        //self.defaults.synchronize()
                                    }
                                }
                                
                            }else{
                                
                                self.auth(auth: auth, msg: msg)
                                
                                //self.defaults.set("", forKey: "token")
                                //self.defaults.set("", forKey: "auth")
                                //self.defaults.synchronize()
                            }
                            
                        }
                    }
                    
                    
                }else{
                    
                    
                    self.defaults.set("", forKey: "token")
                    self.defaults.set("", forKey: "auth")
                    self.defaults.synchronize()
                }
            }
            
        }else{
            print("Vous devez taper votre mot de passe !");
            
        }
        
        
        //textPasswordError()
    }
    
    func configureCustomTextField() {
        
        // Ajout d'un picto login dans le champ texte txtLogin
        
        // 1. Définition de l'image
        let txtLoginImage = UIImage(named: "user")!
        
        // 2. Définition d'un conteneur pour l'image
        let txtLoginImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        txtLoginImageView.image = txtLoginImage
        
        // 3. Ajout de notre conteneur d'image à gauche de la zone de texte
        textIdentifiant.leftView = txtLoginImageView
        textIdentifiant.leftViewMode = .always
        
        // UITextFieldViewMode
        // Always : toujours
        // WhileEditing : pendant l'édition du champ
        // UnlessEditing : disparait a lapremiere saisie
        
        // 4. Paramètrage de la zone
        textIdentifiant.placeholder = NSLocalizedString("Login", comment: "")  // texte affiché tant qu'aucune saisie n'est effectuée
        textIdentifiant.autocorrectionType = .no   // Pas de correction automatique
        textIdentifiant.returnKeyType = .done      // Paramètrage de la touche "Retour" sur Done
        
        // Ajout d'un picto login dans le champ texte txtPassword
        
        let txtPasswordImage = UIImage(named: "cadenas")!
        let txtPasswordImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        txtPasswordImageView.image = txtPasswordImage
        textPassword.leftView = txtPasswordImageView
        textPassword.leftViewMode = .always
        textPassword.placeholder = NSLocalizedString("Mot de passe", comment: "")
        textPassword.autocorrectionType = .no
        textPassword.returnKeyType = .done
    }
    
    func textPasswordError () {
        let errorImage = UIImage(named: "warning")!
        let errorImageButton = UIButton(type: .custom) as UIButton
        errorImageButton.bounds = CGRect(x: 0, y: 0, width: 22, height: 16)
        errorImageButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 6)
        errorImageButton.setImage(errorImage, for: .normal)
        textPassword.rightView = errorImageButton
        textPassword.rightViewMode = .always
    }
    
}

