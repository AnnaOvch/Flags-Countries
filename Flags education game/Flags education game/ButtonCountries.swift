//
//  ButtonCountries.swift
//  Flags education game
//
//  Created by Анна Овчинникова  on 11/5/19.
//  Copyright © 2019 Анна Овчинникова . All rights reserved.
//

import UIKit

class ButtonCountries: UIButton {
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor(red: 174.0/255.0, green: 137.0/255.0, blue: 129.0/255.0, alpha: 1.0).cgColor
        self.backgroundColor = UIColor(red: 221.0/255.0, green: 183.0/255.0, blue: 146.0/255.0, alpha: 1.0)
        self.titleLabel?.textColor = .white
        self.titleLabel?.font = .systemFont(ofSize: 21)
        
    }

}
