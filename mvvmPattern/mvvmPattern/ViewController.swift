//
//  ViewController.swift
//  mvvmPattern
//
//  Created by BlazeDream on 26/02/20.
//  Copyright © 2020 BlazeDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

 var viewModel = UserViewModel()
    
//    var getjsonData = [contentDtl]()
    
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Ok")
//        print(self.apiHandler.getDtl[1].chapter_name)
        
        viewModel.getDataFromAPIHandlerClass(url: EndPoint.strUrl) { (_) in
            
            DispatchQueue.main.async { [weak self] in
                self?.tblView.reloadData()
            }
        }
    }
        
   
}
    


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.getNumberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! newTableViewCell
        
        let valueGet = "apiHandler.getDtl[indexPath.row].chapter_name"
        
        print(valueGet)
        
        cell.textLabel?.text = viewModel.getCellData(index: indexPath.row).0
        cell.detailTextLabel?.text = "\(viewModel.getCellData(index: indexPath.row).2)"
        
        
        return cell
    }
    
}

