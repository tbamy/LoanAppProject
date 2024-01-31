//
//  TabBarViewController.swift
//  LoanApp
//
//  Created by TBAM on 28/01/2024.
//

import UIKit

class TabBarViewController: UITabBarController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        let homeController = HomePageViewController()
        let stageController = StageViewController()
        let messageController = MessageViewController()
        let settingsController = SettingsViewController()
        
        
        
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        
        homeController.tabBarItem.title = "HOME"
        homeController.tabBarItem.image = UIImage(systemName: "house")
        homeController.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        
//        nnController.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)], for: .normal)
//        nnController.tabBarItem.setTitleTextAttributes([.backgroundColor: UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)], for: .normal)
//        nnController.tabBarItem.image = UIImage(named: "circle")
//        nnController.tabBarItem.image = UIImage(named: "home-icon")


        
        
        stageController.tabBarItem.title = "STAGE"
        stageController.tabBarItem.image = UIImage(systemName: "chart.pie")
        stageController.tabBarItem.selectedImage = UIImage(systemName: "chart.pie.fill")
        
        messageController.tabBarItem.title = "MESSAGE"
        messageController.tabBarItem.image = UIImage(systemName: "message")
        messageController.tabBarItem.selectedImage = UIImage(systemName: "message.fill")
        
        settingsController.tabBarItem.title = "SETTINGS"
        settingsController.tabBarItem.image = UIImage(systemName: "gearshape")
        settingsController.tabBarItem.selectedImage = UIImage(systemName: "gearshape.fill")
        
        
        setViewControllers([homeController, stageController, messageController, settingsController], animated: true)
        
        
        
    }


}
