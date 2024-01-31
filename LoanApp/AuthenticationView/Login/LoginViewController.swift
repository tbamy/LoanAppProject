//
//  LoginViewController.swift
//  LoanApp
//
//  Created by TBAM on 25/01/2024.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var regContainer: UIView!
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var biometrics: UIImageView!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var signinBtn: UIButton!
    @IBOutlet weak var newUserLabel: UILabel!
    @IBOutlet weak var signupLabel: UILabel!
    @IBOutlet weak var showHideButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.layer.backgroundColor = UIColor(red: 0.984, green: 0.958, blue: 1, alpha: 1).cgColor
        
        regContainer.layer.cornerRadius = 20
        regContainer.backgroundColor = UIColor.white
        regContainer.layer.shadowColor = UIColor.black.cgColor
        regContainer.layer.shadowOpacity = 0.3
        regContainer.layer.shadowOffset = CGSize(width: 0, height: 2)
        regContainer.layer.shadowRadius = 4
        
        
        logoLabel.text = "ALAT LOANS"
        logoLabel.textColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        
        titleLabel.text = "Please Signin to continue"
        titleLabel.textColor = .gray
        
        forgotPasswordLabel.text = "Forgot Password?"
        forgotPasswordLabel.textColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        
        emailLabel.borderStyle = .roundedRect
        passwordLabel.borderStyle = .roundedRect
        
        signinBtn.backgroundColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        signinBtn.layer.cornerRadius = 10
        
        
        showHideButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        showHideButton.tintColor = .gray
        showHideButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)

        
        newUserLabel.text = "New User?"
        
        signupLabel.text = "Sign Up"
        signupLabel.textColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        
        signinBtn.addTarget(self, action: #selector(verification), for: .touchUpInside)
        
        
    }
    
    func showSuccessModalWithIcon() {
            let alertController = UIAlertController(title: "Success", message: "Sign-in successful!", preferredStyle: .alert)

            // Add an OK action to the alert
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                // Handle OK action (if needed)
            }
            alertController.addAction(okAction)

            // Add an icon to the alert controller
            let iconImage = UIImage(named: "success") // Replace "your_icon_name" with the actual name of your image asset
            let iconImageView = UIImageView(image: iconImage)
            iconImageView.frame = CGRect(x: 10, y: 10, width: 30, height: 30) // Adjust the frame as needed

            // Add the icon image view as a subview to the alert controller's view
            alertController.view.addSubview(iconImageView)

            // Present the alert controller
            present(alertController, animated: true, completion: nil)
        }

    @objc func verification(){
        showSuccessModalWithIcon()
//        let nextView = VerificationViewController()
//        navigationController?.pushViewController(nextView, animated: true)
    }
    
    @objc func togglePasswordVisibility() {
            passwordLabel.isSecureTextEntry.toggle()
            let buttonImageName = passwordLabel.isSecureTextEntry ? "eye.slash" : "eye"
            showHideButton.setImage(UIImage(systemName: buttonImageName), for: .normal)
    }

}
