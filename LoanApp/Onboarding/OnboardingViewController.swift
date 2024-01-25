//
//  OnboardingViewController.swift
//  LoanApp
//
//  Created by TBAM on 25/01/2024.
//

import UIKit

class OnboardingViewController: UIViewController{
    

    let onboardingViews: [DataModel] = OnboardingModel().setUpData()

    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var timer: Timer?
    var currentPage = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor(red: 0.984, green: 0.958, blue: 1, alpha: 1).cgColor
        myCollectionView.layer.backgroundColor = UIColor(red: 0.984, green: 0.958, blue: 1, alpha: 1).cgColor
        navigationItem.hidesBackButton = true
        
        myCollectionView.register(UINib(nibName: "OnboardingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OnboardingCollectionViewCell")
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        pageControl.currentPageIndicatorTintColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        
        
        startAutoScroll()
        
    }

    func startAutoScroll() {
            // Invalidate the timer if it's already running
            timer?.invalidate()
            
            // Set up a timer to trigger the auto-scroll
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
        }
    
    
    @objc func autoScroll() {
            // Increment the current index and scroll to the next item
//        currentPage = (currentPage + 1) % onboardingViews.count
//            let indexPath = IndexPath(item: currentPage, section: 0)
//            myCollectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
        
        let contentOffset = CGPoint(x: myCollectionView.contentOffset.x + myCollectionView.frame.width, y: myCollectionView.contentOffset.y)

                // Scroll to the next item with a smooth animation
        myCollectionView.setContentOffset(contentOffset, animated: true)
        
        }

}



extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        onboardingViews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell
        cell.delegate = self
        let onboardingData = onboardingViews[indexPath.item]
        cell.updateCell(with: onboardingData, index: indexPath.item)
        
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthOfView = myCollectionView.bounds.width
        let heightOfView = myCollectionView.bounds.height
        return CGSize(width: widthOfView, height: heightOfView)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }
}

extension OnboardingViewController: OnboardingViewDelegate{
    func didTapButton() {
        let nextView = RegisterViewController()
        navigationController?.pushViewController(nextView, animated: true)
    }
    
    
}
