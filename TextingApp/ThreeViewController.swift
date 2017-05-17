//
//  ThreeViewController.swift
//  TextingApp
//
//  Created by stagiaire on 15/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

import UIKit

import Security

class ThreeViewController: UIViewController {

    @IBOutlet weak var textidentifiant: UITextField!
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureCustomTextField()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func configureCustomTextField() {

        let txtLoginImage = UIImage(named: "search")!
        
        // 2. Définition d'un conteneur pour l'image
        let txtLoginImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        txtLoginImageView.image = txtLoginImage
        
        // 3. Ajout de notre conteneur d'image à gauche de la zone de texte
        textidentifiant.leftView = txtLoginImageView
        textidentifiant.leftViewMode = .always
        
        // 4. Paramètrage de la zone
        textidentifiant.placeholder = NSLocalizedString("Identifiant", comment: "")  // texte affiché tant qu'aucune saisie n'est effectuée
        textidentifiant.autocorrectionType = .no   // Pas de correction automatique
        textidentifiant.returnKeyType = .done      // Paramètrage de la touche "Retour" sur Done
    }
    

    
    @IBOutlet weak var kyoukyou: UIButton!
    @IBAction func kyou(_ sender: UIButton) {
        let parameters: [String: AnyObject] = [
            kSecAttrKeyType as String: kSecAttrKeyTypeRSA,
            kSecAttrKeySizeInBits as String: 1024 as AnyObject]
        
        var publicKey, privateKey: SecKey?
        
        SecKeyGeneratePair(parameters as CFDictionary, &publicKey, &privateKey)
        
        //Encrypt a string with the public key
        let message = textidentifiant.text
        let blockSize = SecKeyGetBlockSize(publicKey!)
        var messageEncrypted = [UInt8](repeating: 0, count: blockSize)
        var messageEncryptedSize = blockSize
        
        var status: OSStatus!
        
        status = SecKeyEncrypt(publicKey!, SecPadding.PKCS1, message!, (message?.characters.count)!, &messageEncrypted, &messageEncryptedSize)
        
        if status != noErr {
            print("Encryption Error!")
            return
        }
        
        //Decrypt the entrypted string with the private key
        var messageDecrypted = [UInt8](repeating: 0, count: blockSize)
        var messageDecryptedSize = messageEncryptedSize
        
        status = SecKeyDecrypt(privateKey!, SecPadding.PKCS1, &messageEncrypted, messageEncryptedSize, &messageDecrypted, &messageDecryptedSize)
        
        if status != noErr {
            print("Decryption Error!")
            return
        }
        
        print(NSString(bytes: &messageDecrypted, length: messageDecryptedSize, encoding: String.Encoding.utf8.rawValue)!)
        
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
