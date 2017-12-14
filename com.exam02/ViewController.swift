//
//  ViewController.swift
//  com.exam02
//
//  Created by Patrick Moniqui on 17-12-14.
//  Copyright © 2017 Patrick Moniqui. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {

    var trainServices: TrainServices = TrainServices()
    var villes: [VilleViewModel] = [VilleViewModel]()
    var trajets: [TrajetViewModel] = [TrajetViewModel]()
    var villeDepartId: Int = -1
    var villeArriveeId: Int = -1
    
    @IBOutlet weak var villePickerDepart: UIPickerView!
    
    @IBOutlet weak var villePickerArrivee: UIPickerView!
    
    @IBOutlet weak var imageVilleDepart: UIImageView!
    
    @IBOutlet weak var imageVilleArrivee: UIImageView!
    
    @IBOutlet weak var btnAfficher: UIButton!
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnAfficher.isEnabled = false
        
        self.trainServices.GetListVille(completionHandler: {
            _villes in
            self.villes = _villes
            
            self.villeDepartId = self.villes[0].Id
            self.villeArriveeId = self.villes[0].Id
            
            self.villePickerDepart.reloadAllComponents()
            self.villePickerArrivee.reloadAllComponents()
            
            self.btnAfficher.isEnabled = true
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        //picker ville depart
        if(pickerView == villePickerDepart)
        {
            return 1
        }
        else if(pickerView == villePickerArrivee)
        {
            return 1
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //picker ville depart
        if(pickerView == villePickerDepart)
        {
            return villes.count
        }
        else if(pickerView == villePickerArrivee)
        {
            return villes.count

        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print("setting picker tag: " + String(pickerView.tag))
        
        //picker ville depart
        if(pickerView == villePickerDepart)
        {
            return String(self.villes[row].NomVille)
        }
        //picker ville arrivee
        else if(pickerView == villePickerArrivee)
        {
            return String(self.villes[row].NomVille)
        }
        
        //error
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let url = villes[row].ImagePath
        
        //picker ville depart
        if(pickerView == villePickerDepart)
        {
            self.villeDepartId = villes[row].Id
            self.imageVilleDepart.setImageFromURl(stringImageUrl: url)
        }
            //picker ville arrivee
        else if(pickerView == villePickerArrivee)
        {
            self.villeArriveeId = villes[row].Id
            self.imageVilleArrivee.setImageFromURl(stringImageUrl: url)
        }
        
        if(self.villeDepartId > 0 && self.villeArriveeId > 0)
        {
            self.btnAfficher.isEnabled=true
        }
        else
        {
            self.btnAfficher.isEnabled=false
        }
    }
    
    @IBAction func btnAfficher_Touch(_ sender: Any) {
        
        if(self.btnAfficher.isEnabled==true)
        {
            self.trainServices.GetListTrajet(completionHandler: {
                _trajets in
                self.FindHoraires(trajets: _trajets)
            })
        }
    }
    
    func FindHoraires(trajets: [TrajetViewModel])
    {
        var filtered_trajets: [TrajetViewModel] = [TrajetViewModel]()
        
        for trajet in trajets
        {
            if(trajet.VilleDepartId == self.villeDepartId && trajet.VilleArriveeId == self.villeArriveeId)
            {
                filtered_trajets.append(trajet)
            }
        }
        
        self.trajets = filtered_trajets
        self.table.reloadData()
    }
    
    // Table view
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return trajets.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = trajets[indexPath.row].NumTrain + " | " + trajets[indexPath.row].HeureDepartString + " | " + trajets[indexPath.row].HeureArriveeString
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = trajets[indexPath.row]
    }

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "#Train | Depart | Arrivee"
    }
}

//methode d'extension qui affiche une image provenant d'une source externe
extension UIImageView{
    
    func setImageFromURl(stringImageUrl url: String){
        
        if let url = NSURL(string: url) {
            if let data = NSData(contentsOf: url as URL) {
                self.image = UIImage(data: data as Data)
            }
        }
    }
}
