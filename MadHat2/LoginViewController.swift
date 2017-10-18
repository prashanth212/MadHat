//
//  LoginViewController.swift
//  MadHat2
//
//  Created by Prashanth Kothapalli on 10/9/17.
//  Copyright © 2017 Prashanth Kothapalli. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var UserName: UITextField!
    
    @IBOutlet weak var UserPassword: UITextField!
    
    @IBOutlet weak var LoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserName.layer.borderWidth = 1
        UserName.layer.borderColor = UIColor.black.cgColor
        UserName.layer.cornerRadius = 20
        UserName.clipsToBounds = true
        
        UserPassword.layer.borderWidth = 1
        UserPassword.layer.borderColor = UIColor.black.cgColor
        UserPassword.layer.cornerRadius = 20
        UserPassword.clipsToBounds = true
        
        LoginButton.layer.cornerRadius = 20
        LoginButton.clipsToBounds = true
    
    }
    
//    @IBAction func UserLogin(_ sender: Any) {
//
//        let Name = UserName.text
//        let Password = UserPassword.text
//
//        let soapAPI = String(format:
//            "<?xml version='1.0' encoding='utf-8'?><s:Envelope xmlns:s='http://schemas.xmlsoap.org/soap/envelope/'><s:Body><DoLogin xmlns='http://madhattvguide.azurewebsites.net' xmlns:i='http://www.w3.org/2001/XMLSchema-instance'><UserName>%@</UserName><Password>%@</Password><OS>Win</OS><AppVersion>3.5.3.0</AppVersion><OrgID>98975336-99DC-4C81-A3C7-067E76AD0BD5</OrgID></DoLogin></s:Body></s:Envelope>", Name!, Password!
//        )
//
//        let urlString = "https://service.madhat.tv/TVGuideService.asmx"
//        let url = NSURL(string: urlString)
//
//        var theRequest = NSMutableURLRequest(url: url! as URL);
//
//        let msgLength = String(describing: soapAPI.characters.count)
//
//        theRequest.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
//        theRequest.addValue(String(msgLength), forHTTPHeaderField: "Content-Length")
//        theRequest.httpMethod = "POST"
//        theRequest.httpBody = soapAPI.data(using: String.Encoding.utf8, allowLossyConversion: false)
//
//        let session = URLSession.shared
//
//        let task =  session.dataTask(with: theRequest) { (data, resp, error) in
//
//            guard error == nil && data != nil else{
//
//                print("connection error or data is nill")
//
//                return
//            }
//
//            if resp != nil {
//
//                self.mutableData.length = 0;
//
//            }
//
//            let mutableData : Void = NSMutableData.initialize()
//            print(mutableData)
//
//            let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//            self.mutableData.append(data!)
//            print(dataString)
//
//            let xmlParser = XMLParser(data: mutableData as Data)
//            xmlParser.delegate = self
//            xmlParser.parse()
//            xmlParser.shouldResolveExternalEntities = true
//
//        }
//        task.resume()
//
//    }
}
