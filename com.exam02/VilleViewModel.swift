//
//  VilleViewModel.swift
//  com.exam02
//
//  Created by Patrick Moniqui on 17-12-14.
//  Copyright © 2017 Patrick Moniqui. All rights reserved.
//

import Foundation
import SwiftyJSON

class VilleViewModel
{
    var Id: Int
    var NomVille: String
    var ImagePath: String
    
    
    init()
    {
        self.Id = -1
        self.NomVille = ""
        self.ImagePath = ""
        
    }
    
    init?(json: JSON) {
        
        self.Id = json["idVille"].intValue
        self.NomVille = json["nomVille"].stringValue
        self.ImagePath = json["imageVille"].stringValue
    }
}
