//
//  ListaRutinasController.swift
//  Workout Tracking
//
//  Created by Alexander Lopez on 26/08/20.
//  Copyright © 2020 Alexander Lopez Cedillo. All rights reserved.
//

import UIKit

class ListaRutinasController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!{
        didSet {
            setupTableView()
        }
    }
    
    private let rutinasManager = RutinasManager()
    private lazy var rutinasDataSource = RutinasDataSourceProvider(with: rutinasManager)
    private var rutinaSeleccionada: Rutina!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        rutinasDataSource.delegate = self
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = rutinasDataSource
        tableView.dataSource = rutinasDataSource
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetalleRutina" {
            let vc = segue.destination as! DetalleRutinaController
            vc.rutina = rutinaSeleccionada
        }
    }
    
}

extension ListaRutinasController: RutinasDataSourceProviderDelegate {
    func rutinasDataSourceProvider(_ rutinasDataSource: RutinasDataSourceProvider, didSelect rutina: Rutina) {
        rutinaSeleccionada = rutina
        performSegue(withIdentifier: "goToDetalleRutina", sender: self)
    }
}
