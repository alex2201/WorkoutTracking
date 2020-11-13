//
//  Usuario.swift
//  Workout Tracking
//
//  Created by Alexander Lopez on 26/08/20.
//  Copyright © 2020 Alexander Lopez Cedillo. All rights reserved.
//

import Foundation

struct Usuario: Codable {
    enum ProviderType: String, Codable {
        case basic
        case google
        case facebook
        case apple
    }
    
    let email: String
    let provider: ProviderType
}
