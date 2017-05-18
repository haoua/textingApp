//
//  CompteViewController.swift
//  TextingApp
//
//  Created by stagiaire on 16/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

import UIKit

class CompteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let textCellIdentifier = "TextCell"
    
    let menuItem = ["Modification mot de passe", "Déconnexion", "Paramètres", "Supression du compte"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItem.count
    }
    
    func tableView(_ cellForRowAttableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath as IndexPath)
        
        let row = indexPath.row
        cell.textLabel?.text = menuItem[row]
        
        return cell
    }
    
    // MARK:  UITableViewDelegate Methods
    func tableView(_ didSelectRowAttableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
        let row = indexPath.row
        print(row)
        
        
        if row==0
        {
            let MotdePasseViewController = self.storyboard?.instantiateViewController(withIdentifier: "Mdp") as! MotdePasseViewController
            self.navigationController?.pushViewController(MotdePasseViewController, animated: true)
        }
        else if row==1
        {
            let DeconnexionViewController = self.storyboard?.instantiateViewController(withIdentifier: "Deconnexion") as! DeconnexionViewController
            self.navigationController?.pushViewController(DeconnexionViewController, animated: true)
        }
        else if row==2
        {
            let ParamViewController = self.storyboard?.instantiateViewController(withIdentifier: "Param") as! ParamViewController
            self.navigationController?.pushViewController(ParamViewController, animated: true)
        }
        else if row==3
        {
            let SupressionViewController = self.storyboard?.instantiateViewController(withIdentifier: "Supression") as! SupressionViewController
            self.navigationController?.pushViewController(SupressionViewController, animated: true)
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
