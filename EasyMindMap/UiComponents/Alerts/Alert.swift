//
//  Alert.swift
//  EasyMindMap
//
//  Created by Артем Климкин on 06/02/2020.
//  Copyright © 2020 Artem Klimkin. All rights reserved.
//

import UIKit

class Alert: UIViewController {

    let containerView = ContainerView(frame: .zero)
    let titleLabel = TitleLabel(textAligment: .center, fontSize: 20)
    let errorLabel = BodyLabel(textAligment: .center)
    let okButton = Button(backgroundColor: .systemGreen, title: "Ок")
    let cancelButton = Button(backgroundColor: .systemRed, title: "Отмена")
    let textField = TextField(frame: .zero)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configureContainerView()
        configureTitleLabel()
        configureTextField()
        configureOkButton()
        configureCancelButton()
        
        textField.delegate = self
    }
    
    func configureContainerView(){
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    func configureTitleLabel(){
        containerView.addSubview(titleLabel)
        titleLabel.text = "Задача"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    func configureTextField(){
        containerView.addSubview(textField)
        textField.placeholder = "Введите вашу задачу"
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            textField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            textField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configureOkButton(){
        containerView.addSubview(okButton)
        
        okButton.addTarget(self, action: #selector(setTitle), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            okButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 8),
            okButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            okButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            okButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    func configureCancelButton(){
        containerView.addSubview(cancelButton)
        
        
        cancelButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: okButton.bottomAnchor, constant: 8),
            cancelButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            cancelButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            cancelButton.heightAnchor.constraint(equalToConstant: 40),
            
            containerView.bottomAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 8)
        ])
    }
    
    func configureErrorMessage(){
        view.addSubview(errorLabel)
        
        errorLabel.text = "Поле не может быть пустым."
        errorLabel.textColor = .systemRed
        
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 8),
            errorLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            errorLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
    }
    
    @objc func setTitle(){
        if textField.text!.isEmpty{
            configureErrorMessage()
            return
        }
        
        mainContainerButton.setTitle(textField.text, for: .normal)
    }
    
    
    @objc func dismissVC(){
        dismiss(animated: true)
    }
}

extension Alert: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}


extension UIViewController{
    
    func presentAlert(){
        let alert = Alert()
        alert.modalPresentationStyle = .overFullScreen
        alert.modalTransitionStyle = .crossDissolve
        self.present(alert, animated: true)
    }
}
