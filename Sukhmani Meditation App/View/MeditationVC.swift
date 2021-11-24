//
//  MeditationVC.swift
//  Sukhmani Meditation App
//
//  Created by MACBOOK on 25/11/21.
//

import UIKit
import SainiUtils

class MeditationVC: UIViewController {

    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var bgImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    //MARK: - configUI
    private func configUI() {
        playBtn.sainiCornerRadius(radius: playBtn.frame.height / 2)
    }
    
    //MARK: - playBtnIsPressed
    @IBAction func playBtnIsPressed(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }

}
