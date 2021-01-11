//
//  PostTableViewCell.swift
//  instagrm
//
//  Created by 中村憲佑 on 2020/12/29.
//  Copyright © 2020 kensuke.nakamura. All rights reserved.
//

import UIKit
import FirebaseUI
import Firebase

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var commentLavel: UILabel!
        
    var postId : String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    // PostDataの内容をセルに表示
    func setPostData(_ postData: PostData) {
           // 画像の表示
           postImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
           let imageRef = Storage.storage().reference().child(Const.ImagePath).child(postData.id + ".jpg")
           postImageView.sd_setImage(with: imageRef)

           // キャプションの表示
           self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
           // 日時の表示
           self.dateLabel.text = ""
           if let date = postData.date {
               let formatter = DateFormatter()
               formatter.dateFormat = "yyyy-MM-dd HH:mm"
               let dateString = formatter.string(from: date)
               self.dateLabel.text = dateString
           }
           // いいね数の表示
           let likeNumber = postData.likes.count
           likeLabel.text = "\(likeNumber)"

           // いいねボタンの表示
           if postData.isLiked {
               let buttonImage = UIImage(named: "like_exist")
               self.likeButton.setImage(buttonImage, for: .normal)
           } else {
               let buttonImage = UIImage(named: "like_none")
               self.likeButton.setImage(buttonImage, for: .normal)
           }
        // commentの内容をセルに表示
        //self.commentLavel.text = "空欄"
        if postData.comment.isEmpty{
            self.commentLavel.text = ""
        } else {
            let comment = postData.comment
            var comment_all = ""
            for value in comment {
                let comment:String = "\(value)\n"
                print("DEBUG_PRINT: \(comment)")
                comment_all += comment
            }
            self.commentLavel.text = comment_all
            print("DEBUG_PRINT comment_all = \(comment_all)`")
        }
    }
}
