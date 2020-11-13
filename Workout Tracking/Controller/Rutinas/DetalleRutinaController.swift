//
//  DetalleRutinaController.swift
//  Workout Tracking
//
//  Created by Alexander Lopez on 05/09/20.
//  Copyright © 2020 Alexander Lopez Cedillo. All rights reserved.
//

import UIKit

class DetalleRutinaController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var rutina: Rutina!
    private lazy var detalleRutinaDataSourceProvider = DetalleRutinaDataSourceProvider(with: rutina)
    
    override func viewDidLoad() {
        setup()
    }
    
    private func setup() {
        tableView.dataSource = detalleRutinaDataSourceProvider
        tableView.delegate = detalleRutinaDataSourceProvider
    }
    
    @IBAction func comenzarButtonAction(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(identifier: "rutinaNC") {
            vc.modalPresentationStyle = .overCurrentContext
            present(vc, animated: true)
        }
    }
}
