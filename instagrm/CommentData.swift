//
//  CommentData.swift
//  instagrm
//
//  Created by 中村憲佑 on 2020/12/31.
//  Copyright © 2020 kensuke.nakamura. All rights reserved.
//

import UIKit
import Firebase

class CommentData: NSObject {
    var id: String
    var name: String?
    var comment: String?
    var date: Date?
    
    init(document: QueryDocumentSnapshot) {
        
    self.id = document.documentID
    let commentDic = document.data()
    
    self.name = commentDic["name"] as? String
    self.comment = commentDic["comment"] as? String
    
    let timestamp = commentDic["date"] as? Timestamp
    self.date = timestamp?.dateValue()
    }
}
