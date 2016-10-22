//
//  LoginViewController.swift
//  Tripod
//
//  Created by Yevhenii Veretennikov on 10/22/16.
//  Copyright © 2016 Yevhenii Veretennikov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        setupLoginView()
    }
    
    func setupLoginView() {
        
        let logoImageView: UIImageView = { //<----------------- LOGO IMAGE HERE
            let iv = UIImageView()
            iv.image = UIImage(named: "logo")
            iv.contentMode = .scaleAspectFill
            iv.clipsToBounds = true
            iv.backgroundColor = UIColor.black
            iv.translatesAutoresizingMaskIntoConstraints = false
            return iv
        }()
        
        let userNameFieldView: UITextField = {
            let userName = UITextField()
            userName.placeholder = "ИМЯ ПОЛЬЗОВАТЕЛЯ"
            userName.leftView = UIView(frame: CGRect.init(x: 0, y: 0, width: 12, height: userName.frame.height))
            userName.leftViewMode = UITextFieldViewMode.always
            userName.translatesAutoresizingMaskIntoConstraints = false
            userName.backgroundColor = UIColor(r: 238, g: 242, b: 245)
            userName.layer.cornerRadius = 6
            userName.layer.masksToBounds = true
            return userName
        }()
        
        let userPasswordFieldView: UITextField = {
            let userPassword = UITextField()
            userPassword.placeholder = "ПАРОЛЬ"
            userPassword.leftView = UIView(frame: CGRect.init(x: 0, y: 0, width: 12, height: userPassword.frame.height))
            userPassword.leftViewMode = UITextFieldViewMode.always
            userPassword.translatesAutoresizingMaskIntoConstraints = false
            userPassword.backgroundColor = UIColor(r: 238, g: 242, b: 245)
            userPassword.layer.cornerRadius = 6
            userPassword.layer.masksToBounds = true
            return userPassword
        }()
        
        let loginButtonView: UIButton = {
            let loginButton = UIButton(type: .system)
            loginButton.backgroundColor = UIColor(r: 135, g: 195, b: 232)
            loginButton.translatesAutoresizingMaskIntoConstraints = false
            loginButton.setTitle("ВОЙТИ", for: .normal)
            loginButton.setTitleColor(UIColor.white, for: .normal)
            loginButton.layer.cornerRadius = 6
            loginButton.layer.masksToBounds = true
            loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
            return loginButton
        }()
        
        let registerButtonView: UIButton = {
            let registerButton = UIButton(type: .system)
            registerButton.backgroundColor = UIColor(r: 19, g: 159, b: 221)
            registerButton.translatesAutoresizingMaskIntoConstraints = false
            registerButton.setTitle("ЗАРЕГИСТРИРОВАТЬСЯ", for: .normal)
            registerButton.setTitleColor(UIColor.white, for: .normal)
            registerButton.layer.cornerRadius = 6
            registerButton.layer.masksToBounds = true
            registerButton.addTarget(self, action: #selector(handleRegistration), for: .touchUpInside)
            return registerButton
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
        logoImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60).isActive = true
        logoImageView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -50).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        view.addSubview(userNameFieldView)
        
        userNameFieldView.leftAnchor.constraint(equalTo: logoImageView.leftAnchor).isActive = true
        userNameFieldView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 12).isActive = true
        userNameFieldView.rightAnchor.constraint(equalTo: logoImageView.rightAnchor).isActive = true
        userNameFieldView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        view.addSubview(userPasswordFieldView)
        
        userPasswordFieldView.leftAnchor.constraint(equalTo: userNameFieldView.leftAnchor).isActive = true
        userPasswordFieldView.topAnchor.constraint(equalTo: userNameFieldView.bottomAnchor, constant: 12).isActive = true
        userPasswordFieldView.rightAnchor.constraint(equalTo: userNameFieldView.rightAnchor).isActive = true
        userPasswordFieldView.heightAnchor.constraint(equalTo: userNameFieldView.heightAnchor).isActive = true
        
        view.addSubview(loginButtonView)
        
        loginButtonView.leftAnchor.constraint(equalTo: userNameFieldView.leftAnchor).isActive  = true
        loginButtonView.topAnchor.constraint(equalTo: userPasswordFieldView.bottomAnchor, constant: 16).isActive = true
        loginButtonView.rightAnchor.constraint(equalTo: userPasswordFieldView.rightAnchor).isActive = true
        loginButtonView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(registerButtonView)
        
        registerButtonView.leftAnchor.constraint(equalTo: userNameFieldView.leftAnchor).isActive = true
        registerButtonView.topAnchor.constraint(equalTo: loginButtonView.bottomAnchor, constant: 12).isActive = true
        registerButtonView.rightAnchor.constraint(equalTo: userNameFieldView.rightAnchor).isActive = true
        registerButtonView.heightAnchor.constraint(equalTo: loginButtonView.heightAnchor).isActive = true
        
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
    
    func handleLogin() {
        print("hANDLE LOGIN")
        // check login and password here
        
        // -----------------------------
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
    
    func handleRegistration() {
        print("HANDLE REGISTR")
        let regView = RegisterViewController()
        regView.modalTransitionStyle = .flipHorizontal
        present(regView, animated: true, completion: nil)
    }
    
}
















