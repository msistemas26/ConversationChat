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
    var displayedChatRooms: [ListChatRooms.FetchChatRooms.ViewModel.DisplayedChatRoom] = []
    
    @IBOutlet weak var tableView: UITableView!
    
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
        setUpTableView()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        fetchChatRooms()
    }
    
    // MARK: Methods
    
    func fetchChatRooms()
    {
        interactor?.fetchChatRooms()
    }
    
    func displayChatRooms(viewModel: ListChatRooms.FetchChatRooms.ViewModel)
    {
        displayedChatRooms = viewModel.displayedChatRooms
        tableView.reloadData()
    }
}


// MARK: - UItableView Delegates implementation

extension ListChatRoomsViewController: UITableViewDelegate, UITableViewDataSource
{
    func setUpTableView() {
        tableView.register(UINib(nibName: String(describing: ListChatRoomsCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ListChatRoomsCell.self))
        tableView.rowHeight = 84.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return displayedChatRooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let displayedChatRoom = displayedChatRooms[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListChatRoomsCell.self), for: indexPath) as? ListChatRoomsCell else { return UITableViewCell() }
        
        cell.setup(withDisplayedChatRoom: displayedChatRoom)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor?.selectChatRoom(withIndex: indexPath.row)
        router?.routeToConversation()
    }
}
