//
//  firstPage.swift
//  QuizApp
//
//  Created by Aditya on 11/08/21.
//

import UIKit

class firstPage: UIViewController {
//    let step: Float = 5
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var noOfQ: UILabel!
    
    
    @IBOutlet weak var vallName: UILabel!
    
    @IBOutlet weak var slider: UISlider!

    
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }

    override func viewDidLoad() {
        super.viewDidLoad()
        nameText.delegate=self

        vallName.textColor = .red
        slider.minimumValue=5
        UserDefaults.standard.set(Int(slider.value), forKey: "noOfQ")
        print("after loading",slider.minimumValue)
    }
    
    @IBAction func numQ(_ sender: UISlider) {
        let roundedValue = round(sender.value)
          sender.value = roundedValue
        noOfQ.text=String(Int(sender.value))
        UserDefaults.standard.set(Int(slider.value), forKey: "noOfQ")
//        print(UserDefaults.standard.integer(forKey: "noOfQ"))
     
    }
    @IBAction func submit(_ sender: UIButton) {
        let emailRegEx = "[a-zA-Z\\_]{1,18}$"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        
        
        
        if nameText.text?.count == 0 {

            vallName.text="Please fill the name"
        }
        else if !emailPred.evaluate(with: nameText.text){
            vallName.text="Please fill it correctly"
        }
        else {
        performSegue(withIdentifier: "secondPage", sender: nil)
        print("in button",nameText.text!)
        UserDefaults.standard.setValue(nameText.text!,forKey: "Name")
        }
 
    }
}

extension firstPage:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
//        let emailRegEx = "[a-zA-Z\\_]{1,18}$"
//        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//        print(emailPred.evaluate(with:textField.text!))
        let emailRegEx = "[a-zA-Z\\_]{1,18}$"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
           
        if emailPred.evaluate(with:textField.text!) {
            vallName.textColor = .systemGreen
            vallName.text="Correct"
        }
        else{
            vallName.textColor = .red
            vallName.text="Incorrect"
        }
      
        return true;
       }
    
    
    
      func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          nameText.resignFirstResponder();
        print("text Field Should Return",textField.text!)
      
        UserDefaults.standard.setValue(textField.text!,forKey: "Name")
        print( UserDefaults.standard.string(forKey: "Name")!)
          return true;
      }
  

}
