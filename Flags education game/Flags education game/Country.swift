//
//  Country.swift
//  Flags education game
//
//  Created by Анна Овчинникова  on 11/4/19.
//  Copyright © 2019 Анна Овчинникова . All rights reserved.
//

import Foundation
//
//struct Country: Codable {
//    var image: String
//    var name: String
//    var capital:String
//    var id:Int?
//    init(image: String,name:String,capital:String) {
//        self.image = image
//        self.name = name
//        self.capital = capital
//    }
//}
final class Country: Codable {
    var id: Int?
    var name: String
    var flag: String
    var capital: String
    
    init(name: String, flag:String, capital:String) {
        self.name = name
        self.flag = flag
        self.capital = capital
    }
}
