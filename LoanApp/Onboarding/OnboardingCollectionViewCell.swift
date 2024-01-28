//
//  OnboardingCollectionViewCell.swift
//  LoanApp
//
//  Created by TBAM on 25/01/2024.
//

import UIKit

protocol OnboardingViewDelegate: AnyObject {
    func didTapButton()
}

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var getStartedButton: UIButton!
    
    
//    let containerView: UIView = {
//        let containerView = UIView()
//        containerView.translatesAutoresizingMaskIntoConstraints = false
//        
//        return containerView
//    }()
//    
//    let logoLabel: UILabel = {
//        let logoLabel = UILabel()
//        logoLabel.translatesAutoresizingMaskIntoConstraints = false
//        
//        return logoLabel
//    }()
//    
//    let titleView: UIView = {
//        let titleView = UIView()
//        titleView.translatesAutoresizingMaskIntoConstraints = false
//        
//        return titleView
//    }()
//    
//    let titleLabel: UILabel = {
//        let titleLabel = UILabel()
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        
//        return titleLabel
//    }()
//    
//    let imageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        
//        return imageView
//    }()
//    
//    let getStartedButton: UIButton = {
//        let getStartedButton = UIButton()
//        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
//        
//        return getStartedButton
//    }()
    
    
    
    weak var delegate: OnboardingViewDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
//        contentView.addSubview(containerView)
        
        
        containerView.layer.backgroundColor = UIColor(red: 0.984, green: 0.958, blue: 1, alpha: 1).cgColor
        titleView.backgroundColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        titleView.layer.cornerRadius = 15
        
        getStartedButton.isHidden = true
        
        
        
//        NSLayoutConstraint.activate([
//            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
//            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
//            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
//            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
//            
//            containerView.heightAnchor.constraint(equalToConstant: 100),
//            
//            
//            logoLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
////            logoLabel.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
//            logoLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
//            logoLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
//            
//            titleView.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 20),
//            titleView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
//            titleView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
//            
//            titleLabel.topAnchor.constraint(equalTo: titleView.topAnchor, constant: 5),
//            titleLabel.bottomAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 20),
//            titleLabel.leadingAnchor.constraint(equalTo: titleView.leadingAnchor, constant: 20),
//            titleLabel.trailingAnchor.constraint(equalTo: titleView.trailingAnchor, constant: -20),
//            
//            
//            imageView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 20),
//            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
//            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
//            
//        ])

        
    }
    
    func updateCell(with data: DataModel, index: Int){
        if let logo = data.logo{
            logoLabel.text = logo
            logoLabel.textColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        }
        if let title = data.title{
            titleLabel.text = title
            titleLabel.textColor = .white
        }
        
        if let imageViews = data.imageView{
            imageView.image = UIImage(named: "\(imageViews)")
        }
        if index == 2 {
            titleView.isHidden = true
            titleLabel.isHidden = true
            getStartedButton.isHidden = false
            getStartedButton.setTitle("\(data.getStartedButton ?? "Get Started")", for: .normal)
            getStartedButton.backgroundColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
            getStartedButton.setTitleColor(.white, for: .normal)
            getStartedButton.layer.cornerRadius = 10
            
            getStartedButton.addTarget(self, action: #selector(getStarted), for: .touchUpInside)
        }
        
    }
    @objc func getStarted() {
        delegate?.didTapButton()
       }

}
