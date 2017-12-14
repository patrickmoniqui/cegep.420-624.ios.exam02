//
//  TrainDao.swift
//  com.exam02
//
//  Created by Patrick Moniqui on 17-12-14.
//  Copyright © 2017 Patrick Moniqui. All rights reserved.
//

import Foundation

class TrainDao {
    var trainServices: TrainServices = TrainServices()
    
    func GetListVille() -> [VilleViewModel]
    {
        var villes: [VilleViewModel] = [VilleViewModel]()
        
        return villes
    }
    
    func GetListTrajet() -> [TrajetViewModel]
    {
        var trajets: [TrajetViewModel] = [TrajetViewModel]()
        
        return trajets
    }
    
    

}
