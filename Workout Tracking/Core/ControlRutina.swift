//
//  ControlRutina.swift
//  Workout Tracking
//
//  Created by Alexander Lopez on 13/09/20.
//  Copyright © 2020 Alexander Lopez Cedillo. All rights reserved.
//

import Foundation

protocol Router {
    func routeNext()
}

struct SectionRouter: Router {
    func routeNext() {
        
    }
}

class ControlRutina {
    private let rutina: Rutina
    private var currSection: Int = 0
    
    init(with rutina: Rutina) {
        self.rutina = rutina
    }
    
    func start() {
        currSection = 0
        let section = rutina.secciones[currSection]
//        let set = section.sets[currSet]
    }
    
}
