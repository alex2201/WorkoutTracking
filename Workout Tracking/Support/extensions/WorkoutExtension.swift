//
//  WorkoutExtension.swift
//  Workout Tracking
//
//  Created by Alexander Lopez Cedillo on 25/05/20.
//  Copyright © 2020 Alexander Lopez Cedillo. All rights reserved.
//

import Foundation

extension Rutina {
    static func loadDummyWorkouts() -> [Rutina] {
        var workouts: [Rutina] = []
        if let path = Bundle.main.path(forResource: "workouts", ofType: "json") {
            if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) {
                let decoder = JSONDecoder()
                do {
                    workouts = try decoder.decode([Rutina].self, from: jsonData)
                } catch {
                    fatalError("Error loading json file: \(error)")
                }
            }
        }
        
        return workouts
    }
}
