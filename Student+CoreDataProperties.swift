//
//  Student+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Sikandar Ali on 20/05/2021.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Entity")
    }

    @NSManaged public var name: NSObject?
    @NSManaged public var address: NSObject?
    @NSManaged public var city: NSObject?
    @NSManaged public var phone: NSObject?

}

extension Student : Identifiable {

}
