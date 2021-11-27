//
//  LaunchVC.swift
//  Sukhmani Meditation App
//
//  Created by MACBOOK on 24/11/21.
//

import UIKit
import Lottie

class LaunchVC: UIViewController {

    // OUTLETS
    @IBOutlet weak var animationView: AnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    //MARK: - configUI
    private func configUI() {
        lottieAnimationSetup()
        
        if !isUserLogin() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                let vc = STORYBOARD.MAIN.instantiateViewController(withIdentifier: MAIN_STORYBOARD.LoginVC.rawValue) as! LoginVC
                self.navigationController?.pushViewController(vc, animated: false)
            }
        }
    }
    
    //MARK: - lottieAnimationSetup
    private func lottieAnimationSetup() {
        animationView.animation = Animation.named(ANIMATION.splashAnimation.rawValue)
        animationView.backgroundColor = .white
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
    }

}
