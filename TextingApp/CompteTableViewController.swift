//
//  CompteTableViewController.swift
//  TextingApp
//
//  Created by stagiaire on 15/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

import UIKit

struct cellData {
    let cell : Int!
    let button : UIButton!
    let image : UIImage!
    }



class CompteTableViewController: UITableViewController {

    var arrayOfCellData = [cellData]()
    
    override func viewDidLoad(){
        
        arrayOfCellData = [cellData(cell : 1, button : "Modification du mots de passe", image : #imageLiteral(resourceName: "cadenas")),
                           cellData(cell : 2, button : "Suppression du compte", image : #imageLiteral(resourceName: "pres-effacer-supprimer-l-39-icone-carre_318-9256")),
                           cellData(cell: 3, button : "Déconnexion", image : #imageLiteral(resourceName: "deconnexion_318-10026"))
        ]
    
    }
    override func tableView(_ tableView : UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayOfCellData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if arrayOfCellData[indexPath.row].cell == 1{
            let cell = Bundle.main.loadNibNamed("TableViewCell1", owner : self, options: nil)?.first as! TableViewCell1
            cell.mainImageView.image = arrayOfCellData[indexPath.row].image
            cell.mainLbl.titleLabel = arrayOfCellData[indexPath.row].titleLabel
            
            return cell
        }
        else if arrayOfCellData[indexPath.row].cell == 2 {
            let cell = Bundle.main.loadNibNamed("TableViewCell2", owner : self, options: nil)?.first as! TableViewCell2
            cell.mainImageView2.image = arrayOfCellData[indexPath.row].image
            cell.mainLbl2.button = arrayOfCellData[indexPath.row].button
            
            return cell
        }
        else if arrayOfCellData[indexPath.row].cell == 3 {
            let cell = Bundle.main.loadNibNamed("TableViewCell3", owner : self, options: nil)?.first as! TableViewCell3
            cell.mainImageView3.image = arrayOfCellData[indexPath.row].image
            cell.mainLbl3.button = arrayOfCellData[indexPath.row].button
            return cell
        }
            
        else {
            let cell = Bundle.main.loadNibNamed("TableViewCell1", owner : self, options: nil)?.first as! TableViewCell1
            cell.mainImageView.image = arrayOfCellData[indexPath.row].image
            cell.mainLbl.button = arrayOfCellData[indexPath.row].button
            
            return cell
        }
    
    }
    override func tableView(_ table_View: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
    
    if arrayOfCellData[indexPath.row].cell == 1{
        return 100
    }
    else if arrayOfCellData[indexPath.row].cell == 2 {
        return 100
    }
    else if arrayOfCellData[indexPath.row].cell == 3 {
        return 100
    }
    
    else {
        return 100
    
    }

    
    
    
    
    
    
    
    
    
    
    
    
    //let NomTable = ["Modification mot de passe", "Supression de compte", "Déconnexion"]
    
    //override func viewDidLoad() {
      //  super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    //}

    //override func didReceiveMemoryWarning() {
//super.didReceiveMemoryWarning()
     //   // Dispose of any resources that can be recreated.
    //}

    // MARK: - Table view data source
    
    //override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
    //    return 1
    //}
    
    //override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
    //    return self.NomTable.count
   // }

    
    //override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     //   let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)

        // Configure the cell...

      //  cell.textLabel?.text = self.NomTable[indexPath.row]
        
       // return cell
    //}
    
    
    
    
    
    
    
    
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
}
