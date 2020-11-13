//
//  Session.swift
//  appautofin
//
//  Created by Alexander Lopez on 15/07/20.
//  Copyright © 2020 Alexander López Cedillo. All rights reserved.
//

import Foundation
import FirebaseAuth
import GoogleSignIn

class Session {
	private var defaults: UserDefaults { UserDefaults.standard }
    private(set) var usuario: Usuario?
	
	static let shared = Session()
	
	private init() {
        getSavedUser()
    }
    
    private func getSavedUser() {
        usuario = try? defaults.getObject(forKey: "@user", castTo: Usuario.self)
    }
    
    func save(usuario: Usuario) throws {
        self.usuario = usuario
        try defaults.setObject(usuario, forKey: "@user")
        defaults.synchronize()
    }
    
    func removeUser() {
        if let usuario = usuario {
            switch usuario.provider {
            case .basic:
                break
            case .google:
                GIDSignIn.sharedInstance()?.signOut()
            default:
                break
            }
            try? Auth.auth().signOut()
        }
        
        defaults.removeObject(forKey: "@user")
        defaults.synchronize()
        usuario = nil
    }
}
