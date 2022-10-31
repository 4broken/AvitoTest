//
//  ViewController.swift
//  AvitoTest
//
//  Created by Shamil Mazitov on 25.10.2022.
//

import UIKit
import Reachability

protocol ViewControllerInputProtocol: AnyObject {
    func failure(error:Error)
    func success()
    
}

class ViewController: UIViewController {
    
    var presenter: PresenterOutputProtocol
    var informationArr: [Information] = []
    let tableView = UITableView()
    private let scrollView = UIScrollView()
    private let reachability = try! Reachability()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityDidChange(_:)), name: Notification.Name(rawValue: "ReachabilityDidChangeNotification"), object: nil)
             _ = try? reachability.startNotifier()
        setupView()
        setupConstraints()
        
    }
    
    private func checkConnection() {
        reachability.whenUnreachable = { reachability in
            if reachability.connection == .unavailable {
                let alertController = UIAlertController(title: "Connection error", message: "Connection is not found", preferredStyle: .alert)
                let action = UIAlertAction(title: "Cancel", style: .default)
                alertController.addAction(action)
                self.presenter.getData()
                self.view.willRemoveSubview(self.scrollView)
                self.present(alertController, animated: true)
                
            }
        }
        
        reachability.whenReachable = { _ in
            self.presenter.getData()
                
        }
    }
    
    @objc func reachabilityDidChange(_ notification: Notification) {
             checkConnection()
         }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            checkConnection()
        }
    
   private func setupView() {
        view.addSubview(scrollView)
        scrollView.addSubview(tableView)
        scrollView.backgroundColor = .white
        
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = view.frame.size.height/5
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
    }
    
   private func setupConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            tableView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
        ])
    }
    
    
    required init(presenter: PresenterOutputProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    deinit {
            NotificationCenter.default.removeObserver(self)
            reachability.stopNotifier()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

