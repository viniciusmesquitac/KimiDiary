//
//  Daily+CoreDataProperties.swift
//  KimiDiary
//
//  Created by Vinicius Mesquita on 22/10/20.
//  Copyright © 2020 Vinicius Mesquita. All rights reserved.
//
//

import Foundation
import CoreData


extension Daily {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Daily> {
        return NSFetchRequest<Daily>(entityName: "Daily")
    }

    @NSManaged public var bodyText: String?
    @NSManaged public var date: Double
    @NSManaged public var title: String?

}

extension Daily : Identifiable {

}
