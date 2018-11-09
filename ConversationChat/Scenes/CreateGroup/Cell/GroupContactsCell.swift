//
//  GroupContactsCell.swift
//  ConversationChat
//
//  Created by Raul Humberto Mantilla Assia on 10/18/18.
//  Copyright © 2018 rmantilla. All rights reserved.
//

import UIKit

class GroupContactsCell: UITableViewCell {
    
    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var checkImageView: UIImageView!
    
    var displayedContact: CreateGroup.FetchContacts.ViewModel.DisplayedContact!
    var selectedContact: Bool!
    
    static let circleBlank = UIImage(named: "check-circle-blank")?.withRenderingMode(.alwaysTemplate)
    static let circle = UIImage(named: "check-circle")?.withRenderingMode(.alwaysTemplate)
    
    func setup(withDisplayedContact displayedContact: CreateGroup.FetchContacts.ViewModel.DisplayedContact, selected: Bool) {
        self.displayedContact = displayedContact
        self.selectedContact = selected
        showData()
        setThemes()
    }
    
    private func showData() {
        title.text = displayedContact.fullname
        setAvatar()
        setCheckImage()
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
    
    private func setCheckImage() {
        checkImageView.image = selectedContact ? GroupContactsCell.circle : GroupContactsCell.circleBlank
    }
    
    private func setThemes() {
        title.textColor = UIColor.black
        checkImageView.tintColor = selectedContact ? nil : UIColor(white: 0.95, alpha: 1)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
