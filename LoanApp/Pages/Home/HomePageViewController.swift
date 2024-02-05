//
//  HomePageViewController.swift
//  LoanApp
//
//  Created by TBAM on 28/01/2024.
//

import UIKit
//import Toast_Swift
//import ToastViewSwift


class HomePageViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var applicationTitle: UILabel!
    @IBOutlet weak var cardContainer: UIView!
    @IBOutlet weak var cardNumber: UILabel!
    @IBOutlet weak var cardBalanceLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var transferView: UIView!
    @IBOutlet weak var transferImage: UIImageView!
    @IBOutlet weak var transferLabel: UILabel!
    @IBOutlet weak var requestView: UIView!
    @IBOutlet weak var requestImage: UIImageView!
    @IBOutlet weak var requestLabel: UILabel!
    @IBOutlet weak var inOutView: UIView!
    @IBOutlet weak var inOutImage: UIImageView!
    @IBOutlet weak var inOutLabel: UILabel!
    @IBOutlet weak var applicationSubtitle: UILabel!
    @IBOutlet weak var visibilityToggle: UIButton!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var applicationBtn: UIButton!
    @IBOutlet weak var cardActionContainer: UIView!
    @IBOutlet weak var cardNameLabel: UILabel!
    @IBOutlet weak var applicationCard: UIView!
    @IBOutlet weak var subnameLabel: UILabel!
    @IBOutlet weak var serviceTitle: UILabel!
    @IBOutlet weak var notificationIcon: UIImageView!
    @IBOutlet weak var servicesCollectionView: UICollectionView!
    
    let theData: [collectionData] = HomeServiceCollectionViewModel().setUpData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        KeychainHelper.standard.deleteAllItems()
    
        containerView.layer.backgroundColor = UIColor(red: 0.984, green: 0.958, blue: 1, alpha: 1).cgColor
        scrollView.layer.backgroundColor = UIColor(red: 0.984, green: 0.958, blue: 1, alpha: 1).cgColor
        
        
        profileImg.image = UIImage(named: "profileImg")
//        profileImg.layer.cornerRadius = 10
        
        nameLabel.text = "Aung Aung"
        subnameLabel.text = "Gold Member"
        
        cardContainer.layer.backgroundColor = UIColor(red: 151/255.0, green: 121/255.0, blue: 250/255.0, alpha: 1.000).cgColor
        cardContainer.layer.cornerRadius = 20
//        cardContainer.image = UIImage(named: "card box")
        
        cardNameLabel.text = "Aung Aung"
        cardNameLabel.textColor = .white
        cardNumber.text = "341X-XXXX-XXXX-X016"
        cardNumber.textColor = .white
        cardBalanceLabel.text = "Your Credit Balance"
        cardBalanceLabel.textColor = .white
        
        cardActionContainer.backgroundColor = .white
        cardActionContainer.layer.cornerRadius = 20
        
        balanceLabel.text = "*******"
//        balanceLabel.font = UIFont(name: "Arial-Bold", size: 40)
        balanceLabel.textColor = .white
        
        currencyLabel.text = "NGN"
        currencyLabel.textColor = .white
        
        applicationCard.backgroundColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        applicationCard.layer.cornerRadius = 10
        
//        applicationBtn.setTitle("Create Application", for: .normal)
        applicationBtn.tintColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        applicationBtn.backgroundColor = .white
        applicationBtn.layer.cornerRadius = 13
        
        applicationTitle.text = "Make a Loan"
        applicationTitle.textColor = .white
        
        applicationSubtitle.text = "we are ready to help you for your awesome work. let’s invest there."
        applicationSubtitle.textColor = .white
        
        serviceTitle.text = "Services"
        
        transferView.backgroundColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        transferView.layer.cornerRadius = transferView.frame.width / 2
        transferLabel.text = "Transfer"
        transferLabel.textColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        transferImage.image = UIImage(named: "transfer-image")
        
        requestView.backgroundColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        requestView.layer.cornerRadius = requestView.frame.width / 2
        requestLabel.text = "Request"
        requestLabel.textColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        requestImage.image = UIImage(named: "request-image")
        
        inOutView.backgroundColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        inOutView.layer.cornerRadius = inOutView.frame.width / 2
        inOutLabel.text = "In & Out"
        inOutLabel.textColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        inOutImage.image = UIImage(named: "inout-image")
        
        
        
//        let subviews: [UIView] = [
//            profileImg,
//            nameLabel,
//            applicationTitle,
//            cardContainer,
////            cardNumber,
////            cardBalanceLabel,
////            currencyLabel,
////            applicationSubtitle,
////            visibilityToggle,
////            balanceLabel,
////            applicationBtn,
//            cardActionContainer,
////            cardNameLabel,
////            applicationCard,
////            subnameLabel,
//            serviceTitle,
//            servicesCollectionView
//        ]
//        
//        let totalHeight = calculateTotalHeight(of: subviews)
//        print(totalHeight)
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: totalHeight)

        
            
        
        servicesCollectionView.layer.backgroundColor = UIColor(red: 0.984, green: 0.958, blue: 1, alpha: 1).cgColor
        servicesCollectionView.register(UINib(nibName: "HomeServicesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeServicesCollectionViewCell")
        servicesCollectionView.dataSource = self
        servicesCollectionView.delegate = self
        
        
        
        applicationBtn.addTarget(self, action: #selector(apply), for: .touchUpInside)
        
        
    }
    
    @objc func apply(){
        let applicationPage = LoanApplicationViewController()
        self.navigationController?.pushViewController(applicationPage, animated: true)
    }
    


}

extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        theData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeServicesCollectionViewCell", for: indexPath) as! HomeServicesCollectionViewCell
        
        let theCollectionData = theData[indexPath.item]
        cell.updateCell(with: theCollectionData, index: indexPath.item)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthOfScreen = servicesCollectionView.bounds.width
        let widthOfCell = (widthOfScreen - 30)/4
//        print("width of screen is \(widthOfScreen); width of cell is \(widthOfCell)")
        return CGSize(width: widthOfCell, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 0, left: 0, bottom: 0, right: 0)
    }

    
    
    
    
}
