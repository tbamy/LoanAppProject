//
//  LoanApplicationTableViewCell.swift
//  LoanApp
//
//  Created by TBAM on 02/02/2024.
//

import UIKit

class LoanApplicationTableViewCell: UITableViewCell {

    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageLabel.layer.cornerRadius = 10
        titleLabel.textColor = .white
        addOverlay()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func addOverlay() {
        // Create an overlay layer
        let overlayLayer = CALayer()
        overlayLayer.backgroundColor = UIColor(red: 0.404, green: 0.396, blue: 0.91, alpha: 0.5).cgColor
        overlayLayer.frame = CGRect(x: 0.0, y: 0.0, width: 355.0, height: 160.0)

        // Add overlay layer to the image view's layer
        imageLabel.layer.addSublayer(overlayLayer)
        
//        print("imageLabel bounds: \(imageLabel.bounds)")
//        print("imageLabel frame: \(imageLabel.frame)")
    }
    
    
    func updateCell(with data: appData, index: Int){
        if let imgName = data.imgName{
            imageLabel.image = UIImage(named: imgName)
            
        }
        if let title = data.title{
            titleLabel.text = title
        }
    }
}
