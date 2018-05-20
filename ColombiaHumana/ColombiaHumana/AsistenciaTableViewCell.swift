//
//  AsistenciaTableViewCell.swift
//  ColombiaHumana
//
//  Created by Daniel Muñoz Melendez on 19/05/18.
//  Copyright © 2018 Daniel Muñoz Melendez. All rights reserved.
//

import UIKit

class AsistenciaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var LabelNombre: UILabel!
    @IBOutlet weak var LabelCedula: UILabel!
    @IBOutlet weak var LabelMesas: UILabel!
    @IBOutlet weak var ImgCheck: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
