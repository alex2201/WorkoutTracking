//
//  Muscle.swift
//  WorkoutTrackingEngine
//
//  Created by Alexander Lopez Cedillo on 19/05/20.
//  Copyright © 2020 Alexander Lopez Cedillo. All rights reserved.
//

import Foundation

struct Musculo: Codable {
    init(nombre: String) {
        self.nombre = nombre
    }
    
    let nombre: String
}
