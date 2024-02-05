//
//  HomeServicesCollectionViewCell.swift
//  LoanApp
//
//  Created by TBAM on 30/01/2024.
//

import UIKit

class HomeServicesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgContainer: UIView!
    @IBOutlet weak var imgLabel: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imgContainer.layer.backgroundColor = UIColor(red: 0.35, green: 0.34, blue: 0.78, alpha: 1).cgColor
        imgContainer.layer.cornerRadius = 10
        
    }

    func updateCell(with data: collectionData, index: Int){
       if let imgName = data.imgName {
            imgLabel.image = UIImage(named: imgName)
        }
        if let title = data.title {
            titleLabel.text = "\(title)"
        }
    }
}


