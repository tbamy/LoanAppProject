//
//  SplashScreenViewController.swift
//  LoanApp
//
//  Created by TBAM on 25/01/2024.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    @IBOutlet weak var logo : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor(red: 0.984, green: 0.958, blue: 1, alpha: 1).cgColor

        logo.text = "ALAT LOANS"
        logo.textColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
//        logo.font = UIFont(name: "Arial-Bold", size: 35)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.99
        
        let timer = Timer(timeInterval: 2, target: self, selector: #selector(navigatenextView), userInfo: nil, repeats: false)
        RunLoop.main.add(timer, forMode: .common)
    }

    @objc func navigatenextView(){
        let nextView = OnboardingViewController()
        navigationController?.pushViewController(nextView, animated: true)
    }
}
