//
//  ListaDeClientesViewController.swift
//  teste1
//
//  Created by Pede o Menu on 12/01/22.
//

import UIKit

class ListaDeClientesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
   
   
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @IBAction func clickei(_ sender: Any) {
        print("Clickei")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
  
   
    
    @IBAction func hello(_ sender: Any) {
        print("Clckei")
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulateste", for: indexPath) as! CelulaTableViewCell
        celula.cellLabel.text = "Donna Hicks Admin"
       // celula.sobreNome.text = "Finance & Admin"
        //var imagem:UIImageView?
       // let profilePicture = UIImage(data: try! Data(contentsOf: URL(string:"http://i.stack.imgur.com/Xs4RX.jpg")!))!
        //let pp = profilePicture.rounded(with: .red, width: 10)
        //imagemPequena.image?.rounded(with: .red, width: 10)
        celula.cellImage.downloaded(from: "https://robohash.org/joseldsa.png")
        
        //imageView.layer.masksToBounds = true
        //imageView.layer.borderWidth = 1.5
        //imageView.layer.borderColor = UIColor.white.cgColor
       // imageView.layer.cornerRadius = imageView.bounds.width / 2
        return celula
    }
    

   
    
}
