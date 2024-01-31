//
//  RegisterViewController.swift
//  LoanApp
//
//  Created by TBAM on 25/01/2024.
//

import UIKit

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var regContainer: UIView!
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var rememberBox: UIButton!
    @IBOutlet weak var rememberLabel: UILabel!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var existingLabel: UILabel!
    @IBOutlet weak var signinLabel: UILabel!
    @IBOutlet weak var showHideButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    let networkCall = NetworkCall()
    var registrationViewModel: RegistrationViewModel!
    
    var registrationResponseModel: RegistrationResponseModel?
    var registrationModel: RegistrationModel?

    let activityIndicator = UIActivityIndicatorView(style: .large)
    override func viewDidLoad() {
        super.viewDidLoad()
    

        view.layer.backgroundColor = UIColor(red: 0.984, green: 0.958, blue: 1, alpha: 1).cgColor
        activityIndicator.hidesWhenStopped = true
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
        
        regContainer.layer.cornerRadius = 20
        regContainer.backgroundColor = UIColor.white
        regContainer.layer.shadowColor = UIColor.black.cgColor
        regContainer.layer.shadowOpacity = 0.3
        regContainer.layer.shadowOffset = CGSize(width: 0, height: 2)
        regContainer.layer.shadowRadius = 4
        
        
        logoLabel.text = "ALAT LOANS"
        logoLabel.textColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        
        titleLabel.text = "Please Signup to continue"
        titleLabel.textColor = .gray
        
        subtitleLabel.text = "Create Your Account"
        subtitleLabel.textColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        
        nameLabel.borderStyle = .roundedRect
        emailLabel.borderStyle = .roundedRect
        passwordLabel.borderStyle = .roundedRect
        passwordLabel.isSecureTextEntry = true
        
        errorLabel.text = ""
        errorLabel.textColor = .systemRed
        
        signupBtn.backgroundColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        signupBtn.layer.cornerRadius = 10
        
        rememberBox.layer.borderColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1).cgColor
        rememberBox.layer.borderWidth = 1.5
        rememberBox.layer.cornerRadius = 5
        rememberBox.tintColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
//        rememberBox.setImage(nil, for: .normal)
        rememberBox.isSelected = false
        rememberBox.addTarget(self, action: #selector(toggleRememberBtn), for: .touchUpInside)
        
        
        
        rememberLabel.text = "Remember me"
        rememberLabel.textColor = .gray
        
        existingLabel.text = "Already have an account,"
        
        
        signinLabel.text = "Sign In"
        signinLabel.textColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        signinLabel.isUserInteractionEnabled = true
        let signInGesture = UITapGestureRecognizer(target: self, action: #selector(navigateToSignin))
        signinLabel.addGestureRecognizer(signInGesture)
        
        showHideButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        showHideButton.tintColor = .gray
        showHideButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)

        
        
        signupBtn.addTarget(self, action: #selector(registration), for: .touchUpInside)
        
        registrationViewModel = RegistrationViewModel(networkCall: networkCall)
        registrationViewModel.delegate = self
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
                view.addGestureRecognizer(tapGesture)
        
        
        
    }

    func userRegistration() async {
        activityIndicator.startAnimating()
        guard let name = nameLabel.text, !name.isEmpty,
                let email = emailLabel.text, !email.isEmpty,
                let password = passwordLabel.text, !password.isEmpty else {
            errorLabel.text = "Please fill in all fields"
//                    print("Please fill in all fields")
                    return
                }

        let registrationModel = RegistrationModel(name: name, email: email, password: password)


             await registrationViewModel.registerUser(registration: registrationModel)

    }

    
    @objc func registration() {
        
        Task {
                await userRegistration()
            }

        
    }
    
    @objc func togglePasswordVisibility() {
            passwordLabel.isSecureTextEntry.toggle()
            let buttonImageName = passwordLabel.isSecureTextEntry ? "eye.slash" : "eye"
            showHideButton.setImage(UIImage(systemName: buttonImageName), for: .normal)
    }
    
    @objc func dismissKeyboard() {
            view.endEditing(true)
    }
    
    @objc func toggleRememberBtn() {
        rememberBox.isSelected.toggle()

        let newImage = rememberBox.isSelected ? UIImage(systemName: "checkmark.square.fill") : nil

        rememberBox.setImage(newImage, for: .normal)
    }


    @objc func navigateToSignin() {
            // Perform the navigation to the next view controller here
            let signInController = LoginViewController()
            navigationController?.pushViewController(signInController, animated: true)
        }

    
    func showAlert(title: String, message: String, completion: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: completion))
        present(alert, animated: true, completion: nil)
    }

}



extension RegisterViewController: RegistrationDelegate{
    
    func registrationDidSucceed(response: RegistrationResponseModel) {
//        let response = response.message
        print(response)
        
        if response.success == true{
            self.activityIndicator.stopAnimating()
            let message = response.message
            showAlert(title: "Success", message: message ?? "Registration Successful") { _ in
                    let otpController = VerificationViewController()
                    self.navigationController?.pushViewController(otpController, animated: true)
                }
        }else{
            self.activityIndicator.stopAnimating()
            let message = response.message
            showAlert(title: "Error", message: message ?? "Error Occurred, Try Again")
        }
//        print("This is the response \(response)")
        
        
    }
    
    func registrationDidFail(error: Error) {
        showAlert(title: "Error", message: "Error Occurred, Please Try Again")
//        print(error)
    }
    
    
}

