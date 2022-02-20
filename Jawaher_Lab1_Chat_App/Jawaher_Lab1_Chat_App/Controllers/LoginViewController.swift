//
//  LoginViewController.swift
//  Jawaher_Lab1_Chat_App
//
//  Created by Jawaher Mohammad on 24/06/1443 AH.
//

import UIKit

class LoginViewController: UIViewController {
 
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func saveData() {
        if let email = emailTextField.text,
           let password = passwordTextField.text,
           !email.isEmpty,
           !password.isEmpty{
            
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
    }
    


}
