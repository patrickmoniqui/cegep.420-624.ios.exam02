//
//  TrainServices.swift
//  com.exam02
//
//  Created by Patrick Moniqui on 17-12-14.
//  Copyright © 2017 Patrick Moniqui. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class TrainServices
{
    func GetListVille( completionHandler: @escaping ((Array<VilleViewModel>) -> Void) ){
        var villes = [VilleViewModel]()
        
        let url = URL(string: "http://www.derbali03795.com/villes.php")
        Alamofire.request(url!, method: .get).responseJSON { response in
            switch response.result {
            case .success(let value):
                let _json = JSON(value)
                for ville in _json.arrayValue {
                    let _ville = VilleViewModel(json: ville)
                    villes.append(_ville!)
                }
                completionHandler(villes)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func GetListTrajet( completionHandler: @escaping ((Array<TrajetViewModel>) -> Void) ){
        var trajets = [TrajetViewModel]()
        
        let url = URL(string: "http://www.derbali03795.com/trajets.php")
        Alamofire.request(url!, method: .get).responseJSON { response in
            switch response.result {
            case .success(let value):
                let _json = JSON(value)
                for trajet in _json.arrayValue {
                    let _trajet = TrajetViewModel(json: trajet)
                    trajets.append(_trajet!)
                }
                completionHandler(trajets)
            case .failure(let error):
                print(error)
            }
        }
    }

}
