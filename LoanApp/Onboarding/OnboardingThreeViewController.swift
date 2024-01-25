//
//  OnboardingThreeViewController.swift
//  LoanApp
//
//  Created by TBAM on 25/01/2024.
//

import UIKit

class OnboardingThreeViewController: UIViewController {

    @IBOutlet weak var logo: UILabel!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
 
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor(red: 0.984, green: 0.958, blue: 1, alpha: 1).cgColor
        
        
        
        logo.text = "ALAT LOANS"
        logo.textColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        //
        titleView.backgroundColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        titleView.layer.cornerRadius = 20
        //
        titleButton.setTitle("Get Started", for: .normal)
        
//        titleButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal) = 
//        titleButton.font = UIFont(name: "MyanmarKhyay-Regular", size: 20)
        //
        imageView.image = UIImage(named: "onboarding3")
        
        
        pageControl.currentPageIndicatorTintColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(getStarted))
        titleButton.addGestureRecognizer(tapGesture)
    }

    @objc func getStarted() {
        let nextView = RegisterViewController()
        navigationController?.pushViewController(nextView, animated: true)
       }
}
