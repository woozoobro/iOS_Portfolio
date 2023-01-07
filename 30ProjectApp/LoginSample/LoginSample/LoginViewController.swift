//
//  LoginViewController.swift
//  LoginSample
//
//  Created by 우주형 on 2023/01/08.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailLoginButton: UIButton!
    @IBOutlet weak var googleLoginButton: UIButton! //GIDSignInButton!
    @IBOutlet weak var appleLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [emailLoginButton, googleLoginButton, appleLoginButton]
            .forEach {
                $0?.layer.borderWidth = 1
                $0?.layer.borderColor = UIColor.white.cgColor
                $0?.layer.cornerRadius = 30
            }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Google Sign In
    }
    
    
    @IBAction func googleLoginButtonTapped(_ sender: UIButton) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        let scenes = UIApplication.shared.connectedScenes
        let windowScenes = scenes.first as? UIWindowScene
        let window = windowScenes?.windows.first
        guard let rootViewController = window?.rootViewController else { return }
        
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { signInResult, error in
            if let error = error {
                print("Error", error.localizedDescription)
                return
            }
            guard let authentication = signInResult?.user,
                  let idToken = authentication.idToken?.tokenString else { return }
  
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { _, _ in
                self.showMainVC()
            }
        }
    }
    
    func showMainVC() {
        let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainVC = sb.instantiateViewController(withIdentifier: "MainViewController")
        mainVC.modalPresentationStyle = .fullScreen
        navigationController?.show(mainVC, sender: nil)
    }
    
    @IBAction func appleLoginButtonTapped(_ sender: UIButton) {
        
    }
    
    
}

