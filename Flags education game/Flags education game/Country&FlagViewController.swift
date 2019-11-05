//
//  Country&FlagViewController.swift
//  Flags education game
//
//  Created by Анна Овчинникова  on 11/4/19.
//  Copyright © 2019 Анна Овчинникова . All rights reserved.
//

import UIKit
//var array: [Country] = []
class Country_FlagViewController: UIViewController {
    
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var lblRightOrNot: UILabel!
    
    var dataTuple:(img:String,field1:String,field2:String,field3:String) = ("","","","")
    var currentCountry = ""
    let countriesRequest = ResourceRequest<Country>(resourcePath: "countries")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //lblRightOrNot.backgroundColor = .brown
         self.view.backgroundColor = UIColor(red: 224.0/255.0, green: 212.0/255.0, blue: 172.0/255.0, alpha: 1.0)
        
        setDefaults()
  
    }
  
    @IBAction func answerChosen(_ sender: Any) {
        let btn = sender as! UIButton
 
        switch btn.tag {
        case 1:
            if btn.titleLabel?.text == currentCountry {
                refreshCountries()
            }
            else {
                lblRightOrNot.text = "Try again"
               
            }
        case 2:
            if btn.titleLabel?.text == currentCountry {
                refreshCountries()
            }
            else {
                lblRightOrNot.text = "Try again"
                //lblRightOrNot.backgroundColor = .red
            }
        case 3:
            if btn.titleLabel?.text == currentCountry {
                refreshCountries()
            }
            else {
                lblRightOrNot.text = "Try again"
                //lblRightOrNot.backgroundColor = .red
                 //btn.backgroundColor = .red
            }
        default:
            break
        }
        //lblRightOrNot.backgroundColor = .brown
        
    }
    
   func randForBtn(except:[Int],arrRange:Int)->Int {
        let exceptSpecialNumber1 = except[0]
        
        var randomNumber: Int?
        repeat {
            randomNumber = Int.random(in: 0...arrRange)
        } while exceptSpecialNumber1 == randomNumber!
        
        if except.count == 2 && except[1] == randomNumber {
            repeat {
                randomNumber = Int.random(in: 0...arrRange)
            } while exceptSpecialNumber1 == randomNumber! || randomNumber! == except[1]
        }
        return randomNumber!
        
    }
    
    func generateRandom(arr:[Country])->(img:String,field1:String,field2:String,field3:String){
        let arrRange = arr.count-1
        let rightNumber = Int.random(in: 0...arrRange)
        currentCountry = arr[rightNumber].name
        let image =  arr[rightNumber].flag
        let randNumOfField = Int.random(in: 1...3)
        
        var field1 = ""
        var field2 = ""
        var field3 = ""
        var randomForBtn1 = 0
        var randomForBtn2 = 0
        var randomForBtn3 = 0
        
        if randNumOfField == 1 {
            field1 = arr[rightNumber].name
            randomForBtn2 = randForBtn(except: [rightNumber], arrRange: arrRange)
            randomForBtn3 = randForBtn(except: [rightNumber,randomForBtn2], arrRange: arrRange)
            field2 = arr[randomForBtn2].name
            field3 = arr[randomForBtn3].name
        }
        else if randNumOfField == 2 {
            field2 = arr[rightNumber].name
            randomForBtn1 = randForBtn(except: [rightNumber], arrRange: arrRange)
            randomForBtn3 = randForBtn(except: [rightNumber,randomForBtn1], arrRange: arrRange)
            field1 = arr[randomForBtn1].name
            field3 = arr[randomForBtn3].name
        }
        else {
            field3 = arr[rightNumber].name
            randomForBtn1 = randForBtn(except: [rightNumber], arrRange: arrRange)
            randomForBtn2 = randForBtn(except: [rightNumber,randomForBtn1], arrRange: arrRange)
            field1 = arr[randomForBtn1].name
            field2 = arr[randomForBtn2].name
        }
        return (image,field1,field2,field3)
    }
    
    func refreshCountries() {
        lblRightOrNot.text = ""
        dataTuple =  generateRandom(arr: array)
        flagImage.image = UIImage.init(named: dataTuple.img)
        answer1.setTitle(dataTuple.field1, for: .normal)
        answer2.setTitle(dataTuple.field2, for: .normal)
        answer3.setTitle(dataTuple.field3, for: .normal)
    }
    
   
    func setDefaults() {
        dataTuple =  generateRandom(arr: array)
        flagImage.image = UIImage.init(named: dataTuple.img)
        answer1.setTitle(dataTuple.field1, for: .normal)
        answer2.setTitle(dataTuple.field2, for: .normal)
        answer3.setTitle(dataTuple.field3, for: .normal)
    }
        
       
}
    

