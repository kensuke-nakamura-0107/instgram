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
    
    var postId: String!
    @IBOutlet weak var commentField: UITextField!
    let user = Auth.auth().currentUser?.displayName
    
    //投稿ボタンを押したアクション
    @IBAction func postcomment(_ sender: Any) {
        
        print("DEBUG_PRINT: 投稿がタップされました。")
        print("DEBUG_PRINT: \(user)")
        
        //self.postId = document.documentID
        
    }
        
//        init(document: QueryDocumentSnapshot) {
//               self.id = document.documentID
//    }

        //①HomeViewControllerで取得したPostData情報を引き継ぐ
        //②①に対してコメントを保存する（コメント＋名前の形
        
        
        // コメントと投稿データの保存場所を定義する
        //let commentRef = Firestore.firestore().collection(Const.CommentPath).document()
        
        // HUDで投稿処理中の表示を開始
        //SVProgressHUD.show()
        
//         let name = Auth.auth().currentUser?.displayName
//         let postDic = [
//             "id":⭐️postsのID,
//             "name": user,
//             "comment": commentText,
//             "date": FieldValue.serverTimestamp(),
//             ] as [String : Any]
//         commentRef.setData(postDic)
        
//         // HUDで投稿完了を表示する
//         SVProgressHUD.showSuccess(withStatus: "投稿しました")
        
//         // 投稿処理が完了したので先頭画面に戻る
//        UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
        
        //表示用
        //self.name = postDic["name"] as? String
        //self.comment = postDic["comment"] as? String
    
    //キャンセルボタンを押したアクション
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        print("DEBUG_PRINT: キャンセルボタンがタップされました。")
    }

}
