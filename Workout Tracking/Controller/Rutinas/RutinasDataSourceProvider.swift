//
//  RutinasDataSourceProvider.swift
//  Workout Tracking
//
//  Created by Alexander Lopez on 30/08/20.
//  Copyright © 2020 Alexander Lopez Cedillo. All rights reserved.
//

import UIKit

protocol RutinasDataSourceProviderDelegate: class {
    func rutinasDataSourceProvider(_ rutinasDataSource: RutinasDataSourceProvider, didSelect rutina: Rutina)
}

class RutinasDataSourceProvider: NSObject, UITableViewDelegate, UITableViewDataSource {
    private let rutinasManager: RutinasManager
    weak var delegate: RutinasDataSourceProviderDelegate?
    
    init(with manager: RutinasManager) {
        rutinasManager = manager
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let row = indexPath.row
        let rutina = rutinasManager.getRutina(at: row)
        delegate?.rutinasDataSourceProvider(self, didSelect: rutina)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rutinasManager.rutinasCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let rutina = rutinasManager.getRutina(at: indexPath.row)
        
        cell.textLabel?.text = rutina.nombre
        cell.detailTextLabel?.text = "\(rutina.duracion) hrs"
        
        return cell
    }
    
}
