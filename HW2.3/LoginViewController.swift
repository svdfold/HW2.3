//
//  ViewController.swift
//  HW2.3
//
//  Created by Mike Albright on 14.07.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotButtonsView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    
    private let user = "User"
    private let password = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forgotButtonsView.layer.cornerRadius = 10
        view.setGradient(upperColor: .systemOrange,
                         bottomColor: .systemYellow)
        usernameTextField.returnKeyType = .next
        passwordTextField.returnKeyType = .done
        passwordTextField.enablesReturnKeyAutomatically = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.user = user
    }

    @IBAction func didTapLoginButton() {
        if usernameTextField.text == user && passwordTextField.text == password {
            performSegue(withIdentifier: "successfulLogin", sender: nil)
        } else {
            presentAlert(title: "Warning! 😔", message: "Invalid login data")
        }
    }
    
    @IBAction func didTapForgotUsernameButton(_ sender: UIButton) {
        presentAlert(title: "Oops!", message: "Username is: \(user)")
    }
    
    @IBAction func didTapForgotPasswordButton(_ sender: UIButton) {
        presentAlert(title: "Oops!", message: "Password is: \(password)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: title,
                                   style: .default,
                                   handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == usernameTextField { // Switch focus to other text field
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            didTapLoginButton()
        }
        return true
    }
}

