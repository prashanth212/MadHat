//
//  CustomCollectionViewController.swift
//  MadHat2
//
//  Created by Prashanth Kothapalli on 10/18/17.
//  Copyright © 2017 Prashanth Kothapalli. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

private let reuseIdentifier = "customCell"

class Airings{
    let startTime: String = ""
    let endTime: String = ""
    let duration: Int = 0
    let shortDescription: String = ""
    let title: String = ""
    
}

class Scheduler{
    let callSign: String = ""
    let logoUrl: String = ""
    let airings: [Airings] = []
    

}

extension Formatter {
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:ssZ"
        return formatter
    }()
}
extension Date {
    var iso8601: String {
        return Formatter.iso8601.string(from: self)
    }
}

extension String {
    var dateFromISO8601: Date? {
        return Formatter.iso8601.date(from: self)   // "Mar 22, 2017, 10:22 AM"
    }
}

class CustomCollectionViewController: UICollectionViewController {
    
    @IBOutlet var myCollectionView: UICollectionView!
    
    var schedulers = [AnyObject]()
    
    
    override func viewDidAppear(_ animated: Bool) {
        //let scheduler: Scheduler
        let currentDateTime = Date().iso8601;
         print("date:\(currentDateTime)")
        
        
        let url = "https://data.tmsapi.com/v1.1/lineups/USA-NH28457-X/grid?stationId=10035%2C10021%2C16331%2C18332%2C14755%2C10057%2C10139%2C10142%2C10149%2C18544%2C11150%2C10179%2C12444%2C16374%2C12574%2C82541%2C14321%2C66268%2C10240%2C14771%2C10269%2C10918%2C62081%2C16300%2C32281%2C45399%2C24959%2C11006%2C11069%2C11115%2C11163%2C11097%2C11867%2C11164%2C12131%2C11207%2C11369%2C11325%2C11187%2C11456%2C11418%2C101663%2C11659&startDateTime=\(currentDateTime)&api_key=t2fpebq8ptvgxaq5nh4x597n"
        
        print("URL:\(url)")
        
        Alamofire.request(url).responseJSON { response in
            
            guard let data = response.result.value else {return}
            self.schedulers = data as! [Scheduler]
        
            self.myCollectionView.reloadData()
            //print("JsonData:\(self.schedulers)")
            
        }
        
    }
    
  
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return self.schedulers.count + 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        if section > 0, let airings = schedulers[section-1]["airings"] as? [[String: AnyObject]]  {
            return airings.count
        }
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCollectionViewCell

        if indexPath.section % 2 != 0 {
            cell.backgroundColor = UIColor(white: 242/255.0, alpha: 1.0)
        } else {
            cell.backgroundColor = UIColor.white
        }
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                cell.label.text = "Channel/Time"
            } else {
                cell.label.text = "Time"
            }
        }
        
        if(schedulers.count > 0){
            if indexPath.row == 0 {
                if indexPath.section != 0 {
                    cell.label?.text = schedulers[indexPath.section - 1]["callSign"] as? String
                }
            } else if indexPath.section != 0 {
                if let scheduler = schedulers[indexPath.section-1] as? [String: AnyObject], let airingsArray = scheduler["airings"] as? [[String: AnyObject]] {
                    if airingsArray.count > indexPath.row {
                        let anItem = airingsArray[indexPath.row-1]
                        debugPrint("item:::\(anItem)")
                        let item = anItem["program"] as? NSDictionary
                        cell.label?.text = (String(describing: item!["title"] as! String))
                    } else {
                        cell.label?.text = ""
                    }
                } else {
                    cell.label?.text = ""
                }
            }
        }
    
        return cell
    }

}


