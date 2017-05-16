//
//  ViewController.swift
//  TextingApp
//
//  Created by stagiaire on 15/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Variables
    @IBOutlet weak var textIdentifiant: UITextField!
    @IBOutlet weak var btnConnection: UIButton!
    @IBOutlet weak var btnInscription: UIButton!
    @IBOutlet weak var textPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        configureCustomTextField()    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func btnConnexion(_ sender: UIButton) {
        textPasswordError()
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

