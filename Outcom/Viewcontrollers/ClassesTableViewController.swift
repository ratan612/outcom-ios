//
//  ClassesTableViewController.swift
//  Outcom
//
//  Created by Eduardo Landa  on 2019-07-15.
//  Copyright © 2019 Eduardo Landa . All rights reserved.
//

import UIKit

class HeadlineTableViewCell: UITableViewCell {
    @IBOutlet weak var studentLabel: UILabel!
    @IBOutlet weak var TypeLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var TimeLabel: UILabel!
}

class ClassesTableViewController: UITableViewController {

    var teacherClass: [UpcomingClass] = [UpcomingClass]()
    
    

    @IBOutlet var classTableView: UITableView!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()

          let urlString = "https://1hxwhklro6.execute-api.us-east-1.amazonaws.com/prod/class?teacherId=13&upcoming=true"
//        let urlString = "https://piu7u78ce9.execute-api.us-east-1.amazonaws.com/prod/class?teacherId=13&upcoming=true"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            
            guard let data = data else { return }
            
            
            do {
                self.teacherClass = try JSONDecoder().decode([UpcomingClass].self, from: data)
                //                print(self.teachers) ITS WORKING
                self.updateView()
                
                
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
            
            
            
            }.resume()
    }
        func updateView() {
            DispatchQueue.main.async {
                [weak self] in guard let strongSelf = self else { return }
                strongSelf.classTableView.reloadData()
            }
        
    }

    // MARK: - Table view data source

 

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return teacherClass.count

    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        as! HeadlineTableViewCell
        
        
        cell.layer.cornerRadius = 14
        cell.layer.masksToBounds = true
        cell.layer.masksToBounds = false
        cell.layer.shadowOffset = CGSize(width:0, height: 0)
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.23
        cell.layer.shadowRadius = 4

        cell.studentLabel?.text = teacherClass[indexPath.row].studentName
        cell.DateLabel?.text = "\(String(describing: teacherClass[indexPath.row].date))"
        cell.TypeLabel?.text = teacherClass[indexPath.row].classType
        cell.TimeLabel?.text = teacherClass[indexPath.row].startTime
        

        // Configure the cell...

        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
