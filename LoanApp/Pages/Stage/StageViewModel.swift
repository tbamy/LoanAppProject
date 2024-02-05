//
//  StageViewModel.swift
//  LoanApp
//
//  Created by TBAM on 01/02/2024.
//

import Foundation

class StageViewModel{
    func setUpData() -> [stageData]{
        [
            stageData(loanName: "Home Loan", progress: 2),
            stageData(loanName: "Student Loan", progress: 2),
            stageData(loanName: "Car Loan", progress: 1)
        ]
        
    }
}

struct stageData{
    let loanName: String?
    let progress: Int?
    
}
