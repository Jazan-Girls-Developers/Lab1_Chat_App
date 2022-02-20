//
//  RegisterViewController.swift
//  Jawaher_Lab1_Chat_App
//
//  Created by Jawaher Mohammad on 24/06/1443 AH.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var personalImage: UIImageView!{
        didSet{
            let tabGesture = UITapGestureRecognizer(target: self, action: #selector(didTabOnImage))
            personalImage.addGestureRecognizer(tabGesture)
            
            personalImage.layer.masksToBounds = true
            personalImage.layer.cornerRadius = personalImage.bounds.width / 2.0
            personalImage.layer.borderWidth = 2.0
            personalImage.layer.borderColor = UIColor.blue.cgColor
        }
    }
    
    
    let imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePickerController.delegate = self
        
    }
    

    func saveData(){
        if let email = emailTextField.text,
           let name = nameTextField.text,
           let password = passwordTextField.text,
           !email.isEmpty,
           !name.isEmpty,
           !password.isEmpty{
            Auth.auth().createUser(withEmail: email, password: password) { authDataResult, error in
                if let error = error{
                    print("error with create users",error)
                }
                if let authDataResult = authDataResult{
                    print("user thay",authDataResult.user)
                }
            }
        }else{
            //show alert
        }
    }
    
    @IBAction func registerButtonDidTab(_ sender: Any) {
        saveData()
    }
    
}
extension RegisterViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @objc func didTabOnImage(){
        showAlert()
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Profile Picture", message: "select picture", preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "Take Photo", style: .default) { _ in
            self.getImage(.camera)
        }
        let photo = UIAlertAction(title: "Chose Photo", style: .default) { _ in
            self.getImage(.photoLibrary)
        }
        let cancel = UIAlertAction(title: "Camera", style: .cancel, handler: nil)
        
        alert.addAction(camera)
        alert.addAction(photo)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    
    func getImage(_ sourceType: UIImagePickerController.SourceType){
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            imagePickerController.sourceType = sourceType
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {return}
        personalImage.image = chosenImage
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
