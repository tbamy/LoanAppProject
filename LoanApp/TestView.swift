//
//  TestView.swift
//  LoanApp
//
//  Created by TBAM on 26/01/2024.
//

import UIKit

class IconTextField: UIView {
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    // MARK: - Initialization

    init(icon: UIImage?, placeholder: String) {
        super.init(frame: .zero)
        configure(icon: icon, placeholder: placeholder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func configure(icon: UIImage?, placeholder: String) {
        // Add icon image view
        addSubview(iconImageView)
        iconImageView.image = icon

        // Add text field
        addSubview(textField)
        textField.placeholder = placeholder

        // Set up constraints
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            iconImageView.heightAnchor.constraint(equalToConstant: 30),

            textField.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    // MARK: - Public Methods

    func getText() -> String? {
        return textField.text
    }
}

// Example of usage:

//let emailField = IconTextField(icon: UIImage(named: "email_icon"), placeholder: "Email")
//let nameField = IconTextField(icon: UIImage(named: "name_icon"), placeholder: "Name")
//let passwordField = IconTextField(icon: UIImage(named: "password_icon"), placeholder: "Password")
