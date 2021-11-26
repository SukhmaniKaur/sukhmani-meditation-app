//
//  LoginVC.swift
//  Sukhmani Meditation App
//
//  Created by MACBOOK on 27/11/21.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - signInWithGoogleBtnIsPressed
    @IBAction func signInWithGoogleBtnIsPressed(_ sender: UIButton) {
        AppDelegate().sharedDelegate().loginWithGoogle(vc: self)
    }

}
