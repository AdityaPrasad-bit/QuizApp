//
//  fourthPage.swift
//  QuizApp
//
//  Created by Aditya on 12/08/21.
//

import UIKit

import CoreData
class fourthPage: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var nameArray=[NSManagedObject]()
    @IBOutlet weak var tblView: UITableView!
    
    var i=0
//    var totalQues=[Int]()
//    var Score=[Int]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context:NSManagedObjectContext
    var entity:NSEntityDescription
    var newUser:NSManagedObject
    var request: NSFetchRequest<NSFetchRequestResult>
    
    required init?(coder aDecoder: NSCoder) {
        self.context = appDelegate.persistentContainer.viewContext
        self.entity = NSEntityDescription.entity(forEntityName: "FinalData", in: context)!
        self.newUser = NSManagedObject(entity: entity, insertInto: context)
        self.request=NSFetchRequest<NSFetchRequestResult>(entityName: "FinalData")
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
//        UserDefaults.standard.removeObject(forKey: "noOfQ")
//         context = appDelegate.persistentContainer.viewContext
//        entity = NSEntityDescription.entity(forEntityName: "FinalData", in: context)!
//        let newUser = NSManagedObject(entity: entity, insertInto: context)
//        context = appDelegate.persistentContainer.viewContext
//        entity = NSEntityDescription.entity(forEntityName: "FinalData", in: context)!
        newUser.setValue(UserDefaults.standard.string(forKey: "Name"), forKey: "name")
        newUser.setValue(UserDefaults.standard.string(forKey: "score"), forKey: "score")
        newUser.setValue(String(UserDefaults.standard.integer(forKey: "noOfQ")), forKey: "totalQuestion")

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FinalData")
                //request.predicate = NSPredicate(format: "age = %@", "12")
                request.returnsObjectsAsFaults = false
                do {
                    let result = try context.fetch(request)
                    nameArray=result as! [NSManagedObject]
//                    for data in result as! [NSManagedObject] {
//                        print(data.value(forKey: "name") as! String)
//                        print(data.value(forKey: "score") as! String)
//                    }
                 
//                    print(nameArray,"n")
//                    try context.save()
                } catch {

                    print("Failed")
                }
    }

     //MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return nameArray.count
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        print(nameArray[indexPath.row].value(forKey: "name"),"1")
        cell.nameOfUser.text=nameArray[indexPath.row].value(forKey: "name") as! String
        cell.totalQue.text=nameArray[indexPath.row].value(forKey: "score") as! String
        cell.totalScore.text=nameArray[indexPath.row].value(forKey: "totalQuestion") as! String
        return cell
    }

    @IBAction func backBtn(_ sender: Any) {
        print("hello")
        performSegue(withIdentifier: "unwindSegueToVC1", sender: self)

    }
    
   
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
