//
//  ViewController.swift
//  demo
//
//  Created by vishal lakum on 12/02/20.
//  Copyright © 2020 vishal lakum. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tvMain: UITableView!
    @IBOutlet weak var filterCV: UICollectionView!

    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var menuAlfaView: UIView!
    @IBOutlet weak var btnUserProfile: UIButton!
    @IBOutlet weak var btnChangePassword: UIButton!
    @IBOutlet weak var btnLogout: UIButton!
    @IBOutlet weak var lblNoData: UILabel!
    @IBOutlet weak var btnClear: UIButton!


    var notificationDetail = NotificationDetailRoot()
    var curPage = 1
    var totalPage = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tvMain.delegate        = self
        self.tvMain.dataSource      = self
        self.tvMain.estimatedRowHeight  = 100
        self.tvMain.rowHeight           = UITableView.automaticDimension
        self.tvMain.register(UINib(nibName: "NotificationTvCell", bundle: nil), forCellReuseIdentifier: "NotificationTvCell")
        self.tvMain.tableFooterView = UIView()
        self.lblNoData.isHidden = true
        self.btnClear.clipsToBounds = true
        self.btnClear.isHidden = true
    }
    func setUpFilterVC() {
        self.filterCV.register(UINib(nibName: "ResourceFilterCell", bundle: nil), forCellWithReuseIdentifier: "ResourceFilterCell")
        self.filterCV.register(UINib(nibName: "BehaviourListingCell", bundle: nil), forCellWithReuseIdentifier: "BehaviourListingCell")
        self.filterCV.dataSource = self
        self.filterCV.delegate = self
        self.filterCV.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if self.tabBarController != nil {
            self.tabBarController?.tabBar.isHidden = false
        }
        self.curPage = 1
        self.totalPage = 0
    }


    
    @IBAction func btnUserProfileTapped(_ sender: Any) {
        let VC = dashboardSB.instantiateViewController(withIdentifier: "UserPrifileVC") as! UserPrifileVC
        self.moveOnVC(VCMove: VC, animated: true)
    }
    
    @IBAction func btnChangePasswordTapped(_ sender: Any) {
        let VC = mainSB.instantiateViewController(withIdentifier: "ChangePasswordVC") as! ChangePasswordVC
        self.moveOnVC(VCMove: VC, animated: true)
    }
    
    @IBAction func btnLogoutTapped(_ sender: Any) {
        self.logout()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notificationDetail.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTvCell", for: indexPath) as! NotificationTvCell
        cell.lblTitle.text = self.notificationDetail.data[indexPath.row].createdDateStr
        cell.lblDesc.text  = self.notificationDetail.data[indexPath.row].message
        //cell.contentView.backgroundColor = AppColor.ALTERNETLISTBACKGROUND[indexPath.row % 2]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if self.parentFilterType == "Mentors" {
            let width = ((UIScreen.main.bounds.width - 1) / 2 )
            return CGSize(width: width , height: width + 70)
        }
        else
        {
            
            let width = ((UIScreen.main.bounds.width - 1) / 2 )
            return CGSize(width: width , height: (UIScreen.main.bounds.height - self.headerView.frame.height - (self.tabBarController?.tabBar.frame.height)! - UIApplication.shared.statusBarFrame.height - 3 ) / 4)
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.parentFilterType == "Mentors" {
            return self.filteredMentorList.count
        }
        else
        {
            return self.behaviourList.data.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if self.parentFilterType == "Mentors" {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResourceFilterCell", for: indexPath) as! ResourceFilterCell

            let profile_path = self.filteredMentorList[indexPath.row].pProfilePicture
            let profile_Newpath = profile_path!.replacingOccurrences(of: "~", with: "", options: .literal, range: nil)
            cell.img.sd_setShowActivityIndicatorView(true)
            cell.img.sd_setIndicatorStyle(.gray)
            cell.img.sd_setImage(with: URL(string: API.BASEURL + profile_Newpath), placeholderImage: UIImage(named: "User.png"), options: [.continueInBackground,.lowPriority], completed: {(image,error,cacheType,url) in
            })
            cell.lblTitle.text = self.filteredMentorList[indexPath.row].fullName
            cell.lblSubTitle.text = self.filteredMentorList[indexPath.row].behavior
            cell.img.clipsToBounds = true
            return cell
        }
        else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BehaviourListingCell", for: indexPath) as! BehaviourListingCell

            let profile_path = self.behaviourList.data[indexPath.row].pFeaturedImagePath
            let profile_Newpath = profile_path!.replacingOccurrences(of: "~", with: "", options: .literal, range: nil)
            cell.img.sd_setShowActivityIndicatorView(true)
            cell.img.sd_setIndicatorStyle(.gray)
            cell.img.sd_setImage(with: URL(string: API.BASEURL + profile_Newpath), placeholderImage: UIImage(named: "DefultThumb"), options: [.continueInBackground,.lowPriority], completed: {(image,error,cacheType,url) in
            })
            cell.img.backgroundColor = AppColor.BEHAVIOURBACKGROUND[indexPath.row]

            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}
}
