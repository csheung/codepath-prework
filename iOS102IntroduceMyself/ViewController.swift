//
//  ViewController.swift
//  iOS102 IntroduceMyself
//
//  Created by Derrick Ng on 2/4/23.
//

import UIKit

// add library extension of UIColorg
extension UIColor {
    static func random() -> UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var morePetsSwitch: UISwitch!
    @IBOutlet weak var morePetsStepper: UIStepper!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!

    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    @IBOutlet weak var countOfPets: UILabel!
    @IBOutlet weak var funFactsOfMyPetsTextField: UITextField!
    
    @IBAction func stepperDidChange(_ sender: UIStepper) {
        countOfPets.text = "\(Int(sender.value))"
    }
    
    @IBAction func IntroduceSelfTapped(_ sender: UIButton) {
        /// Let's us chose the title we have selected from the segmented control
        let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex)
        
        // Creating a variable of type string, that holds an introduction. The introduction interpolates the values from the text fields provided.
        // Currently we can only present the information in a print statement. However, this lets us verify that our app is printing out what is intended!
        let introduction = "My name is \(firstNameTextField.text!) \(lastNameTextField.text!) and I attend \(schoolNameTextField.text!). \nI am currently in my \(year!) year and I own \(countOfPets.text!) pets. \nIt is \(morePetsSwitch.isOn) that I want more pets. \nFun facts of My Pet(s): \(funFactsOfMyPetsTextField.text!). \nCome to me if you would like to know more!"
        
        
        // Creates the alert where we pass in our message, which our introduction.
        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
        
        // A way to dismiss the box once it pops up
        let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
        
        // Passing this action to the alert controller so it can be dismissed
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func ChangeBackgroundColorTapped(_ sender: UIButton) {
        self.view.backgroundColor = UIColor.random()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

