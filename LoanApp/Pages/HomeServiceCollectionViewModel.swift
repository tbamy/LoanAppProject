//
//  HomeServiceCollectionViewModel.swift
//  LoanApp
//
//  Created by TBAM on 31/01/2024.
//

import Foundation

class HomeServiceCollectionViewModel{
    func setUpData() -> [collectionData] {
        [
            collectionData(imgName: "deposit", title: "Deposit"),
            collectionData(imgName: "icon-outline", title: "Saving History"),
            collectionData(imgName: "icon-outline", title: "Loan History"),
            collectionData(imgName: "deposit", title: "Mortgage Calculator"),
            collectionData(imgName: "loan", title: "Loan Market"),
            collectionData(imgName: "location", title: "Find Us"),
            collectionData(imgName: "facebook", title: "Facebook Group"),
            collectionData(imgName: "telegram", title: "Telegram Group"),
        ]
    }
}

struct collectionData{
    let imgName: String?
    let title: String?
}
