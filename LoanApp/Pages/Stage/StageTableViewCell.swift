//
//  StageTableViewCell.swift
//  LoanApp
//
//  Created by TBAM on 31/01/2024.
//

import UIKit

class StageTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var stageOne: UIView!
    @IBOutlet weak var stageOneLabel: UILabel!
    @IBOutlet weak var stageTwo: UIView!
    @IBOutlet weak var stageTwoLabel: UILabel!
    @IBOutlet weak var stageThree: UIView!
    @IBOutlet weak var stageThreeLabel: UILabel!
    @IBOutlet weak var dividerOne: UIView!
    @IBOutlet weak var dividerTwo: UIView!
    @IBOutlet weak var reapplyLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.backgroundColor = UIColor(red: 0.984, green: 0.958, blue: 1, alpha: 1)
        
        
        container.backgroundColor = .white
        container.layer.cornerRadius = 5
        
        titleLabel.text = "Your Loan Program Progress :"
        titleLabel.textColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        title.textColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        
        
        stageOne.layer.cornerRadius = stageOne.bounds.width / 2
        stageOneLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        stageOneLabel.text = "Application Submitted"
        
        stageTwo.layer.cornerRadius = stageTwo.bounds.width / 2
        stageTwoLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        stageTwoLabel.text = "Processing"
        
        stageThree.layer.cornerRadius = stageThree.bounds.width / 2
        stageThreeLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        stageThreeLabel.text = "Loan Acceptance"
        
        dividerOne.backgroundColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        dividerTwo.backgroundColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
        
        
        reapplyLabel.text = "If you want to do re-apply or edit your data, you can do it"
        reapplyLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        editButton.layer.backgroundColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1).cgColor
        editButton.layer.cornerRadius = 12
        editButton.tintColor = .white
//        editButton.setTitle("Edit Info", for: .normal)
        
        
        cancelButton.tintColor = UIColor(red: 0.837, green: 0.304, blue: 0.336, alpha: 1)
        cancelButton.layer.cornerRadius = 12 
        cancelButton.layer.borderWidth = 1.5
        cancelButton.layer.borderColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1).cgColor
        cancelButton.backgroundColor = .white
//        cancelButton.setTitle("Cancel Application", for: .normal)
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(with data: stageData, index: Int){
        
        if let loanName = data.loanName {
            title.text = loanName
        }
        if let progress = data.progress {
            switch progress {
            case 1:
                stageOne.backgroundColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
                stageTwo.backgroundColor = .systemGray
                stageThree.backgroundColor = .systemGray
            case 2:
                stageOne.backgroundColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
                stageTwo.backgroundColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
                stageThree.backgroundColor = .systemGray
            case 3:
                stageOne.backgroundColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
                stageTwo.backgroundColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
                stageThree.backgroundColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 1)
            default:
                stageOne.backgroundColor = .systemGray
                stageTwo.backgroundColor = .systemGray
                stageThree.backgroundColor = .systemGray
            }
            
        }
    }
    
}
