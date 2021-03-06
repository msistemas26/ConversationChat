//
//  ListContactsViewController.swift
//  ConversationChat
//
//  Created by Raul Mantilla on 20/10/18.
//  Copyright (c) 2018 Raul Mantilla. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ListContactsDisplayLogic: class
{
    func displayContacts(viewModel: ListContacts.FetchContacts.ViewModel)
    func createdChatRoom()
}

class ListContactsViewController: UIViewController, ListContactsDisplayLogic
{
    var interactor: ListContactsBusinessLogic?
    var router: (NSObjectProtocol & ListContactsRoutingLogic & ListContactsDataPassing)?
    var displayedContacts: [ListContacts.FetchContacts.ViewModel.DisplayedContact] = []
    
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
        let interactor = ListContactsInteractor()
        let presenter = ListContactsPresenter()
        let router = ListContactsRouter()
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
        fetchContacts()
    }
    
    // MARK: Methods
    
    func fetchContacts()
    {
        interactor?.fetchContacts()
    }
    
    func displayContacts(viewModel: ListContacts.FetchContacts.ViewModel)
    {
        displayedContacts = viewModel.displayedContacts
    }
    
    func createdChatRoom(){
        router?.routeToConversation()
    }
}


// MARK: - UItableView Delegates implementation

extension ListContactsViewController: UITableViewDelegate, UITableViewDataSource
{
    func setUpTableView() {
        tableView.register(UINib(nibName: String(describing: ListContactsCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ListContactsCell.self))
        tableView.estimatedRowHeight = 70.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return displayedContacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let displayedContact = displayedContacts[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListContactsCell.self), for: indexPath) as? ListContactsCell else { return UITableViewCell() }
        
        cell.setup(withDisplayedContact: displayedContact)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor?.createChatRoom(withContactIndex: indexPath.row)
    }
}
