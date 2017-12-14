//
//  TrajetViewModel.swift
//  com.exam02
//
//  Created by Patrick Moniqui on 17-12-14.
//  Copyright © 2017 Patrick Moniqui. All rights reserved.
//

import Foundation
import SwiftyJSON

class TrajetViewModel
{
    var Id: Int
    var NumTrain: String
    var VilleDepartId: Int
    var VilleArriveeId: Int
    var HeureDepart: Date
    var HereArrivee: Date
    var HeureDepartString: String
    var HeureArriveeString: String
    
    
    init()
    {
        self.Id = -1
        self.NumTrain = ""
        self.VilleDepartId = -1
        self.VilleArriveeId = -1
        self.HeureDepart = Date()
        self.HereArrivee = Date()
        self.HeureDepartString = ""
        self.HeureArriveeString = ""
        
    }
    
    init?(json: JSON) {
        
        self.Id = json["idTrajet"].intValue
        self.NumTrain = json["numTrain"].stringValue
        self.VilleDepartId = json["idVilleDepart"].intValue
        self.VilleArriveeId = json["idVilleArrivee"].intValue
        self.HeureDepart = DateHelpers.stringToDate(dateString: json["heureDepart"].stringValue)!
        self.HereArrivee = DateHelpers.stringToDate(dateString: json["heureArrivee"].stringValue)!
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        //for ui
        self.HeureDepartString = formatter.string(from: self.HeureDepart)
        self.HeureArriveeString = formatter.string(from: self.HereArrivee)
    }
}
