//
//  StageViewController.swift
//  LoanApp
//
//  Created by TBAM on 29/01/2024.
//

import UIKit

class StageViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var containerView: UIView!
        var loans: [stageData] = StageViewModel().setUpData()

    override func viewDidLoad() {
        super.viewDidLoad()
//        scrollView.backgroundColor = UIColor(red: 0.984, green: 0.958, blue: 1, alpha: 1)
        tableView.backgroundColor = UIColor(red: 0.984, green: 0.958, blue: 1, alpha: 1)
        
        
        tableView.register(UINib(nibName: "StageTableViewCell", bundle: nil), forCellReuseIdentifier: "StageTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
//        title = "Stage"
        
    }




}

extension StageViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        loans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StageTableViewCell", for: indexPath) as! StageTableViewCell
        
        cell.updateCell(with: loans[indexPath.item], index: indexPath.item)
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        220
    }
    
    
}
