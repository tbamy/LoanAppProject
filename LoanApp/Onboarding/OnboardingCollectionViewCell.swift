//
//  OnboardingCollectionViewCell.swift
//  LoanApp
//
//  Created by TBAM on 25/01/2024.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var getStartedButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.backgroundColor = UIColor(red: 0.984, green: 0.958, blue: 1, alpha: 1).cgColor
        titleView.backgroundColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        titleView.layer.cornerRadius = 15
        
        getStartedButton.isHidden = true

        
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
            getStartedButton?.setTitle("\(data.getStartedButton ?? "Get Started")", for: .normal)
            getStartedButton?.backgroundColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
            getStartedButton?.setTitleColor(.white, for: .normal)
            getStartedButton.layer.cornerRadius = 10
        }
//        else{
//            
//        }
    }

}
