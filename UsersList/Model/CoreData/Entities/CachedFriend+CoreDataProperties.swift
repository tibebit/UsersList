//
//  CachedFriend+CoreDataProperties.swift
//  UsersList
//
//  Created by Fabio Tiberio on 25/03/22.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var user: CachedUser?
    
    public var wrappedName: String {
        name ?? "Unknown"
    }
}

extension CachedFriend : Identifiable {

}
