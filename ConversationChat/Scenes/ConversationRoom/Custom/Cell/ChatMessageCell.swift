//
//  ChatMessageCell.swift
//  ConversationChat
//
//  Created by Raul Humberto Mantilla Assia on 10/23/18.
//  Copyright © 2018 Raul Mantilla. All rights reserved.
//

import UIKit

class ChatMessageCell: UICollectionViewCell {
    
    let messageTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 14.0)
        textView.text = "Sample Message"
        textView.backgroundColor = UIColor.clear
        textView.isScrollEnabled = false
        textView.isEditable = false
        return textView
    }()
    
    let textBubbleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        return view
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    static let grayImage = UIImage(named: "bubble_gray")?.resizableImage(withCapInsets: UIEdgeInsets(top: 22, left: 26, bottom: 22, right: 26)).withRenderingMode(.alwaysTemplate)
    
     static let blueImage = UIImage(named: "bubble_blue")?.resizableImage(withCapInsets: UIEdgeInsets(top: 22, left: 26, bottom: 22, right: 26)).withRenderingMode(.alwaysTemplate)
    
    let bubbleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ChatMessageCell.grayImage
        imageView.tintColor = UIColor(white: 0.95, alpha: 1)
        return imageView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(withDisplayedMessage: ConversationRoom.DisplayedMessage){
        addSubview(textBubbleView)
        addSubview(messageTextView)
        addSubview(profileImageView)
        messageTextView.text = withDisplayedMessage.message
        let avatar = Avatar.fromXib()
        if let avatar = avatar {
            profileImageView.addSubview(avatar)
            avatar.setImage(withUrl: "https://www.indiewire.com/wp-content/uploads/2016/09/south-park_2001_cartman.jpg?w=780")
        }
        
        let viewsDictionary = ["profileImageView": profileImageView, "bubbleImageView": bubbleImageView]
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[profileImageView(30)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary))
         addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[profileImageView(30)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary))
        profileImageView.backgroundColor = UIColor.red
        
        textBubbleView.addSubview(bubbleImageView)
        bubbleImageView.translatesAutoresizingMaskIntoConstraints = false
        textBubbleView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[bubbleImageView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary))
        textBubbleView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[bubbleImageView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary))
        
        
        //self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[message]|", options: [], metrics: nil, views: viewsDictionary))
    }

}
