//
//  ConversationRoomPresenter.swift
//  ConversationChat
//
//  Created by Raul Humberto Mantilla Assia on 10/23/18.
//  Copyright (c) 2018 Raul Mantilla. All rights reserved.

import Foundation

protocol ConversationRoomPresentationLogic
{
    func presentMessages(response: ListMessages.FetchMessages.Response)
}

class ConversationRoomPresenter: ConversationRoomPresentationLogic
{
    weak var viewController: ConversationRoomDisplayLogic?
    
    // MARK:
    
    func presentMessages(response: ListMessages.FetchMessages.Response)
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        var messages: [ListMessages.FetchMessages.ViewModel.DisplayedMessage] = []
        for message in response.messages
        {
            let timestamp = formatter.string(from: message.timestamp)
            
            let displayedMessage = ListMessages.FetchMessages.ViewModel.DisplayedMessage(id: message.id, chat_room_id: message.chat_room_id, from_id: message.from_id, to_id: message.to_id, timestamp: timestamp, message: message.message, isReaded: message.isReaded)
            
            messages.append(displayedMessage)
        }
        let viewModel = ListMessages.FetchMessages.ViewModel(displayedMessages: messages)
        viewController?.displayMessages(viewModel: viewModel)
    }
}
