//
//  RutinaListItemCell.swift
//  Workout Tracking
//
//  Created by Alexander Lopez on 26/08/20.
//  Copyright © 2020 Alexander Lopez Cedillo. All rights reserved.
//

import UIKit

class RutinaListItemCVCell: UICollectionViewCell {
    
    static let identifier = "RutinaListItemCVCell"

    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var duracionLabel: UILabel!
    
    func configure(with rutina: Rutina) {
        nombreLabel.text = rutina.nombre
        let duracion = Double(rutina.duracion) / 60
        duracionLabel.text = "\(duracion) hrs"
    }

}
