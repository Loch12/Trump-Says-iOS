//
//  ViewController.swift
//  Trump Says
//
//  Created by Matheus on 01/11/21.
//

import UIKit

class ViewController: UIViewController {

    //vetor que passa a lista de frases para a proxima tela
    var vetorFrases = [String]()
    
    @IBOutlet weak var fraseOutput: UILabel!
    
    @IBOutlet weak var botaoFrase: UIButton!
    
    @IBOutlet weak var imagemTrump: UIImageView!
    
    
    @IBAction func atualizarFrase(_ sender: Any) {
        self.requestFrase()
        
        
        let image = Int(arc4random_uniform(4))
        let image1 = UIImage(named: "image01")
        let image2 = UIImage(named: "image02")
        let image3 = UIImage(named: "image03")
        let image4 = UIImage(named: "image04")
        let image5 = UIImage(named: "image05")
        let vetorImagens = [0:image1,1:image2,2:image3,3:image4,4:image5]
        imagemTrump.image = vetorImagens[image]!!
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "enviaLista"{
            let viewDestino = segue.destination as! TableViewController
            
          
            viewDestino.dados = vetorFrases
        }
    }
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagemTrump.image = #imageLiteral(resourceName: "image05")
        self.listaFrase()
        
    }
    
    //faz request e muda o label para a frase requisitada
    func requestFrase(){
    
        if let url = URL (string: "https://api.whatdoestrumpthink.com/api/v1/quotes/random"){
            let getFrase = URLSession.shared.dataTask(with: url) { (dados, requisicao, erro) in
                
                if erro == nil {
                    if let fraseRetorno = dados{
                        do{
                            if let objetoJson = try JSONSerialization.jsonObject(with: fraseRetorno, options: []) as? [String: Any]{
                                if let frase = objetoJson["message"] as? String{
                                    DispatchQueue.main.async(execute: {
                                        self.fraseOutput.text = frase
                                        
                                        
                                    })
                                    
                                }
                            }
                            
                        }
                        catch{
                            print("Erro ao formatar")
                        }
                    }
                }else{
                    print("erro")
                }
                
            }
            getFrase.resume()
        }
    }
    
    //monta a lista de frases requisitadas que sera exibida na tela secundaria
    func listaFrase(){
        for _ in 0...50{
            if let url = URL (string: "https://api.whatdoestrumpthink.com/api/v1/quotes/random"){
                let getFrase = URLSession.shared.dataTask(with: url) { (dados, requisicao, erro) in
                    
                    if erro == nil {
                        if let fraseRetorno = dados{
                            do{
                                if let objetoJson = try JSONSerialization.jsonObject(with: fraseRetorno, options: []) as? [String: Any]{
                                    if let frase = objetoJson["message"] as? String{
                                        DispatchQueue.main.async(execute: {
                                            self.vetorFrases.append(frase)
                                            
                                            
                                            
                                        })
                                        
                                    }
                                }
                                
                            }
                            catch{
                                print("Erro ao formatar")
                            }
                        }
                    }else{
                        print("erro")
                    }
                    
                }
                getFrase.resume()
            }
        }
    }
    
    
    
    
        
    
   
}

