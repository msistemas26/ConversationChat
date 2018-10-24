//
//  TextInputView.swift
//  ConversationChat
//
//  Created by Raul Humberto Mantilla Assia on 10/24/18.
//  Copyright © 2018 Raul Mantilla. All rights reserved.
//

import UIKit

protocol TextInputViewProtocol {
    func textInputViewDidChange(size : CGSize)
    func textInputViewDidPressSendButton(withText text: String)
}

class TextInputView: UIView {
    
    public var delegate: TextInputViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    let messageTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 18.0)
        textView.text = "Send Message"
        textView.backgroundColor = UIColor.white
        textView.tintColor = UIColor.black
        return textView
    }()
    
    let sendMessageButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "▶️"
        button.backgroundColor = UIColor.red
        return button
    }()
    
    private func setupViews() {
        
        addSubview(messageTextView)
        addSubview(sendMessageButton)
        
        messageTextView.delegate = self
        
        // Setup Constraints
        let viewsDictionary = ["messageTextView": messageTextView, "sendMessageButton": sendMessageButton]
        
        messageTextView.translatesAutoresizingMaskIntoConstraints = false
        sendMessageButton.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[messageTextView]-10-[sendMessageButton(40)]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[messageTextView]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[sendMessageButton(40)]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary))
    }
}

extension TextInputView: UITextViewDelegate {
    
    private enum Constants {
        static var minHeightForTextInputView: CGFloat = 60.0
        static var paddingForTextInputView: CGFloat = 20.0
    }
    
    func textViewDidChange(_ textView: UITextView) {
        updateMessageTextViewHeight()
    }
    
    private func updateMessageTextViewHeight() {
        
        var newSize = messageTextView.frame.size
        newSize.height = max(messageTextView.contentSize.height + Constants.paddingForTextInputView, Constants.minHeightForTextInputView)
        
        let  messageTextViewOffset = CGPoint(x: 0, y: messageTextView.contentSize.height - messageTextView.bounds.size.height)
        messageTextView.setContentOffset(messageTextViewOffset, animated: false)
        
        if let delegate = delegate {
            delegate.textInputViewDidChange(size: newSize)
        }
    }
}
