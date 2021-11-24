//
//  MainVC.swift
//  Sukhmani Meditation App
//
//  Created by MACBOOK on 25/11/21.
//

import UIKit

class MainVC: UIViewController {

    // OUTLETS
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    //MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    //MARK: - configUI
    private func configUI() {
        tableView.register(UINib(nibName: TABLE_VIEW_CELL.HomeCardCell.rawValue, bundle: nil), forCellReuseIdentifier: TABLE_VIEW_CELL.HomeCardCell.rawValue)
    }
}

//MARK: - UITableView DataSource and Delegate Methods
extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    //numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    // heightForRowAt
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    // cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TABLE_VIEW_CELL.HomeCardCell.rawValue, for: indexPath) as? HomeCardCell else { return UITableViewCell() }
        return cell
    }
    
    // didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = STORYBOARD.MAIN.instantiateViewController(withIdentifier: MAIN_STORYBOARD.MeditationVC.rawValue) as! MeditationVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
