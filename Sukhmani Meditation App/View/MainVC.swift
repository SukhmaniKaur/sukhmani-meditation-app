//
//  MainVC.swift
//  Sukhmani Meditation App
//
//  Created by MACBOOK on 25/11/21.
//

import UIKit

class MainVC: UIViewController {
    
    private var homeListVM: HomeListingViewModel = HomeListingViewModel()

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
        homeListVM.fetchHomeListing()
        homeListVM.collectionArr.bind { [weak self](_) in
            guard let `self` = self else { return }
            if !self.homeListVM.collectionArr.value.isEmpty {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    //MARK: - logoutBtnIsPressed
    @IBAction func logoutBtnIsPressed(_ sender: UIBarButtonItem) {
        setIsUserLogin(isUserLogin: false)
        let navigationVC = STORYBOARD.MAIN.instantiateViewController(withIdentifier: "LoginVCNav") as! UINavigationController
        UIApplication.shared.keyWindow?.rootViewController = navigationVC
        
    }
}

//MARK: - UITableView DataSource and Delegate Methods
extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    //numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeListVM.collectionArr.value.count
    }
    
    // heightForRowAt
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    // cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TABLE_VIEW_CELL.HomeCardCell.rawValue, for: indexPath) as? HomeCardCell else { return UITableViewCell() }
        cell.listData = homeListVM.collectionArr.value[indexPath.row]
        return cell
    }
    
    // didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = STORYBOARD.MAIN.instantiateViewController(withIdentifier: MAIN_STORYBOARD.MeditationVC.rawValue) as! MeditationVC
        vc.meditationName = homeListVM.docIdArray.value[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
