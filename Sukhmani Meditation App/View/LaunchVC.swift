//
//  LaunchVC.swift
//  Sukhmani Meditation App
//
//  Created by MACBOOK on 24/11/21.
//

import UIKit
import Lottie

class LaunchVC: UIViewController {

    @IBOutlet weak var animationView: AnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        lottieAnimationSetup()
    }
    
    //MARK: - lottieAnimationSetup
    private func lottieAnimationSetup() {
        animationView.animation = Animation.named(ANIMATION.splashAnimation.rawValue)
        animationView.backgroundColor = .white
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
        
        UIView.animate(withDuration: 84) {
            
        } completion: { (done) in
            if done {
//                todo
            }
        }

    }

}
