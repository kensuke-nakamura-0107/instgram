//
//  PostCommentController.swift
//  instagrm
//
//  Created by 中村憲佑 on 2020/12/30.
//  Copyright © 2020 kensuke.nakamura. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class PostCommentController: UIViewController {
    
    var commentText: String!
    
    @IBOutlet weak var commentField: UITextField!
    
    @IBAction func postcomment(_ sender: Any) {
        print("DEBUG_PRINT: 投稿がタップされました。")
        
        // コメントと投稿データの保存場所を定義する
        let postRef = Firestore.firestore().collection(Const.PostPath).document()
        let commentRef = Storage.storage().reference().child(Const.CommentPath).child(postRef.documentID)
        
        // HUDで投稿処理中の表示を開始
        SVProgressHUD.show()
        
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        print("DEBUG_PRINT: キャンセルボタンがタップされました。")
    }

}
