//
//  AuthController.swift
//  Workout Tracking
//
//  Created by Alexander Lopez on 26/08/20.
//  Copyright © 2020 Alexander Lopez Cedillo. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
import FBSDKLoginKit

class AuthController: UIViewController {
    
    @IBOutlet weak var correoTextField: UIToolbarTextField!
    @IBOutlet weak var contrasenaTextField: UIToolbarTextField!
    
    private var correo: String {
        correoTextField.text ?? ""
    }
    private var contrasena: String {
        contrasenaTextField.text ?? ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkForExistingUser()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.delegate = self
    }
    
    @IBAction func ingresarButtonAction(_ sender: Any) {
        Auth.auth().signIn(withEmail: correo, password: contrasena) { (result, error) in
            self.handleFirebaseSignInResponse(with: result, and: error, forProvider: .basic)
        }
    }
    
    @IBAction func registrarButtonAction(_ sender: Any) {
        Auth.auth().createUser(withEmail: correo, password: contrasena) { (result, error) in
            self.handleFirebaseSignInResponse(with: result, and: error, forProvider: .basic)
        }
    }
    
    @IBAction func googleButtonAction(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signOut()
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    @IBAction func facebookButtonAction(_ sender: Any) {
        let loginManager = LoginManager()
        loginManager.logOut()
        loginManager.logIn(
            permissions: [.email],
            viewController: self) { (result) in
                switch result {
                case .success(granted: _, declined: _, token: let token):
                    let credential = FacebookAuthProvider.credential(withAccessToken: token.tokenString)
                    Auth.auth().signIn(with: credential) { (result, error) in
                        self.handleFirebaseSignInResponse(with: result, and: error, forProvider: .facebook)
                    }
                case .cancelled:
                    break
                case .failed(_):
                    break
                }
        }
    }
    
    private func checkForExistingUser() {
        if Session.shared.usuario != nil {
            goToHome()
        }
    }
    
    private func goToHome() {
        if let window = UIApplication.shared.windows.first, let vc = storyboard?.instantiateViewController(identifier: "mainNC") {
            window.rootViewController = vc
        }
    }
    
    private func handleFirebaseSignInResponse(with result: AuthDataResult?, and error: Error?, forProvider provider: Usuario.ProviderType) {
        if let result = result, error == nil {
            let user = result.user
            let email = user.email!
            let newUser = Usuario(email: email, provider: provider)
            if (try? Session.shared.save(usuario: newUser)) == nil {
                presentAdviceAlert(withMessage: "Ocurrio un error al iniciar sesión. Intenta nuevamente.")
            } else {
                goToHome()
            }
        } else {
            if let errCode = AuthErrorCode(rawValue: error!._code) {
                switch errCode {
                case .userNotFound:
                    presentAdviceAlert(withMessage: "Usuario no encontrado.")
                case .userDisabled:
                    presentAdviceAlert(withMessage: "Usuario inhabilitado.")
                case .wrongPassword:
                    presentAdviceAlert(withMessage: "Contraseña erronea.")
                case .tooManyRequests:
                    presentAdviceAlert(withMessage: "Demasiados intentos fallidos. Intenta más tarde")
                default:
                    debugPrint(error!)
                }
            }
        }
    }
    
    private func presentAdviceAlert(withMessage message: String) {
        let alert = AlertBuilder.getMessageAlert(
            title: "Aviso",
            message: message,
            completion: nil
        )
        present(alert, animated: true)
    }
}

extension AuthController: GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error == nil, let user = user, let authentication = user.authentication {
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
            Auth.auth().signIn(with: credential) { (result, error) in
                self.handleFirebaseSignInResponse(with: result, and: error, forProvider: .google)
            }
        }
    }
    
}
