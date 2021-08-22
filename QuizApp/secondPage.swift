//
//  secondPage.swift
//  QuizApp
//
//  Created by Aditya on 11/08/21.
//

import UIKit

class secondPage: UIViewController {
    var ques = [String]()
    var count=0     //question counter
    var counter=0 //timer counter
    var t:Timer?
    var scoreTracker=0,skipQ=0,attQ=0,qNum=1
    var endSize=0
    var ans = [Bool]()

    @IBOutlet weak var btnT: UIButton!
    
    @IBOutlet weak var btnF: UIButton!
    @IBOutlet weak var qNo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        ques=["2+2=5","2+2=4","3+4=7","4*3=12","3*3=4","5+5=11","8*8=64","9*9=81","7+9=15","5+9=5","2*2=4","9+1=10","3+4=7","4*3=12","3*3=9","2*0=2","2*7=14","0*9=0","7+9=16","9*0=0"]
        ans=[false,true,true,true,false,false,true,true,false,false,true,true,true,true,true,false,true,false,true,true]
        qNo.text=String(qNum)
        question.text=ques[0]
        if ans[count] == true{
            scoreTracker=scoreTracker+1
          
        }
        else {
            scoreTracker=scoreTracker+1
        }
        
        setupTimer()
        endSize=UserDefaults.standard.integer(forKey: "noOfQ")
        UserDefaults.standard.removeObject(forKey: "skipQuestion")
        UserDefaults.standard.removeObject(forKey: "attemptedQuestion")
        UserDefaults.standard.removeObject(forKey: "score")
        attQ+=1
        skipQ+=1
    }
 
    func setupTimer() {
        t?.invalidate()
        t = nil
        t = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
        count+=1
       
    }
    @objc func onTimerFires() {
        countTimer.text = String(counter)
        if counter == 10 {
//            t?.invalidate()
//            t = nil
            count+=1
       
            if count >= ques.startIndex && count < endSize{
                question.text=ques[count]
                progress.progress=Float(count)/Float(endSize)
                qNum+=1
                skipQ+=1
                UserDefaults.standard.set(skipQ, forKey: "skipQuestion")
                qNo.text=String(qNum)
                
            }
            else {
                t?.invalidate()
                t = nil
                skipQ+=1
                scoreTracker=0
                totalScore.text=String(scoreTracker)
                UserDefaults.standard.set(skipQ, forKey: "skipQuestion")
                UserDefaults.standard.set(totalScore.text, forKey: "score")
                performSegue(withIdentifier: "thirdPage", sender: nil)
            }
            counter=0
        }
        if counter == 0{
            btnT.isSelected=false
            btnF.isSelected=false
        }
        counter=counter+1
     
    }
    
    
    
    @IBOutlet weak var countTimer: UILabel!
    
    @IBOutlet weak var totalScore: UILabel!
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet var btnTorF: [UIButton]!
    @IBOutlet weak var progress: UIProgressView!
    @IBAction func btnAction(_ sender: UIButton) {
        _=btnTorF.map{$0.isSelected=false}
        sender.isSelected.toggle()
        if count-1 >= ques.startIndex && count < endSize{
            attQ+=1
            if sender.tag == 0 && ans[count] == true {
//                count+=1
                print(count,ans[count])
                question.text=ques[count]
                scoreTracker=scoreTracker+1
//                totalScore.text=String(scoreTracker)
//                UserDefaults.standard.set(totalScore.text, forKey: "score")
                setupTimer()
                counter=0
                progress.progress=Float(count)/Float(endSize)
                qNum+=1
//                UserDefaults.standard.set(attQ, forKey: "attemptedQuestion")
            }
            else if sender.tag == 1 && ans[count] == false{
//                count+=1
                print(count)
                print(count,ans[count])
                question.text=ques[count]
                scoreTracker=scoreTracker+1
//                totalScore.text=String(scoreTracker)
//                UserDefaults.standard.set(totalScore.text, forKey: "score")
                setupTimer()
                counter=0
                progress.progress=Float(count)/Float(endSize)
                qNum+=1
//                attQ+=1
              
            }
            else {
//                count+=1
                print(count)
                question.text=ques[count]
                setupTimer()
                counter=0
                progress.progress=Float(count)/Float(endSize)
                qNum+=1
            }
            UserDefaults.standard.set(String(scoreTracker), forKey: "score")
            UserDefaults.standard.set(attQ, forKey: "attemptedQuestion")
            qNo.text=String(qNum)
            totalScore.text=String(scoreTracker)

        }
        
        else {

            performSegue(withIdentifier: "thirdPage", sender: nil)
        }
        
        
        
    }
   
  
  
   

}
