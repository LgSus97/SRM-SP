//
//  LoginViewController.swift
//  SRM SP
//
//  Created by Brigadier on 28/08/24.
//

import UIKit

class LoginViewController: UIViewController {
  
  @IBOutlet weak var userNameTextField: UITextField!
  @IBOutlet weak var passTextField: UITextField!
  @IBOutlet weak var loginButton: UIButton!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func showAlert(titleAlert: String, messageAlert: String) {
    let alertController = UIAlertController(title:titleAlert,
                                            message: messageAlert,
                                            preferredStyle: .alert)
    
    let okAction = UIAlertAction(title: "Ok", style: .default) { _ in}
    alertController.addAction(okAction)
    present(alertController, animated: true, completion: nil)
  }
  
  
  @IBAction func loginAction(_ sender: Any) {
    let userText = userNameTextField.text ?? ""
    let passText = passTextField.text ?? ""
    
    if userText == "Alan Zavala" && passText == "1234"{
        // Si la validación pasa, dispara la segue manualmente
        performSegue(withIdentifier: "loginHumberto",
                     sender: self)
    } else {
      showAlert(titleAlert: "Atención",
                messageAlert: "Fail login")
    }

  }
  
}


