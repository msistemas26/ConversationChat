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
    @IBOutlet weak var timestamp: UILabel!
    @IBOutlet weak var readStatus: UIImageView!
    
    let avatar = Avatar.fromXib()
    @IBOutlet weak var titleCenterConstraint: NSLayoutConstraint!
    var displayedContact: ListContacts.FetchContacts.ViewModel.DisplayedContact!
    
    static func fromXib() -> ListContactsCell? {
        guard let cell = Bundle(for: ListContactsCell.self).loadNibNamed(String(describing: ListContactsCell.self), owner: self, options: nil)?.first as? ListContactsCell else { return nil }
        return cell
    }

    func setup(withDisplayedContact displayedContact: ListContacts.FetchContacts.ViewModel.DisplayedContact) {
        self.displayedContact = displayedContact
        showData()
        setThemes()
        setConstraints()
    }
    
    private func showData() {
        title.text = displayedContact.fullname
        if let avatar = avatar {
            self.avatarView.addSubview(avatar)
            avatar.setup(initials: displayedContact.initials)
        }
    }
    
    private func setThemes() {
        title.textColor = UIColor.black
        desc.textColor = UIColor.lightGray
    }
    
    private func setConstraints() {
        if displayedContact.description.isEmpty {
            titleCenterConstraint.constant = 0
            desc.isHidden = true
        } else {
            desc.isHidden = false
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
