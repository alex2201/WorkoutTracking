//
//  Exercise.swift
//  WorkoutTrackingEngine
//
//  Created by Alexander Lopez Cedillo on 19/05/20.
//  Copyright © 2020 Alexander Lopez Cedillo. All rights reserved.
//

import Foundation

struct Ejercicio: Codable {
    init(nombre: String, musculos: [Musculo]) {
        self.nombre = nombre
        self.musculos = musculos
    }
    
    let nombre: String
    let musculos: [Musculo]
}
