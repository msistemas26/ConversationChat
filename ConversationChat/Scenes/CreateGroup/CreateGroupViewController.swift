//
//  CreateGroupViewController.swift
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

protocol CreateGroupDisplayLogic: class
{
    func displayContacts(viewModel: CreateGroup.FetchContacts.ViewModel)
    func createdChatRoom()
}

class CreateGroupViewController: UIViewController, CreateGroupDisplayLogic
{
    var interactor: CreateGroupBusinessLogic?
    var router: (NSObjectProtocol & CreateGroupRoutingLogic & CreateGroupDataPassing)?
    var displayedContacts: [CreateGroup.FetchContacts.ViewModel.DisplayedContact] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    
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
        let interactor = CreateGroupInteractor()
        let presenter = CreateGroupPresenter()
        let router = CreateGroupRouter()
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
        setNextButtonStatus()
    }
    
    func fetchContacts()
    {
        interactor?.fetchContacts()
    }
    
    func displayContacts(viewModel: CreateGroup.FetchContacts.ViewModel)
    {
        displayedContacts = viewModel.displayedContacts
    }
    
    func setNextButtonStatus(){
        if let interactor = interactor {
            nextButton.isEnabled = interactor.selectedContactsCount > 0
        }
    }
    
    @IBAction func createChatRoom(_ sender: UIBarButtonItem) {
        interactor?.createChatRoom()
    }
    
    func createdChatRoom(){
        router?.routeToConversation()
    }
}


// MARK: - UItableView Delegates implementation

extension CreateGroupViewController: UITableViewDelegate, UITableViewDataSource
{
    func setUpTableView() {
        tableView.register(UINib(nibName: String(describing: GroupContactsCell.self), bundle: nil), forCellReuseIdentifier: String(describing: GroupContactsCell.self))
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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: GroupContactsCell.self), for: indexPath) as? GroupContactsCell, let interactor = interactor else { return UITableViewCell() }
        cell.setup(withDisplayedContact: displayedContact, selected: interactor.isContactSelected(withContact: displayedContact))
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedContact = displayedContacts[indexPath.row]
        interactor?.manageSelectedContacts(withContact: selectedContact)
        tableView.reloadRows(at: [indexPath], with: .none)
        setNextButtonStatus()
    }
}
