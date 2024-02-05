//
//  LoanApplicationModel.swift
//  LoanApp
//
//  Created by TBAM on 02/02/2024.
//

import Foundation

class LoanApplicationModel{
    func setUpData() -> [appData] {
        [
            appData(imgName: "loan1", title: "Entrepreneur Loan"),
            appData(imgName: "loan2", title: "Car Loan"),
            appData(imgName: "loan3", title: "Housing Loan"),
            appData(imgName: "loan4", title: "Student Loan"),
            appData(imgName: "loan3", title: "Payday Loan"),
        ]
    }
}

struct appData{
    let imgName: String?
    let title: String?
}

