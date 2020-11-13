//
//  WorkoutSection.swift
//  WorkoutTrackingEngine
//
//  Created by Alexander Lopez Cedillo on 19/05/20.
//  Copyright © 2020 Alexander Lopez Cedillo. All rights reserved.
//

import Foundation

 struct SeccionRutina: Codable {
     init(sets: [SetEjercicio], nombre: String) {
        self.sets = sets
        self.nombre = nombre
    }
    
     let sets: [SetEjercicio]
     let nombre: String
}

 struct DetalleSeccionRutina: Codable {
     init(sets: [DetalleSetEjercicio], nombre: String) {
        self.sets = sets
        self.nombre = nombre
    }
    
     let sets: [SetEjercicio]
     let nombre: String
}
