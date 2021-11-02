//
//  ListaViewController.swift
//  Trump Says
//
//  Created by Matheus on 02/11/21.
//

import UIKit

class ListaViewController: UITableViewController {
        
    var vetorFrases = [Int: String]()
    var vetor = [0: "asdasd", 1: "asodasoi", 2: "asdasd"]
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath)
        celula.textLabel?.text = vetor[indexPath.row]
        
        return celula
    }
     */
}
