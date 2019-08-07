//
//  StudentProfileTableViewController.swift
//  Outcom
//
//  Created by Eduardo Landa  on 2019-07-15.
//  Copyright © 2019 Eduardo Landa . All rights reserved.
//

import UIKit
import MapKit



@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}



class StudentProfileTableViewController: UITableViewController {

    var teacherClass: [UpcomingClass] = [UpcomingClass]()
    
    
    

    @IBOutlet var classTableView: UITableView!
    @IBOutlet weak var mapLabel: UITextView!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var messageBox: UITextView!
    @IBOutlet weak var activityButton: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var locationLabel: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var studentIMAGE: UIImageView!
    
    @IBOutlet weak var mapBackground: UIImageView!
    @IBOutlet weak var backgroundIMAGE: UIImageView!
    
    @IBOutlet weak var backgroundactivitie: UIImageView!
    
    @IBOutlet weak var backgroundMessage: UIImageView!
    
    
    override func viewDidLoad() {
          super.viewDidLoad()

        
        backgroundIMAGE.layer.cornerRadius = 20.0
        backgroundIMAGE.clipsToBounds = true
        backgroundIMAGE.layer.shadowColor = UIColor.black.cgColor
        backgroundIMAGE.layer.shadowOffset = CGSize(width: 4, height: 4)
        backgroundIMAGE.layer.shadowOpacity = 1
        backgroundIMAGE.layer.shadowRadius = 3.0
        
        mapBackground.layer.cornerRadius = 20.0
        mapBackground.clipsToBounds = true
        mapBackground.layer.shadowColor = UIColor.black.cgColor
        mapBackground.layer.shadowOffset = CGSize(width: 4, height: 4)
        mapBackground.layer.shadowOpacity = 1
        mapBackground.layer.shadowRadius = 3.0
        
        backgroundactivitie.layer.cornerRadius = 20.0
        backgroundactivitie.clipsToBounds = true
        backgroundactivitie.layer.shadowColor = UIColor.black.cgColor
        backgroundactivitie.layer.shadowOffset = CGSize(width: 4, height: 4)
        backgroundactivitie.layer.shadowOpacity = 1
        backgroundactivitie.layer.shadowRadius = 3.0
        
        backgroundMessage.layer.cornerRadius = 20.0
        backgroundMessage.clipsToBounds = true
        backgroundMessage.layer.shadowColor = UIColor.black.cgColor
        backgroundMessage.layer.shadowOffset = CGSize(width: 4, height: 4)
        backgroundMessage.layer.shadowOpacity = 1
        backgroundMessage.layer.shadowRadius = 3.0
        
        
        
        studentIMAGE.layer.cornerRadius = 20.0
        studentIMAGE.clipsToBounds = true
        studentIMAGE.layer.shadowColor = UIColor.black.cgColor
        studentIMAGE.layer.shadowOffset = CGSize(width: 4, height: 4)
        studentIMAGE.layer.shadowOpacity = 1
        studentIMAGE.layer.shadowRadius = 3.0
        
        
        activityButton.layer.cornerRadius = 8
        
        let urlString = "https://1hxwhklro6.execute-api.us-east-1.amazonaws.com/prod/class?teacherId=13&upcoming=true"
//        let urlString = "https://piu7u78ce9.execute-api.us-east-1.amazonaws.com/prod/class?teacherId=13&upcoming=true"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            
            guard let data = data else { return }
            
            
            do {
                self.teacherClass = try JSONDecoder().decode([UpcomingClass].self, from: data)
                //                print(self.teachers) ITS WORKING
                self.costLabel.text = "\(self.teacherClass[0].price)"
               self.activityButton.text = self.teacherClass[0].classType
                self.cityLabel.text = self.teacherClass[0].studentCity
                self.locationLabel.text = self.teacherClass[0].location
                self.mapLabel.text = self.teacherClass[0].location
                self.messageBox.text = self.teacherClass[0].message
                self.studentNameLabel.text = self.teacherClass[0].studentName
                self.dateLabel.text = self.teacherClass[0].date
                self.timeLabel.text = self.teacherClass[0].startTime
                
                
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

}
