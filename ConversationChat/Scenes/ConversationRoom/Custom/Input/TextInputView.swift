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
    
    private enum Constants {
        static var minHeightForTextInputView: CGFloat = 60.0
        static var paddingForTextInputView: CGFloat = 20.0
        static var textViewPlaceHolder: String = "Send Message"
    }
    
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
        textView.font = UIFont(name: "verdana", size: 18.0)
        textView.text = ""
        textView.placeholder = Constants.textViewPlaceHolder
        textView.backgroundColor = UIColor.white
        textView.tintColor = UIColor.black
        return textView
    }()
    
    let sendMessageButton: UIButton = {
        let button = UIButton()
        button.setTitle("▶️", for: .normal)
        return button
    }()
    
    private func setupViews() {
        
        
        addSubview(messageTextView)
        addSubview(sendMessageButton)
        
        sendMessageButton.addTarget(self, action: #selector(self.sendButtonpressed), for: .touchUpInside)
        messageTextView.delegate = self
        
        // Setup Constraints
        let viewsDictionary = ["messageTextView": messageTextView, "sendMessageButton": sendMessageButton]
        
        messageTextView.translatesAutoresizingMaskIntoConstraints = false
        sendMessageButton.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[messageTextView]-10-[sendMessageButton(40)]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[messageTextView]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[sendMessageButton(40)]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary))
    }
    
    @objc private func sendButtonpressed() {
        if let delegate = delegate {
            delegate.textInputViewDidPressSendButton(withText: messageTextView.text)
            clear()
        }
    }
    
    public func clear(){
        messageTextView.text = ""
        updatePlaceHolder()
        updateMessageTextViewHeight()
    }
    
}

extension TextInputView: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        updateMessageTextViewHeight()
        updatePlaceHolder()
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
    
    func updatePlaceHolder() {
        for view in messageTextView.subviews {
            if let placeholder = view as? UILabel {
                placeholder.isHidden = (messageTextView.text.count > 0)
            }
        }
    }
}
