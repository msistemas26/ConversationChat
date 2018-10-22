//
//  ListChatRoomsInteractor.swift
//  ConversationChat
//
//  Created by Raul Mantilla on 14/10/18.
//  Copyright (c) 2018 Raul Mantilla. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ListChatRoomsBusinessLogic
{
    func fetchChatRooms(request: ListChatRooms.FetchChatRooms.Request)
}

protocol ListChatRoomsDataStore
{
    var chatRooms: [RealmChatRooms] { get set }
}

class ListChatRoomsInteractor: ListChatRoomsBusinessLogic, ListChatRoomsDataStore
{
    var presenter: ListChatRoomsPresentationLogic?
    var worker: ListChatRoomsWorker?
    var chatRooms: [RealmChatRooms] = []
    
    // MARK: Fetch Chat Rooms
    
    func fetchChatRooms(request: ListChatRooms.FetchChatRooms.Request)
    {
        worker = ListChatRoomsWorker()
        
        worker?.fetchChatRooms { (chatRooms) in
            self.chatRooms = chatRooms
            let response = ListChatRooms.FetchChatRooms.Response(chatRooms: chatRooms)
            self.presenter?.presentChatRooms(response: response)
        }
    }
}
