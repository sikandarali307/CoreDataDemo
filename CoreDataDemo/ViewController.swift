//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Sikandar Ali on 20/05/2021.
//

import UIKit
import CoreData
class ViewController: UIViewController ,datapass {
   
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var saveuser: UIButton!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var addres: UITextField!
    @IBOutlet weak var showme: UIButton!
    var i = Int()
    var isUpdate = Bool()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        saveuser.layer.cornerRadius = 12
        showme.layer.cornerRadius = 12
    }

    @IBAction func showAction(_ sender: Any) {
        
        let bc = self.storyboard?.instantiateViewController(identifier: "list") as? ListViewController
        bc?.delegate = self
        self.navigationController?.pushViewController(bc!, animated: true)
    }
    
    @IBAction func saveAction(_ sender: Any) {
        let dic = ["name":name.text,"address":addres.text,"city":city.text,"phone":phone.text]
        if isUpdate{
            DatabaseHelper.shared.iIsEdit(object: dic as! [String:String], i: i)
        }else{
         DatabaseHelper.shared.save(object: dic as! [String : String])
        }
        
    }
    func data(object: [String : String],index:Int,isEdit:Bool) {
        name.text =  object["name"]
        addres.text = object["address"]
        city.text = object["city"]
        phone.text = object["phone"]
        i = index
        isUpdate = isEdit
    }
    
}

