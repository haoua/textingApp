//
//  MotdePasseViewController.swift
//  TextingApp
//
//  Created by stagiaire on 16/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

import UIKit

class MotdePasseViewController: UIViewController {

    @IBOutlet weak var btnMdp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func btnActionMdp(_ sender: UIButton) {
        
        let decoAlert = UIAlertController(title: "Mot de passe", message: "Mot de passe modifié avec succès !", preferredStyle: UIAlertControllerStyle.alert)
        
        decoAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action: UIAlertAction!) in
            
            let CompteViewController = self.storyboard?.instantiateViewController(withIdentifier: "Compte") as! CompteViewController
            self.navigationController?.pushViewController(CompteViewController, animated: true)
        }))
        
        present(decoAlert, animated: true, completion: nil)
     
    }

}
