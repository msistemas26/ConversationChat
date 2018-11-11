//
//  ListChatRoomsCell.swift
//  ConversationChat
//
//  Created by Raul Humberto Mantilla Assia on 10/18/18.
//  Copyright © 2018 rmantilla. All rights reserved.
//

import UIKit

class ListChatRoomsCell: UITableViewCell {
    
    @IBOutlet weak var avatar: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var timestamp: UILabel!
    @IBOutlet weak var readStatus: UIImageView!

    var displayedChatRoom: ListChatRooms.FetchChatRooms.ViewModel.DisplayedChatRoom!
    
    func setup(withDisplayedChatRoom displayedChatRoom: ListChatRooms.FetchChatRooms.ViewModel.DisplayedChatRoom) {
        self.displayedChatRoom = displayedChatRoom
        showData()
        setThemes()
    }
    
    private func showData() {
        title.text = displayedChatRoom.name
        desc.text = displayedChatRoom.room_description
        setAvatar()
    }
    
    private func setAvatar() {
        let avatar = Avatar.fromXib()
        if let avatar = avatar {
            self.avatar.addSubview(avatar)
            //avatar.setInitials(displayedContact.initials)
            //avatar.setImage(UIImage(named: "avatar")!)
            avatar.setImage(withUrl: displayedChatRoom.logoUrl)
        }
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
