//
//  content.swift
//  mvvmPattern
//
//  Created by BlazeDream on 26/02/20.
//  Copyright © 2020 BlazeDream. All rights reserved.
//

import Foundation

struct rootDtl:Codable {
    var content:[contentDtl]
}

struct contentDtl:Codable {
    var chapter_order:Int
    var chapter_name:String
    var chapter_image:String
    
}
