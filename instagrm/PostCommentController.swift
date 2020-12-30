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
    
    
    @IBAction func postcomment(_ sender: Any) {
        print("DEBUG_PRINT: 投稿がタップされました。")
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        print("DEBUG_PRINT: キャンセルボタンがタップされました。")
    }

}
