//
//  TableViewController.swift
//  Trump Says
//
//  Created by Matheus on 02/11/21.
//

import UIKit

class TableViewController: UITableViewController {
    var dados = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

 
    }



    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dados.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath)
        celula.textLabel?.text = dados[indexPath.row]
        return celula
    }
    

   
   

}
