//
//  RegisterViewController.swift
//  Tripod
//
//  Created by Yevhenii Veretennikov on 10/22/16.
//  Copyright © 2016 Yevhenii Veretennikov. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        let showLoginView = UISwipeGestureRecognizer(target: self, action: #selector(showLoginViewSwipe))
        showLoginView.direction = .right
        view.addGestureRecognizer(showLoginView)
        
        setupRegisterView()
    }
    
    let swither =  UISwitch()
    let userName = UITextField()
    let userEmail = UITextField()
    let userPassword = UITextField()
    let userRepPassword = UITextField()
    
    func setupRegisterView() {
        let logoImageView: UIImageView = { //<----------------- LOGO IMAGE HERE
            let iv = UIImageView()
            iv.image = UIImage(named: "logo")
            iv.contentMode = .scaleAspectFill
            iv.clipsToBounds = true
            iv.backgroundColor = UIColor.black
            iv.translatesAutoresizingMaskIntoConstraints = false
            return iv
        }()
        
        let registerLabelView: UILabel = {
            let lbl = UILabel()
            lbl.text = "РЕГИСТРАЦИЯ"
            lbl.font = UIFont(name: "Halvetica-Light", size: 17)
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.textColor = UIColor(r: 19, g: 159, b: 221)
            lbl.textAlignment = .center
            return lbl
        }()
        
        let createNewProfileLabelView: UILabel = {
            let lbl = UILabel()
            lbl.text = "СОЗДАЙТЕ СВОЙ ПРОФИЛЬ"
            lbl.font = UIFont(name: "Halvetica-Light", size: 17)
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.textColor = UIColor(r: 78, g: 103, b: 125)
            lbl.textAlignment = .center
            return lbl
        }()
        
        // ---
        
        userName.placeholder = "ИМЯ ПОЛЬЗОВАТЕЛЯ"
        userName.leftView = UIView(frame: CGRect.init(x: 0, y: 0, width: 12, height: userName.frame.height))
        userName.leftViewMode = UITextFieldViewMode.always
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.backgroundColor = UIColor(r: 238, g: 242, b: 245)
        userName.layer.cornerRadius = 6
        userName.layer.masksToBounds = true
        userName.clearButtonMode = .always
        userName.autocapitalizationType = .words
        userName.spellCheckingType = .no
        userName.autocorrectionType = .no
        let userNameFieldView = userName
        
        userEmail.placeholder = "ВВЕДИТЕ СВОЙ E-MAIL"
        userEmail.leftView = UIView(frame: CGRect.init(x: 0, y: 0, width: 12, height: userEmail.frame.height))
        userEmail.leftViewMode = UITextFieldViewMode.always
        userEmail.translatesAutoresizingMaskIntoConstraints = false
        userEmail.backgroundColor = UIColor(r: 238, g: 242, b: 245)
        userEmail.layer.cornerRadius = 6
        userEmail.layer.masksToBounds = true
        userEmail.clearButtonMode = .always
        userEmail.keyboardType = .emailAddress
        userEmail.autocapitalizationType = .none
        userEmail.spellCheckingType = .no
        userEmail.autocorrectionType = .no
        let userEmailFieldView = userEmail
        
        userPassword.placeholder = "ПАРОЛЬ"
        userPassword.leftView = UIView(frame: CGRect.init(x: 0, y: 0, width: 12, height: userPassword.frame.height))
        userPassword.leftViewMode = UITextFieldViewMode.always
        userPassword.translatesAutoresizingMaskIntoConstraints = false
        userPassword.backgroundColor = UIColor(r: 238, g: 242, b: 245)
        userPassword.layer.cornerRadius = 6
        userPassword.layer.masksToBounds = true
        userPassword.clearButtonMode = .always
        userPassword.isSecureTextEntry = true
        let userPasswordFieldView = userPassword
        
        userRepPassword.placeholder = "ПОДТВЕРДИТЕ ПАРОЛЬ"
        userRepPassword.leftView = UIView(frame: CGRect.init(x: 0, y: 0, width: 12, height: userRepPassword.frame.height))
        userRepPassword.leftViewMode = UITextFieldViewMode.always
        userRepPassword.translatesAutoresizingMaskIntoConstraints = false
        userRepPassword.backgroundColor = UIColor(r: 238, g: 242, b: 245)
        userRepPassword.layer.cornerRadius = 6
        userRepPassword.layer.masksToBounds = true
        userRepPassword.clearButtonMode = .always
        userRepPassword.isSecureTextEntry = true
        let userConfirmPasswordsFieldView = userRepPassword
        
        let agreeContainerView: UIView = {
            let container = UIView()
            container.backgroundColor = UIColor.clear
            container.translatesAutoresizingMaskIntoConstraints = false
            return container
        }()
        
        swither.setOn(false, animated: true)
        swither.translatesAutoresizingMaskIntoConstraints = false
        let switchView = swither
        
        let agreeButtonView: UIButton = {
            let btn = UIButton()
            btn.translatesAutoresizingMaskIntoConstraints = false
            let btnAttributetStr = NSMutableAttributedString(string: "Я СОГЛАСЕН(НА) ", attributes: [NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 13)! ])
            btnAttributetStr.append(NSAttributedString(string: "С УСЛОВИЯМИ", attributes: [NSUnderlineStyleAttributeName: 1, NSFontAttributeName: UIFont(name: "Helvetica-Light", size: 13)! ]))
            btn.setAttributedTitle(btnAttributetStr, for: .normal)
            btn.titleLabel?.textColor = UIColor(r: 200, g: 200, b: 200)
            btn.addTarget(self, action: #selector(handleAgreement), for: .touchUpInside)
            return btn
        }()
        
        let registerButtonView: UIButton = {
            let btn = UIButton(type: .system)
            btn.backgroundColor = UIColor(r: 19, g: 159, b: 221)
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.setTitle("ЗАРЕГИСТРИРОВАТЬСЯ", for: .normal)
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.layer.cornerRadius = 6
            btn.layer.masksToBounds = true
            btn.addTarget(self, action: #selector(handleRegistration), for: .touchUpInside)
            return btn
        }()
        
        let authLabelView: UILabel = {
            let authLabel = UILabel()
            authLabel.text = "АВТОРИЗИРОВАТЬСЯ ЧЕРЕЗ"
            authLabel.font = UIFont.boldSystemFont(ofSize: 13)
            authLabel.translatesAutoresizingMaskIntoConstraints = false
            authLabel.textColor = UIColor(r: 19, g: 159, b: 221)
            authLabel.textAlignment = .center
            return authLabel
        }()
        
        let loginViaTwitterButtonView: UIButton = {
            let btn = UIButton(type: .system)
            //            btn.backgroundColor = UIColor.red
            btn.setImage(UIImage(named: "twitter"), for: .normal)
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.addTarget(self, action: #selector(handleTwitterLogin), for: .touchUpInside)
            return btn
        }()
        
        let loginViaFacebookButtonView: UIButton = {
            let btn = UIButton(type: .system)
            //            btn.backgroundColor = UIColor.white
            btn.setImage(UIImage(named: "facebook"), for: .normal)
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.addTarget(self, action: #selector(handleFacebookLogin), for: .touchUpInside)
            return btn
        }()
        
        let loginViaGoogleButtonView: UIButton = {
            let btn = UIButton(type: .system)
            //            btn.backgroundColor = UIColor.white
            btn.setImage(UIImage(named: "google"), for: .normal)
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.addTarget(self, action: #selector(handleGoogleLogin), for: .touchUpInside)
            return btn
        }()
        
        view.addSubview(logoImageView)
        
        logoImageView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 50).isActive = true
        logoImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 23).isActive = true
        logoImageView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -50).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        view.addSubview(registerLabelView)
        
        registerLabelView.leftAnchor.constraint(equalTo: logoImageView.leftAnchor).isActive = true
        registerLabelView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 0).isActive = true
        registerLabelView.rightAnchor.constraint(equalTo: logoImageView.rightAnchor).isActive = true
        registerLabelView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        view.addSubview(createNewProfileLabelView)
        
        createNewProfileLabelView.leftAnchor.constraint(equalTo: logoImageView.leftAnchor).isActive = true
        createNewProfileLabelView.topAnchor.constraint(equalTo: registerLabelView.bottomAnchor, constant: 0).isActive = true
        createNewProfileLabelView.rightAnchor.constraint(equalTo: logoImageView.rightAnchor).isActive = true
        createNewProfileLabelView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        view.addSubview(userNameFieldView)
        
        userNameFieldView.leftAnchor.constraint(equalTo: logoImageView.leftAnchor).isActive = true
        userNameFieldView.topAnchor.constraint(equalTo: createNewProfileLabelView.bottomAnchor, constant: 15).isActive = true
        userNameFieldView.rightAnchor.constraint(equalTo: logoImageView.rightAnchor).isActive = true
        userNameFieldView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        view.addSubview(userEmailFieldView)
        
        userEmailFieldView.leftAnchor.constraint(equalTo: logoImageView.leftAnchor).isActive = true
        userEmailFieldView.topAnchor.constraint(equalTo: userNameFieldView.bottomAnchor, constant: 12).isActive = true
        userEmailFieldView.rightAnchor.constraint(equalTo: logoImageView.rightAnchor).isActive = true
        userEmailFieldView.heightAnchor.constraint(equalTo: userNameFieldView.heightAnchor).isActive = true
        
        view.addSubview(userPasswordFieldView)
        
        userPasswordFieldView.leftAnchor.constraint(equalTo: logoImageView.leftAnchor).isActive = true
        userPasswordFieldView.topAnchor.constraint(equalTo: userEmailFieldView.bottomAnchor, constant: 12).isActive = true
        userPasswordFieldView.rightAnchor.constraint(equalTo: logoImageView.rightAnchor).isActive = true
        userPasswordFieldView.heightAnchor.constraint(equalTo: userNameFieldView.heightAnchor).isActive = true
        
        view.addSubview(userConfirmPasswordsFieldView)
        
        userConfirmPasswordsFieldView.leftAnchor.constraint(equalTo: logoImageView.leftAnchor).isActive = true
        userConfirmPasswordsFieldView.topAnchor.constraint(equalTo: userPasswordFieldView.bottomAnchor, constant: 12).isActive = true
        userConfirmPasswordsFieldView.rightAnchor.constraint(equalTo: logoImageView.rightAnchor).isActive = true
        userConfirmPasswordsFieldView.heightAnchor.constraint(equalTo: userNameFieldView.heightAnchor).isActive = true
        
        view.addSubview(agreeContainerView)
        
        agreeContainerView.leftAnchor.constraint(equalTo: logoImageView.leftAnchor).isActive = true
        agreeContainerView.topAnchor.constraint(equalTo: userConfirmPasswordsFieldView.bottomAnchor, constant: 12).isActive = true
        agreeContainerView.rightAnchor.constraint(equalTo: logoImageView.rightAnchor).isActive = true
        agreeContainerView.heightAnchor.constraint(equalTo: userNameFieldView.heightAnchor).isActive = true
        
        agreeContainerView.addSubview(switchView)
        
        switchView.leftAnchor.constraint(equalTo: agreeContainerView.leftAnchor).isActive = true
        switchView.centerYAnchor.constraint(equalTo: agreeContainerView.centerYAnchor).isActive = true
        switchView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        switchView.heightAnchor.constraint(equalTo: agreeContainerView.heightAnchor).isActive = true
        
        agreeContainerView.addSubview(agreeButtonView)
        
        agreeButtonView.leftAnchor.constraint(equalTo: switchView.rightAnchor).isActive = true
        agreeButtonView.centerYAnchor.constraint(equalTo: switchView.centerYAnchor).isActive = true
        agreeButtonView.rightAnchor.constraint(equalTo: agreeContainerView.rightAnchor).isActive = true
        agreeButtonView.heightAnchor.constraint(equalTo: agreeContainerView.heightAnchor).isActive = true
        
        view.addSubview(registerButtonView)
        
        registerButtonView.leftAnchor.constraint(equalTo: userNameFieldView.leftAnchor).isActive = true
        registerButtonView.topAnchor.constraint(equalTo: agreeContainerView.bottomAnchor, constant: 12).isActive = true
        registerButtonView.rightAnchor.constraint(equalTo: userNameFieldView.rightAnchor).isActive = true
        registerButtonView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(authLabelView)
        
        authLabelView.leftAnchor.constraint(equalTo: userNameFieldView.leftAnchor).isActive = true
        authLabelView.topAnchor.constraint(equalTo: registerButtonView.bottomAnchor, constant: 30).isActive = true
        authLabelView.rightAnchor.constraint(equalTo: userNameFieldView.rightAnchor).isActive = true
        authLabelView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        view.addSubview(loginViaTwitterButtonView)
        
        loginViaTwitterButtonView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loginViaTwitterButtonView.topAnchor.constraint(equalTo: authLabelView.bottomAnchor, constant: 8).isActive = true
        loginViaTwitterButtonView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        loginViaTwitterButtonView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(loginViaFacebookButtonView)
        
        loginViaFacebookButtonView.rightAnchor.constraint(equalTo: loginViaTwitterButtonView.leftAnchor, constant: -30).isActive = true
        loginViaFacebookButtonView.topAnchor.constraint(equalTo: loginViaTwitterButtonView.topAnchor).isActive = true
        loginViaFacebookButtonView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        loginViaFacebookButtonView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(loginViaGoogleButtonView)
        
        loginViaGoogleButtonView.leftAnchor.constraint(equalTo: loginViaTwitterButtonView.rightAnchor, constant: 30).isActive = true
        loginViaGoogleButtonView.topAnchor.constraint(equalTo: loginViaTwitterButtonView.topAnchor).isActive = true
        loginViaGoogleButtonView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        loginViaGoogleButtonView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    func showLoginViewSwipe() {
        dismiss(animated: true, completion: nil)
    }
    
    func handleTwitterLogin() {
        print("LOGIN VIA TWITTER")
    }
    
    func handleFacebookLogin() {
        print("LOGIN VIA FB")
    }
    
    func handleGoogleLogin() {
        print("LOGIN VIA GOOGLE")
    }
    
    func handleAgreement() {
        print("handle agreement")
    }
    
    func handleRegistration() {
        if swither.isOn {
            print("Agreed with rules")
            
            if let name = userName.text {
                print(name)
            }
            if let email = userEmail.text {
                print(email)
            }
            if userPassword.text == userRepPassword.text {
                print(userPassword.text!)
            }
            
        } else {
            print("dinied")
        }
    }
    
}
























