//
//  DetalleRutinaDataSourceProvider.swift
//  Workout Tracking
//
//  Created by Alexander Lopez on 05/09/20.
//  Copyright © 2020 Alexander Lopez Cedillo. All rights reserved.
//

import UIKit

class DetalleRutinaDataSourceProvider: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private let rutina: Rutina
    private var secciones: [SeccionRutina] {
        rutina.secciones
    }
    
    init(with rutina: Rutina) {
        self.rutina = rutina
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        secciones[section].nombre
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        rutina.secciones.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        secciones[section].sets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let section = indexPath.section
        let row = indexPath.row
        let seccion = secciones[section]
        let ejercicio = seccion.sets[row]
        
        cell.textLabel?.text =  "\(ejercicio.ejercicio.nombre) Repeticiones: \(ejercicio.repeticiones) Peso: \(ejercicio.peso) kg"
        
        return cell
    }
    
}
