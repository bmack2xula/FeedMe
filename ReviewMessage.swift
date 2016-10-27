//
//  ReviewMessage.swift
//  WriteAReview
//
//  Created by Patrice white on 10/26/16.
//  Copyright © 2016 Patrice white. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct ReviewMessage{
    
    let key: String!
    let content: String!
    let itemRef: FIRDatabaseReference?
    
    //Put data in database
    init(content: String, key: String = "" ){
        self.key = key
        self.content = content
        self.itemRef = nil
    }
    
    // Get data from database
    init(snapshot:FIRDataSnapshot){
        key = snapshot.key
        itemRef = snapshot.ref
        
        let snapshotValue = snapshot.value as? NSDictionary
        if let reviewMessage = snapshotValue?["content"] as? String {
            content = reviewMessage
        } else{
            content = ""
        }
    }
    
    func toAnyObject() -> AnyObject {
        return (["content": content] as? NSDictionary)!
    }
    
    
}
