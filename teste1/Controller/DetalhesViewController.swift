//
//  DetalhesViewController.swift
//  teste1
//
//  Created by Pede o Menu on 18/01/22.
//

import UIKit

class DetalhesViewController: UIViewController {
    
    var cliente: Cliente!
    
    @IBOutlet weak var imagemPequenaDetalhes: UIImageView!
    @IBOutlet weak var imagemPerfilDetalhes: UIImageView!
    @IBOutlet weak var nomeDetalhesLabel: UILabel!
    @IBOutlet weak var idadeDetalhesLabel: UILabel!
    @IBOutlet weak var imagemDetalhes: UIButton!
    @IBOutlet weak var mensagensDetalhes: UIButton!
    @IBOutlet weak var telefoneDetalhes: UIButton!
    @IBOutlet weak var navBar: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagemPequenaDetalhes.layer.borderColor = UIColor.white.cgColor
        guard let clienteSetado = cliente else{
            return
        }
        
        imagemPerfilDetalhes.downloaded(from: clienteSetado.getUrlImagem())
        nomeDetalhesLabel.text = clienteSetado.getNome()
        idadeDetalhesLabel.text = String(clienteSetado.getIdade())
        navigationController?.setNavigationBarHidden(false, animated: false)
        
    }
    func showAlert(titulo: String, mensagem: String) {
        
      let alertController = UIAlertController(title: titulo, message:mensagem, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: {action in

           
            
      }))
        
      self.present(alertController, animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nomeDetalhesLabel.alpha = 0
        idadeDetalhesLabel.alpha = 0
        imagemDetalhes.alpha = 0
        mensagensDetalhes.alpha = 0
        telefoneDetalhes.alpha = 0
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.3) {
            self.nomeDetalhesLabel.alpha = 1

            self.idadeDetalhesLabel.alpha = 1
         
        }
        UIView.animate(withDuration: 0.3) {
            self.imagemDetalhes.alpha = 1
        
        }
        UIView.animate(withDuration: 0.4) {
            self.mensagensDetalhes.alpha = 1
     
        }
        UIView.animate(withDuration: 0.5) {
            self.telefoneDetalhes.alpha = 1
 
        }
        
    }
    
    @IBAction func telefone(_ sender: Any) {
       // showAlert(titulo: "Telefone de \(nomeDetalhesLabel.text!)", mensagem: "+55 62 9 9999-9999")
        let url:NSURL = URL(string: "tel://+8801700000001")! as NSURL
        UIApplication.shared.open(url as URL, options: [:]) { sucesso in
            if sucesso {
                        print("opened")
                    } else {
                        print("failed")
                        // showInvalidUrlAlert()
                    }
        }
    }
    
    
    @IBAction func email(_ sender: Any) {
        showAlert(titulo: "Email de \(nomeDetalhesLabel.text!)", mensagem: "\(nomeDetalhesLabel.text!)_\(idadeDetalhesLabel.text!)@pedeomenu.com.br".trimmingCharacters(in: .whitespaces))
    }
    
    @IBAction func trocarHash(_ sender: Any) {
        
        let randomCGFloat = CGFloat.random(in: 1...1000)
        var urlImagem: String = "https://robohash.org/\(randomCGFloat).png".trimmingCharacters(in: .whitespaces)
        imagemPerfilDetalhes.downloaded(from: urlImagem)
        
    }
    
}
