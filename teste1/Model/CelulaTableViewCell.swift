//
//  CelulaTableViewCell.swift
//  teste1
//
//  Created by Pede o Menu on 12/01/22.
//

import UIKit


protocol TableViewNew {
    func onClickCell(index: Int)
}

class CelulaTableViewCell: UITableViewCell {
   

    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabelIdade: UILabel!
    @IBOutlet weak var ImagemPequena: UIImageView!
    
    @IBOutlet weak var botaoFavorito: botao!
    var cellDelegate: TableViewNew?
    var index: IndexPath?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ImagemPequena.layer.borderColor = UIColor.white.cgColor
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func click(_ sender: Any) {
        cellDelegate?.onClickCell(index: (index?.row)!)
    }
    
    

}
