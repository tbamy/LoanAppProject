//
//  VerificationViewController.swift
//  LoanApp
//
//  Created by TBAM on 25/01/2024.
//

import UIKit

class VerificationViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var textBoxOne: UITextField!
    @IBOutlet weak var textBoxTwo: UITextField!
    @IBOutlet weak var textBoxThree: UITextField!
    @IBOutlet weak var textBoxFour: UITextField!
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var resendLabel: UILabel!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var existingAccountLabel: UILabel!
    @IBOutlet weak var iconLabel: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor(red: 0.984, green: 0.958, blue: 1, alpha: 1).cgColor

        titleLabel.text = "Verification Code"
        titleLabel.textColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        
        subtitleLabel.text = "We send the varification code to your email that you registered, aung****@test.com"
        subtitleLabel.textColor = .gray
        
        notificationLabel.text = "if you didn’t received any code, please click"
        notificationLabel.textColor = .gray
        
        resendLabel.text = "resend"
        resendLabel.textColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        
        submitBtn.setTitle("Submit", for: .normal)
        submitBtn.setTitleColor(.white, for: .normal)
        submitBtn.backgroundColor = UIColor(red: 0.461, green: 0.456, blue: 0.75, alpha: 1)
        submitBtn.layer.cornerRadius = 20
        
        existingAccountLabel.text = "Already have account, Please login"
        existingAccountLabel.textColor = .gray
        
        iconLabel.tintColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        
        submitBtn.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        
    }

    @objc func login(){
        let nextView = LoginViewController()
        navigationController?.pushViewController(nextView, animated: true)
    }


}
