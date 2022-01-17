//
//  CelulaTableViewCell.swift
//  teste1
//
//  Created by Pede o Menu on 12/01/22.
//

import UIKit

class CelulaTableViewCell: UITableViewCell {
   
    
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var ImagemPequena: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ImagemPequena.layer.borderColor = UIColor.white.cgColor
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
