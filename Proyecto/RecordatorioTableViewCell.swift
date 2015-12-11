//
//  RecordatorioTableViewCell.swift
//  Proyecto
//
//  Created by Aplimovil on 10/12/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit

class RecordatorioTableViewCell: UITableViewCell{
    @IBOutlet var nombre:UILabel!
    @IBOutlet var fecha:UILabel!
    @IBOutlet var valor:UILabel!
    @IBOutlet var estado:UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
