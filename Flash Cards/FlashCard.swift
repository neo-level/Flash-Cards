//
//  FlashCard.swift
//  Flash Cards
//
//  Created by Frederik Desmet on 02/07/2023.
//

import Foundation
import CoreData

public class FlashCard: NSManagedObject {
    @NSManaged public var word: String?
    @NSManaged public var answer: String?
    @NSManaged public var masteryLevel: Int16
}
