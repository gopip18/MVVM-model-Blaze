//
//  rootmodel.swift
//  mvvmPattern
//
//  Created by BlazeDream on 26/02/20.
//  Copyright © 2020 BlazeDream. All rights reserved.
//

import Foundation
class UserViewModel{
    typealias completionBlock = ([contentDtl]) -> ()
    var apiHandler = APIHandler()
    var datasourceArray = [contentDtl]()
    
    
    func getDataFromAPIHandlerClass(url: String, completionBlock : @escaping completionBlock){
        
        apiHandler.getDataFromApi(withUrl: url) { [weak self] (arrUser) in
            self?.datasourceArray = arrUser
            completionBlock(arrUser)
        }
}
    func getNumberOfRowsInSection() -> Int{
        
        return datasourceArray.count
    }
    
    func getUserAtIndex(index : Int) -> contentDtl{
        
        let user = datasourceArray[index]
        return user
    }
    
    func getCellData(index : Int) -> (String, String, Int){
        
        let user = self.getUserAtIndex(index: index)
        
        
        
        let name = user.chapter_name
        let image = user.chapter_image
        let chapOrder = user.chapter_order
//        let id = user.id ?? 0
//        let body = user.body ?? ""
//        let title = user.title ?? ""
//        let res = "\(userId)" + " " + "\(id)" + " " + (body) + " " + (title)
        return (name, image, chapOrder)
    }
}
