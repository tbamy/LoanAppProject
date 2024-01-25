//
//  OnboardingPageViewController.swift
//  LoanApp
//
//  Created by TBAM on 25/01/2024.
//

import UIKit

class OnboardingPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    
    
    private var contentControllers: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        delegate = self
        
        navigationItem.hidesBackButton = true
        
        let OnboardingViewOne = OnboardingOneViewController()

        let OnboardingViewTwo = OnboardingTwoViewController()
        
        let OnboardingViewThree = OnboardingThreeViewController()
        
        contentControllers = [OnboardingViewOne, OnboardingViewTwo, OnboardingViewThree]

        
        if let initialViewController = contentControllers.first {
            setViewControllers([initialViewController], direction: .forward, animated: true, completion: nil)
        }
        
    }
    

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = contentControllers.firstIndex(of: viewController), currentIndex > 0 else {
                    return nil
                }

                return contentControllers[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = contentControllers.firstIndex(of: viewController), currentIndex < contentControllers.count - 1 else {
                    return nil
                }

                return contentControllers[currentIndex + 1]
    }

}
