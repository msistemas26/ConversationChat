//
//  ListContactsCell.swift
//  ConversationChat
//
//  Created by Raul Humberto Mantilla Assia on 10/18/18.
//  Copyright © 2018 rmantilla. All rights reserved.
//

import UIKit

class ListContactsCell: UITableViewCell {
    
    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    @IBOutlet weak var titleCenterConstraint: NSLayoutConstraint!
    var displayedContact: ListContacts.FetchContacts.ViewModel.DisplayedContact!

    func setup(withDisplayedContact displayedContact: ListContacts.FetchContacts.ViewModel.DisplayedContact) {
        self.displayedContact = displayedContact
        showData()
        setAvatar()
        setThemes()
        setTitleConstraint()
    }
    
    private func showData() {
        title.text = displayedContact.fullname
        desc.text = displayedContact.description
    }
    
    private func setAvatar() {
        let avatar = Avatar.fromXib()
        if let avatar = avatar {
            self.avatarView.addSubview(avatar)
            //avatar.setInitials(displayedContact.initials)
            //avatar.setImage(UIImage(named: "avatar")!)
            avatar.setImage(withUrl: displayedContact.avatarUrl)
            avatar.setOnlineIndicator(false)
        }
    }
    
    private func setTitleConstraint() {
        guard let descString = displayedContact.description, !descString.isEmpty else {
            titleCenterConstraint.constant = 0
            desc.isHidden = true
            return
        }
        desc.isHidden = false
    }
    
    private func setThemes() {
        title.textColor = UIColor.black
        desc.textColor = UIColor.lightGray
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
