//
//  DeconnexionViewController.swift
//  TextingApp
//
//  Created by stagiaire on 16/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

import UIKit

class DeconnexionViewController: UIViewController {

    @IBOutlet weak var btnDeconnexion: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnActionDeconnexion(_ sender: UIButton) {
        
        let decoAlert = UIAlertController(title: "Déconnexion", message: "Voulez-vous vraiment quitter l'application ?", preferredStyle: UIAlertControllerStyle.alert)
        
        decoAlert.addAction(UIAlertAction(title: "Quitter", style: .default, handler: { (action: UIAlertAction!) in
            let ViewController = self.storyboard?.instantiateViewController(withIdentifier: "Login") as! ViewController
            self.navigationController?.present(ViewController, animated: true)
        }))
        
        decoAlert.addAction(UIAlertAction(title: "Annuler", style: .cancel, handler: { (action: UIAlertAction!) in

        }))
        
        present(decoAlert, animated: true, completion: nil)
        
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
