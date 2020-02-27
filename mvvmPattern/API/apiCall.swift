//
//  viewModelclass.swift
//  mvvmPattern
//
//  Created by BlazeDream on 26/02/20.
//  Copyright © 2020 BlazeDream. All rights reserved.
//

import Foundation


class APIHandler {

//    @IBOutlet weak var tblVView: UITableView!
    
//    var getDtl = [contentDtl]()
//    var tableVVView = ViewController()
    
     typealias completionBlock = ([contentDtl]) -> ()
   func getDataFromApi(withUrl strUrl : String, completionBlock : @escaping completionBlock){
    
    let session = URLSession.shared
    let request = NSMutableURLRequest(url: NSURL(string: strUrl)! as URL)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    var params :[String: Any]?
    params = ["mode" : "2", "package" : "0", "device_id" : "ae8a288e22fa24f1", "oauth_token" : "bb6b3d55ea3be0bcde57022590ddde0c",
              "os_version" : "13",
              "mobile_or_tab" : "1",
              "device_type" : "2",
              "language_id" : "1",
              "screen_resolution" : "1080*2028",
              "app_id" : "0001"]
    do{
        request.httpBody = try JSONSerialization.data(withJSONObject: params!, options: JSONSerialization.WritingOptions())
        let task = session.dataTask(with: request as URLRequest as URLRequest, completionHandler: {(data, response, error) in
            if let response = response {
                let nsHTTPResponse = response as! HTTPURLResponse
                let statusCode = nsHTTPResponse.statusCode
                print ("status code = \(statusCode)")
            }
            if let error = error {
                print ("\(error)")
            }
            if let data = data {
                do{
                    if data != nil{
                    let jsonResponse = try JSONDecoder().decode(rootDtl.self, from: data)
                   let getDtl = jsonResponse.content
                    
                    print("View Model === \(getDtl[0].chapter_name)")
                    //                        print ("data = \(jsonResponse)")
                    
                    if getDtl  != nil{
                        completionBlock(getDtl)
                        
                    }else{
                        let aArray = [contentDtl]()
                        completionBlock(aArray)
                    }
                    }else{
                        let aArray = [contentDtl]()
                        completionBlock(aArray)
                    }
                
                    
                }catch _ {
                    print ("OOps not good JSON formatted response")
                }
                
//                DispatchQueue.main.async {
//                    self.tableVVView.tblView.reloadData()
//                }
            }
        })
        task.resume()
    }catch _ {
        print ("Oops something happened buddy")
    }
    }
    
    
}


