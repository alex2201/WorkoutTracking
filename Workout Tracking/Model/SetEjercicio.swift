//
//  ExerciseSet.swift
//  WorkoutTrackingEngine
//
//  Created by Alexander Lopez Cedillo on 19/05/20.
//  Copyright © 2020 Alexander Lopez Cedillo. All rights reserved.
//

import Foundation

// Proposed set
struct SetEjercicio: Codable {
    init(ejercicio: Ejercicio, repeticiones: Int, peso: Float) {
        self.ejercicio = ejercicio
        self.repeticiones = repeticiones
        self.peso = peso
    }
    
    let ejercicio: Ejercicio
    let repeticiones: Int
    let peso: Float
}

typealias DetalleSetEjercicio = SetEjercicio

