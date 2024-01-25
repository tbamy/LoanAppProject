//
//  OnboardingOneViewController.swift
//  LoanApp
//
//  Created by TBAM on 25/01/2024.
//

import UIKit

class OnboardingOneViewController: UIViewController {

    @IBOutlet weak var logo: UILabel!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
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
        titleLabel.text = "Fixed Deposit"
        
        titleLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        titleLabel.font = UIFont(name: "MyanmarKhyay-Regular", size: 20)
//        
        imageView.image = UIImage(named: "onboarding1")
        
        
        pageControl.currentPageIndicatorTintColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        pageControl.pageIndicatorTintColor = UIColor.lightGray
//

        
        pageControl.addTarget(self, action: #selector(pageControlValueChanged), for: .valueChanged)
        

        // Do any additional setup after loading the view.
    }

    @objc func pageControlValueChanged(sender: UIPageControl) {
            // Handle page change event
            print("Page changed to \(sender.currentPage + 1)")
        }

        // Function to update UIPageControl when the number of pages changes
        func updatePageControl(withNumberOfPages numberOfPages: Int) {
            pageControl.numberOfPages = numberOfPages
        }

        // Function to update UIPageControl when the current page changes
        func updatePageControl(withCurrentPage currentPage: Int) {
            pageControl.currentPage = currentPage
        }

}
