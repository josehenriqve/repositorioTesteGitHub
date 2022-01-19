//
//  CelulaTableViewCell.swift
//  teste1
//
//  Created by Pede o Menu on 12/01/22.
//

import UIKit


protocol botaoDelegate {
    
    func onClickButton(index: Int)
    
}
protocol celulaDelegate {
    
    func onClickCelula(index: Int)
    
}

class CelulaTableViewCell: UITableViewCell {
   

    @IBOutlet weak var cardTableView: UIView!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabelIdade: UILabel!
    @IBOutlet weak var ImagemPequena: UIImageView!
    @IBOutlet weak var botaoFavorito: botao!
    var cellDelegate: botaoDelegate?
    var cellViewDelegate: celulaDelegate?
    var index: IndexPath?
    var index2: IndexPath?
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        ImagemPequena.layer.borderColor = UIColor.white.cgColor
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gestureFired(_:)))
        gestureRecognizer.numberOfTapsRequired = 2
        gestureRecognizer.numberOfTouchesRequired = 1
        cardTableView.addGestureRecognizer(gestureRecognizer)
        cardTableView.isUserInteractionEnabled = true
        
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
    }



    @objc func gestureFired(_ gesture: UITapGestureRecognizer) {
        cellViewDelegate?.onClickCelula(index: (index2?.row)!)
    }
    
    
    @IBAction func click(_ sender: Any) {
        
        cellDelegate?.onClickButton(index: (index?.row)!)
    }
    
}
