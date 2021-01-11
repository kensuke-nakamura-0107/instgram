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
    
    var postId = ""
    @IBOutlet weak var commentField: UITextField!
    let user = Auth.auth().currentUser?.displayName
    
    //投稿ボタンを押したアクション
    @IBAction func postcomment(_ sender: Any) {
        
        //ユーザー名とコメントを配列でpost
        if commentField.text != "" {
            let comment_name = user! + " : " + commentField.text!
            var updateValue: FieldValue
            updateValue = FieldValue.arrayUnion([comment_name as Any])
            let postRef = Firestore.firestore().collection(Const.PostPath).document(postId)
            postRef.updateData(["comment": updateValue])
            print("DEBUG_PRINT: \(String(describing: comment_name))")
        // HUDで投稿処理中の表示を開始
        SVProgressHUD.show()
        //HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "投稿しました")
        }
        // 投稿処理が完了したので先頭画面に戻る
        UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    //キャンセルボタンを押したアクション
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        print("DEBUG_PRINT: キャンセルボタンがタップされました。")
    }
}
