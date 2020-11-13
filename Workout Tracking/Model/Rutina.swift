//
//  Workout.swift
//  WorkoutTrackingEngine
//
//  Created by Alexander Lopez Cedillo on 19/05/20.
//  Copyright © 2020 Alexander Lopez Cedillo. All rights reserved.
//

import Foundation

struct Rutina: Codable {
    init(nombre: String, secciones: [SeccionRutina], duracion: Int, musculos: [Musculo]) {
        self.secciones = secciones
        self.nombre = nombre
        self.duracion = duracion
        self.musculos = musculos
    }
    
    let nombre: String
    let secciones: [SeccionRutina]
    // Minutos
    let duracion: Int
    let musculos: [Musculo]
    
    var musculosAggregation: String {
        guard musculos.count > 0 else { return "" }
        let musculosString: String
        musculosString = musculos.reduce("", {$0 + $1.nombre + ","})
        let endIndex = musculosString.index(musculosString.endIndex, offsetBy: -2)
        return String(musculosString[musculosString.startIndex...endIndex])
    }
    
}

struct DetalleRutina: Codable {
    init(nombre: String, secciones: [DetalleSeccionRutina]) {
        self.secciones = secciones
        self.nombre = nombre
    }
    
    let nombre: String
    let secciones: [DetalleSeccionRutina]
}
