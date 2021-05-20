//
//  DatabaseHelper.swift
//  CoreDataDemo
//
//  Created by Sikandar Ali on 20/05/2021.
//

import Foundation
import CoreData
import UIKit
class DatabaseHelper {
   static var shared = DatabaseHelper()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    
    func save (object:[String:String]){
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!) as? Student
        student?.name    = object["name"] as NSObject?
        student?.address = object["address"] as NSObject?
        student?.city    = object["city"] as NSObject?
        student?.phone   = object["phone"] as NSObject?
        
        do{
            try context?.save()
        }
        catch {
            print("Data does not to save into database")
        }
    }
    
    func studentfetchrequest()->[Student]{
        var student = [Student]()
        let fetchrequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        do{
            student = try context?.fetch(fetchrequest) as! [Student]
            
        }catch{
            print("can not get data")
        }
        return student
    }
    func delete(index:Int)->[Student]{
        var student = studentfetchrequest()
        context?.delete(student[index])
        student.remove(at: index)
        do {
            try context?.save()
             
        } catch{
            print("can not delete data")
        }
        return student
    }
    func iIsEdit(object:[String:String],i:Int){
        let student = studentfetchrequest()
        student[i].name = object["name"] as NSObject?
        student[i].address = object["address"] as NSObject?
        student[i].city = object["city"] as NSObject?
        student[i].phone = object["phone"] as NSObject?
        do {
            try context?.save()
        } catch  {
            print("data is not updated")
        }
    }
}
