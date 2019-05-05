//
//  EntitiesTVController.swift
//  binetTestProject
//
//  Created by Бабаян Эрнест on 05/05/2019.
//  Copyright © 2019 Бабаян Эрнест. All rights reserved.
//

import UIKit

class EntriesTVController: UITableViewController {
    private let viewModel = EntriesTViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshTableView()
        setupTableView()
        setupBind()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createButtonTapped(_:)))
    }
    
    func setupBind() {
        viewModel.items.bind { (entriesList) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        viewModel.error.bind { (error) in
            self.presentSimpleAlertController(title: "Ошибка", message: error?.localizedDescription)
        }
        viewModel.isRefreshing.bind { (isActive) in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                isActive ? self.tableView.refreshControl?.beginRefreshing() : self.tableView.refreshControl?.endRefreshing()
            }
        }
    }
    
    // MARK: - Actions
    
    func setupTableView() {
        tableView.register(UINib(nibName: "EntryTVCell", bundle: nil), forCellReuseIdentifier: EntryTVCell.reuseID)
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refreshTableView), for: UIControl.Event.valueChanged)
    }

    @objc func createButtonTapped(_ sender: UIBarButtonItem) {
        guard let editorController = storyboard?.instantiateViewController(withIdentifier: "EntryEditorController") as? EntryEditorController else { return }
        editorController.viewModel.uploadState.bind { (state) in
            DispatchQueue.main.async {
                if state == .success { self.refreshTableView() }
            }
        }
        
        navigationController?.pushViewController(editorController, animated: true)
    }
    
    @objc func refreshTableView() {
        viewModel.fetchData()
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.value.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EntryTVCell.reuseID, for: indexPath) as! EntryTVCell
        cell.viewModel = EntryTVCellViewModel(entry: viewModel.items.value[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailController = storyboard?.instantiateViewController(withIdentifier: "EntryDetailController") as? EntryDetailController else { return }
        detailController.viewModel = EntryDetailViewModel(entry: viewModel.items.value[indexPath.row])
        navigationController?.pushViewController(detailController, animated: true)
    }
}
