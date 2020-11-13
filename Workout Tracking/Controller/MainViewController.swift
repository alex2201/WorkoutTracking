//
//  FirstViewController.swift
//  Workout Tracking
//
//  Created by Alexander Lopez Cedillo on 16/05/20.
//  Copyright © 2020 Alexander Lopez Cedillo. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let usuario = Session.shared.usuario {
            print(usuario)
        }
    }
    
    @IBAction func cerrarSesionButtonAction(_ sender: Any) {
        Session.shared.removeUser()
        goToLogin()
    }
    
    private func goToLogin() {
        if let window = UIApplication.shared.windows.first, let vc = storyboard?.instantiateViewController(identifier: "authController") {
            window.rootViewController = vc
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toWorkoutSelection" {
        }
    }

}

