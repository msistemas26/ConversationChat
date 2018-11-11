//
//  ConversationRoomPresenter.swift
//  ConversationChat
//
//  Created by Raul Humberto Mantilla Assia on 10/23/18.
//  Copyright (c) 2018 Raul Mantilla. All rights reserved.

import Foundation

protocol ConversationRoomPresentationLogic
{
    func presentMessages(response: ConversationRoom.FetchMessages.Response)
    func presentMessage(response: ConversationRoom.SendMessage.Response)
}

class ConversationRoomPresenter: ConversationRoomPresentationLogic
{
    weak var viewController: ConversationRoomDisplayLogic?
    
    // MARK:
    
    func presentMessages(response: ConversationRoom.FetchMessages.Response)
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        var messages: [ConversationRoom.DisplayedMessage] = []
        for message in response.messages
        {
            let timestamp = formatter.string(from: message.timestamp)
            
            let displayedMessage = ConversationRoom.DisplayedMessage(id: message.id, from: message.from, timestamp: timestamp, message: message.message, isReaded: message.isReaded)
            
            messages.append(displayedMessage)
        }
        let viewModel = ConversationRoom.FetchMessages.ViewModel(displayedMessages: messages)
        viewController?.displayMessages(viewModel: viewModel)
    }
    
    func presentMessage(response: ConversationRoom.SendMessage.Response)
    {
        let message = response.message
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let timestamp = formatter.string(from: message.timestamp)
        
        let displayedMessage = ConversationRoom.DisplayedMessage(id: message.id, from: message.from, timestamp: timestamp, message: message.message, isReaded: message.isReaded)
        
        let viewModel = ConversationRoom.SendMessage.ViewModel(displayedMessage: displayedMessage)
        
        viewController?.displayMessage(viewModel: viewModel)
    }
}
