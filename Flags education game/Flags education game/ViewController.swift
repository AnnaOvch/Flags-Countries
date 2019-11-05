//
//  ViewController.swift
//  Flags education game
//
//  Created by Анна Овчинникова  on 11/4/19.
//  Copyright © 2019 Анна Овчинникова . All rights reserved.
//

import UIKit

var array: [Country] = []
let countriesRequest = ResourceRequest<Country>(resourcePath: "countries")
class ViewController: UIViewController {

    @IBOutlet weak var startBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 221.0/255.0, green: 183.0/255.0, blue: 146.0/255.0, alpha: 1.0)
        
       startBtn.backgroundColor = UIColor(red: 123.0/255.0, green: 131.0/255.0, blue: 175.0/255.0, alpha: 1.0)
       startBtn.layer.borderWidth = 2.0
       startBtn.layer.borderColor = UIColor(red: 43.0/255.0, green: 48.0/255.0, blue: 100.0/255.0, alpha: 1.0).cgColor
        
        countriesRequest.getAll { [weak self] result in
            
            switch result {
            // 3
            case .failure:
                ErrorPresenter.showError(message: "There was an error getting the users", on: self)
            // 4
            case .success(let countries):
                DispatchQueue.main.async { [weak self] in
                    array = countries
                }
            }
        }
        
        
        

        
       
    }
   
}

