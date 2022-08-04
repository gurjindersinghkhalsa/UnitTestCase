//
//  ViewController.swift
//  LoginTesting
//
//  Created by Gurjinder Singh on 18/06/21.
//

import UIKit

struct User {
    var email: String
    var password: String
}

class ViewController: UIViewController {

    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    
    private let validation: ValidationService?
  
    init(validation: ValidationService) {
        self.validation = validation
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        self.validation = ValidationService()
        super.init(coder: coder)
    }
    
    private let loginInfo = [User(email: "Gurjinder Singh", password: "123456789")]
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    //MARK:----- IBAction Methods -----
    
    @IBAction func tapCheckValidation() {
        do {
            let email = try validation?.validateEmail(userEmail: txtFieldEmail.text)
            let password = try validation?.validatePassword(txtFieldPassword.text)
            
            if let _ = loginInfo.first(where: { user in
                user.email == email && user.password == password
            }) {
                print("Logged in successfull")
            } else {
                throw LoginValidationError.invalidCred
            }
        } catch {
            print(error)
        }
    }

}

