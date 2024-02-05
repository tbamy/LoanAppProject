//
//  LoanApplicationViewController.swift
//  LoanApp
//
//  Created by TBAM on 02/02/2024.
//

import UIKit

class LoanApplicationViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loanTableView: UITableView!
    
    let appData:[appData] = LoanApplicationModel().setUpData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //LoanApplicationTableViewCell.addOverlay()

        titleLabel.text = "Please choose program you want to loan"
        
        
        loanTableView.register(UINib(nibName: "LoanApplicationTableViewCell", bundle: nil), forCellReuseIdentifier: "LoanApplicationTableViewCell")
        loanTableView.dataSource = self
        loanTableView.delegate = self
        
    }




}

extension LoanApplicationViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        appData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LoanApplicationTableViewCell", for: indexPath) as! LoanApplicationTableViewCell
        
        let loanAppData = appData[indexPath.item]
        
        cell.updateCell(with: loanAppData, index: indexPath.item)
        //cell.addOverlay()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
}
