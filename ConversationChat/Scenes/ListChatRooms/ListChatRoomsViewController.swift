//
//  ListChatRoomsViewController.swift
//  ConversationChat
//
//  Created by Raul Mantilla on 14/10/18.
//  Copyright (c) 2018 Raul Mantilla. All rights reserved.

import UIKit

protocol ListChatRoomsDisplayLogic: class
{
  func displayChatRooms(viewModel: ListChatRooms.FetchChatRooms.ViewModel)
}

class ListChatRoomsViewController: UIViewController, ListChatRoomsDisplayLogic
{
  var interactor: ListChatRoomsBusinessLogic?
  var router: (NSObjectProtocol & ListChatRoomsRoutingLogic & ListChatRoomsDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = ListChatRoomsInteractor()
    let presenter = ListChatRoomsPresenter()
    let router = ListChatRoomsRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    fetchChatRooms()
  }
  
  // MARK: Do something
  
  func fetchChatRooms()
  {
    let request = ListChatRooms.FetchChatRooms.Request()
    interactor?.fetchChatRooms(request: request)
  }
  
  func displayChatRooms(viewModel: ListChatRooms.FetchChatRooms.ViewModel)
  {
    print(viewModel.displayedChatRooms)
  }
}
