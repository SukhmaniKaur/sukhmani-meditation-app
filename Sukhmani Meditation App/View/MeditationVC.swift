//
//  MeditationVC.swift
//  Sukhmani Meditation App
//
//  Created by MACBOOK on 25/11/21.
//

import UIKit
import SainiUtils

class MeditationVC: UIViewController {
    
    private var meditationDetailVM: MeditationDetailViewModel = MeditationDetailViewModel()
    var meditationName: String = String()

    // OUTLETS
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var bgImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    //MARK: - configUI
    private func configUI() {
        playBtn.sainiCornerRadius(radius: playBtn.frame.height / 2)
        
        meditationDetailVM.fetchMeditationDetail(meditationName: meditationName)
        
        meditationDetailVM.detailArr.bind { [weak self](_) in
            guard let `self` = self else { return }
            if !self.meditationDetailVM.detailArr.value.imageLink.isEmpty {
                self.bgImage.downloadCachedImage(placeholder: "", urlString: self.meditationDetailVM.detailArr.value.imageLink)
            }
        }
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
