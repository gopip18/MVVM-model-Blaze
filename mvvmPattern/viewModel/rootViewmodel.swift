//
//  rootViewmodel.swift
//  mvvmPattern
//
//  Created by BlazeDream on 26/02/20.
//  Copyright © 2020 BlazeDream. All rights reserved.
//

import Foundation
class UserViewModel{
    typealias completionBlock = ([rootDtl]) -> ()
    var apiHandler = APIHandler()
    var datasourceArray = [rootDtl]()
    
    
    func getDataFromAPIHandlerClass(url: String, completionBlock : @escaping completionBlock){
        
        apiHandler.getDataFromApi(withUrl: url) { [weak self] (arrUser) in
            self?.datasourceArray = arrUser
            completionBlock(arrUser)
        }
}
}
