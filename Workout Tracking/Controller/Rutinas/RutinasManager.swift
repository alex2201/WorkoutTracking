//
//  RutinasManager.swift
//  Workout Tracking
//
//  Created by Alexander Lopez on 30/08/20.
//  Copyright © 2020 Alexander Lopez Cedillo. All rights reserved.
//

import Foundation

class RutinasManager {
    private var rutinas: [Rutina] = []
    var rutinasCount: Int {
        rutinas.count
    }
    
    init() {
        loadRutinas()
    }
    
    private func loadRutinas() {
        rutinas = Rutina.loadDummyWorkouts()
    }
    
    func getRutina(at index: Int) -> Rutina {
        return rutinas[index]
    }
    
}
