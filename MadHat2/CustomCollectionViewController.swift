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

class CustomCollectionViewController: UICollectionViewController {
    
    @IBOutlet var myCollectionView: UICollectionView!
    
    var schedulers = [AnyObject]()
    
    override func viewDidAppear(_ animated: Bool) {
        //let scheduler: Scheduler
        
        let url = "https://data.tmsapi.com/v1.1/lineups/USA-NH28457-X/grid?stationId=10035%2C10021%2C16331%2C18332%2C14755%2C10057%2C10139%2C10142%2C10149%2C18544%2C11150%2C10179%2C12444%2C16374%2C12574%2C82541%2C14321%2C66268%2C10240%2C14771%2C10269%2C10918%2C62081%2C16300%2C32281%2C45399%2C24959%2C11006%2C11069%2C11115%2C11163%2C11097%2C11867%2C11164%2C12131%2C11207%2C11369%2C11325%2C11187%2C11456%2C11418%2C101663%2C11659&startDateTime=2017-10-20T20%3A00Z&api_key=t2fpebq8ptvgxaq5nh4x597n"
        
        Alamofire.request(url).responseJSON { response in
            
            guard let data = response.result.value else {return}
            self.schedulers = data as! [Scheduler]
        
            self.myCollectionView.reloadData()
          //print("GN-Data::`\(self.schedulers )")
            //print("JsonData:\(self.schedulers)")
            
        }
        
    }
    
  
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 40
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCollectionViewCell
       //let labelText = "Sec " + indexPath.section.description + "/Item " + indexPath.item.description
//
//        cell.label?.text = (labelText as! String)
        
       
       
        
        if(schedulers.count > 0){
            if indexPath.row == 0 {
                cell.label?.text = schedulers[indexPath.section]["callSign"] as? String
            }
            else{
            
//            print("airings:::\(airingsArray)")
                for index in 1...39{
                    if indexPath.row == index {
                        let airingsArray = schedulers[indexPath.section]["airings"]
                        for anItem in airingsArray as! [AnyObject] {
                            let item = anItem["program"] as? NSDictionary
                            cell.label?.text = (String(describing: item!["shortDescription"] as? String))
                        }
                        //cell.label?.text = JSON(schedulers[indexPath.item]["airings"])[0].shortDescription as? String
                    }
                }
            }
            
            
            
           // print("airings:::\(schedulers[indexPath.row]["airings"])")
             //print("indexPath:::\(indexPath)")
           // print("section)::\(indexPath.section)")
            //print("section-description)::\(indexPath.section.description)")
            //cell.label?.text = labelText
            //cell.label?.text = schedulers[indexPath.section]["callSign"] as? String
            
            //schedulers[indexPath.row]["callSign"] as? String
           
        }
        
        
        
        
        // Configure the cell
        
        return cell
    }

}


