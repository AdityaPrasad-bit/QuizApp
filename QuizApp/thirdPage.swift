//
//  thirdPage.swift
//  QuizApp
//
//  Created by Aditya on 12/08/21.
//

import UIKit

class thirdPage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        attemptedQuestion skipQuestion Name
        nameOfUser.text=UserDefaults.standard.string(forKey: "Name")
        totalAttemQ.text=String(UserDefaults.standard.integer(forKey: "attemptedQuestion"))
        SkipQ.text=String(UserDefaults.standard.integer(forKey: "skipQuestion"))
        totalScore.text=UserDefaults.standard.string(forKey: "score")
    }
    
    @IBAction func btnAction(_ sender: UIButton) {
        performSegue(withIdentifier: "fourthPage", sender: nil)

    }
    @IBOutlet weak var nameOfUser: UILabel!
    @IBOutlet weak var totalScore: UILabel!
   
    @IBOutlet weak var totalAttemQ: UILabel!
    @IBOutlet weak var SkipQ: UILabel!
    
    
    
    
}
