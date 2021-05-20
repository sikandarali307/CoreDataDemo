//
//  ListViewController.swift
//  CoreDataDemo
//
//  Created by Sikandar Ali on 20/05/2021.
//

import UIKit
protocol datapass {
    func data(object:[String:String],index:Int,isEdit:Bool)
}
class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    var students = [Student]()
    var delegate:datapass!
    @IBOutlet weak var mytableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        students   = DatabaseHelper.shared.studentfetchrequest()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  mytableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListTableViewCell
        cell.student = students[indexPath.row]
    
        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            students = DatabaseHelper.shared.delete(index: indexPath.row)
            self.mytableview.deleteRows(at: [indexPath], with: .automatic)
            self.mytableview.reloadData()
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.popViewController(animated: true)
        let dic = ["name":students[indexPath.row].name,
                   "address":students[indexPath.row].address,
                   "city":students[indexPath.row].city,
                   "phone":students[indexPath.row].phone]
        delegate.data(object: (dic as? [String:String])!, index: indexPath.row, isEdit: true)
    }
}
