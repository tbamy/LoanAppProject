//
//  LoginViewController.swift
//  LoanApp
//
//  Created by TBAM on 25/01/2024.
//

import UIKit
import ToastViewSwift

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
    
    
    let networkCall = NetworkCall()
    var loginModel : LoginModel?
    var loginViewModel : LoginViewModel?
    var loginResponseModel : LoginResponseModel?
    
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
        
        titleLabel.text = "Please Signin to continue"
        titleLabel.textColor = .gray
        
        forgotPasswordLabel.text = "Forgot Password?"
        forgotPasswordLabel.textColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        
        emailLabel.borderStyle = .roundedRect
        passwordLabel.borderStyle = .roundedRect
        passwordLabel.isSecureTextEntry = true
        
        signinBtn.backgroundColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        signinBtn.layer.cornerRadius = 10
        
        
        showHideButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        showHideButton.tintColor = .gray
        showHideButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)

        
        newUserLabel.text = "New User?"
        
        signupLabel.text = "Sign Up"
        signupLabel.textColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        
        signinBtn.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        loginViewModel = LoginViewModel(networkCall: networkCall)
        loginViewModel?.delegate = self
        
    }
    
    func loginVerification() async {
        activityIndicator.startAnimating()
//        errorLabel.text = ""
        guard let email = emailLabel.text, !email.isEmpty,
                let password = passwordLabel.text, !password.isEmpty else {
            
            let error = Toast.default(
                image: UIImage(systemName: "exclamationmark.circle")!,
                title: "Error",
                subtitle: "Email or Password cannot be empty"
            )
            error.show()
            
//            errorLabel.text = "Please fill in all fields"
            self.activityIndicator.stopAnimating()
                    return
                }

        let loginModel = LoginModel(email: email, password: password)


             await loginViewModel?.loginUser(login: loginModel)

    }

    
    @objc func togglePasswordVisibility() {
            passwordLabel.isSecureTextEntry.toggle()
            let buttonImageName = passwordLabel.isSecureTextEntry ? "eye.slash" : "eye"
            showHideButton.setImage(UIImage(systemName: buttonImageName), for: .normal)
    }
    


    @objc func login(){
        Task {
            await loginVerification()
        }
        
    }

}

extension LoginViewController: LoginDelegate{
    func loginDidSucceed(response: LoginResponseModel) {
        if let token = response.token {
            self.activityIndicator.stopAnimating()
            
            let token = Data(token.utf8)
//            print(token)
            
            let firstName = Data((response.userDetails?.firstName?.utf8)!)
            let lastName = Data((response.userDetails?.lastName?.utf8)!)
            let email = Data((response.userDetails?.email?.utf8)!)
            
//            KeychainHelper.standard.deleteAllItems()
            
            KeychainHelper.standard.save(token, service: "userToken", account: "loanApp")
            KeychainHelper.standard.save(firstName, service: "userFirstName", account: "loanApp")
            KeychainHelper.standard.save(lastName, service: "userLastName", account: "loanApp")
            KeychainHelper.standard.save(email, service: "userEmail", account: "loanApp")
            
            let message = "Login Successful"
            let verifySuccessToast = Toast.default(
                image: UIImage(systemName: "checkmark.circle")!,
                title: "Success",
                subtitle: message
            )
            verifySuccessToast.show()
//            showAlert(title: "Success", message: message ?? "Verification Successful") { _ in
                let tabBar = TabBarViewController()
                self.navigationController?.pushViewController(tabBar, animated: true)
//            }
            
        }else{
            self.activityIndicator.stopAnimating()
            let message = "Invalid Credentials"
            let verifyErrorToast = Toast.default(
                image: UIImage(systemName: "exclamationmark.circle")!,
                title: "Try Again",
                subtitle: message
            )
            verifyErrorToast.show()
//            showAlert(title: "Error", message: message ?? "Verification Failed")
        }
    }
    
    func loginDidFail(error: Error) {
        self.activityIndicator.stopAnimating()
        let message = "Oops! Error Occured"
        let verifyErrorToast = Toast.default(
            image: UIImage(systemName: "exclamationmark.circle")!,
            title: "Try Again",
            subtitle: message
        )
        verifyErrorToast.show()
    }
    
    
}
