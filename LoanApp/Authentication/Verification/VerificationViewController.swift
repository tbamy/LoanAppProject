//
//  VerificationViewController.swift
//  LoanApp
//
//  Created by TBAM on 25/01/2024.
//

import UIKit
import ToastViewSwift

class VerificationViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
//    @IBOutlet weak var textBoxOne: UITextField!
//    @IBOutlet weak var textBoxTwo: UITextField!
//    @IBOutlet weak var textBoxThree: UITextField!
//    @IBOutlet weak var textBoxFour: UITextField!
//    @IBOutlet weak var textBoxFive: UITextField!
//    @IBOutlet weak var textBoxSix: UITextField!
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var resendLabel: UILabel!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var existingAccountLabel: UILabel!
    @IBOutlet weak var iconLabel: UIImageView!
    
    let networkCall = NetworkCall()
    var verificationModel : VerificationModel?
    var verificationViewModel : VerificationViewModel?
    var verificationResponseModel : VerificationResponseModel?
    
    
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor(red: 0.984, green: 0.958, blue: 1, alpha: 1).cgColor
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)

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
        
        
        //submitBtn.isEnabled = false
        
        for textField in textFields {
            textField.delegate = self
            textField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
            
        }
                 
        
        //submitBtn.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        verificationViewModel = VerificationViewModel(networkCall: networkCall)
        verificationViewModel?.delegate = self
        
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        if textField.text?.count ?? 0 < 1 {
            textField.text = ""
        }
        if textField.text?.count ?? 0 > 1 {
            textField.text = String(textField.text?.first ?? " ")
        }
        guard
            let one = textFields[0].text, !one.isEmpty,
            let two = textFields[1].text, !two.isEmpty,
            let three = textFields[2].text, !three.isEmpty,
            let four = textFields[3].text, !four.isEmpty,
            let five = textFields[4].text, !five.isEmpty,
            let six = textFields[5].text, !six.isEmpty
        else {
            //self.submitBtn.isEnabled = false
            return
        }
        submitBtn.backgroundColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        submitBtn.addTarget(self, action: #selector(verify), for: .touchUpInside)
//        submitBtn.isEnabled = true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight(rawValue: 1))
         textField.textAlignment = .center
         let currentText = textField.text ?? ""
         guard let stringRange = Range(range, in: currentText) else { return false }
         let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
         return updatedText.count <= 1
     }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard textField.isEditing else {
            
            return
        }

        if let index = textFields.firstIndex(of: textField), index + 1 < textFields.count {
            let nextResponder = textFields[index + 1]
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
    }
 
    
    
    func verifyOtp(_ textFields: [UITextField]) async{
        
        let otp = textFields.map { $0.text ?? "" }.joined()
            
        //print("Verification in progress with OTP: \(otp)")
        
        let verificationModel = VerificationModel(otp: otp)
        
        await verificationViewModel?.verifyOtp(otp: verificationModel)

    }

    @objc func verify(){
        Task {
            await verifyOtp(textFields)
        }
//        let nextView = LoginViewController()
//        navigationController?.pushViewController(nextView, animated: true)
    }
    
    
    func showAlert(title: String, message: String, completion: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: completion))
        present(alert, animated: true, completion: nil)
    }


}


extension VerificationViewController: VerificationDelegate{
    func verificationDidSucceed(response: VerificationResponseModel) {
        if response.success == true {
            self.activityIndicator.stopAnimating()
            let message = response.message
            let verifySuccessToast = Toast.default(
                image: UIImage(systemName: "checkmark.circle")!,
                title: "Success",
                subtitle: message
            )
            verifySuccessToast.show()
//            showAlert(title: "Success", message: message ?? "Verification Successful") { _ in
                let loginController = LoginViewController()
                self.navigationController?.pushViewController(loginController, animated: true)
//            }
            
        }else{
            self.activityIndicator.stopAnimating()
            let message = response.message
            let verifyErrorToast = Toast.default(
                image: UIImage(systemName: "exclamationmark.circle")!,
                title: "Try Again",
                subtitle: "Verification Failed, Please Try Again"
            )
            verifyErrorToast.show()
//            showAlert(title: "Error", message: message ?? "Verification Failed")
        }
            
    }
    
    func verificationDidFail(error: Error) {
        let verifyErrorToast = Toast.default(
            image: UIImage(systemName: "exclamationmark.circle")!,
            title: "Try Again",
            subtitle: "Error Occurred, Please Try Again"
        )
        verifyErrorToast.show()
//        showAlert(title: "Error", message: "Error Occured, try again")
    }
    
    
}
