//
//  OnboardingModel.swift
//  LoanApp
//
//  Created by TBAM on 25/01/2024.
//

import Foundation

class OnboardingModel{
    func setUpData() -> [DataModel]{
        [
        DataModel(title: "Fixed Deposit", logo: "ALAT LOANS", imageView: "onboarding1", getStartedButton: ""),
        DataModel(title: "Mortgage Calculator", logo: "ALAT LOANS", imageView: "onboarding2", getStartedButton: ""),
        DataModel(title: "", logo: "ALAT LOANS", imageView: "onboarding3", getStartedButton: "Get Started")
        ]
    }
}

struct DataModel{
    let title: String?
    let logo: String?
    let imageView: String?
    let getStartedButton: String?
}
