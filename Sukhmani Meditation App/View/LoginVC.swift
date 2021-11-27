//
//  LoginVC.swift
//  Sukhmani Meditation App
//
//  Created by MACBOOK on 27/11/21.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - signInWithGoogleBtnIsPressed
    @IBAction func signInWithGoogleBtnIsPressed(_ sender: UIButton) {
        AppDelegate().sharedDelegate().loginWithGoogle(vc: self)
    }

    //MARK: - anonymousSignInBtnIsPressed
    @IBAction func anonymousSignInBtnIsPressed(_ sender: UIButton) {
        let auth = Auth.auth()
        auth.signInAnonymously { (result, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            setIsUserLogin(isUserLogin: true)
            let vc = STORYBOARD.MAIN.instantiateViewController(withIdentifier: MAIN_STORYBOARD.MainVC.rawValue) as! MainVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
