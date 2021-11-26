//
//  MeditationVC.swift
//  Sukhmani Meditation App
//
//  Created by MACBOOK on 25/11/21.
//

import UIKit
import SainiUtils
import AVKit

class MeditationVC: UIViewController {
    
    private var meditationDetailVM: MeditationDetailViewModel = MeditationDetailViewModel()
    var meditationName: String = String()
    var player : AVAudioPlayer?
    
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
            stopMusic()
        } else {
            sender.isSelected = true
            let urlstring = meditationDetailVM.detailArr.value.link
            guard let url = URL(string: urlstring) else { return }
            print("the url = \(url)")
            meditationDetailVM.downloadFileFromURL(url: url, {[weak self] url in
                guard let linkUrl = url else { return }
                self?.playMusic(url: linkUrl)
            })
        }
    }
    
    //MARK: - playMusic
    private func playMusic(url: URL) {
        print("playing \(url)")
        DispatchQueue.main.async {
            UIViewController.top?.view.sainiRemoveLoader()
        }
        do {
            self.player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
            player?.volume = 1.0
            player?.play()
        } catch let error as NSError {
            print(error.localizedDescription)
        } catch {
            print("AVAudioPlayer init failed")
        }
    }
    
    //MARK: - stopMusic
    private func stopMusic() {
        self.player?.stop()
    }
}
