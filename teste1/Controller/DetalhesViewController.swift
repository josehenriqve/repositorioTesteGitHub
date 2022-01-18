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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagemPequenaDetalhes.layer.borderColor = UIColor.white.cgColor
        guard let clienteSetado = cliente else{
            return
        }
        imagemPerfilDetalhes.downloaded(from: clienteSetado.getUrlImagem())
        nomeDetalhesLabel.text = clienteSetado.getNome()
        idadeDetalhesLabel.text = String(clienteSetado.getIdade())
    }
    
}
