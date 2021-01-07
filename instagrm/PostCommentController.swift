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
        
        if commentField.text != "" {
            
            var updateValue: FieldValue
            updateValue = FieldValue.arrayUnion([postId])
            let postRef = Firestore.firestore().collection(Const.PostPath).document(postId)
            postRef.updateData(["comment": updateValue])
        // コメントと投稿データの保存場所を定義する
        //let commentRef = Firestore.firestore().collection(Const.CommentPath).document()
        // HUDで投稿処理中の表示を開始
        SVProgressHUD.show()
        }

//        let commentDic = [
//                "postid":postId,
//                "name": user,
//                "comment": commentField.text,
//                "date": FieldValue.serverTimestamp(),
//                      ] as [String : Any]
//        commentRef.setData(commentDic)
//        // HUDで投稿完了を表示する
//        SVProgressHUD.showSuccess(withStatus: "投稿しました")
//        }
        // 投稿処理が完了したので先頭画面に戻る
        UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    //キャンセルボタンを押したアクション
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        print("DEBUG_PRINT: キャンセルボタンがタップされました。")
    }
}

//// 配列からタップされたインデックスのデータを取り出す
//let postData = postArray[indexPath!.row]
//
//// likesを更新する
//if let myid = Auth.auth().currentUser?.uid {
//    // 更新データを作成する
//    var updateValue: FieldValue
//    if postData.isLiked {
//        // すでにいいねをしている場合は、いいね解除のためmyidを取り除く更新データを作成
//        updateValue = FieldValue.arrayRemove([myid])
//    } else {
//        // 今回新たにいいねを押した場合は、myidを追加する更新データを作成
//        updateValue = FieldValue.arrayUnion([myid])
//    }
//    // likesに更新データを書き込む
//    let postRef = Firestore.firestore().collection(Const.PostPath).document(postData.id)
//    postRef.updateData(["likes": updateValue])
