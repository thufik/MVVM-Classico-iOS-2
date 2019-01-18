//
//  ViewController.swift
//  Classic MVVM 2
//
//  Created by EquipeSuporteAplicacao on 8/6/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import UIKit

class SomethingViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.table.register(UINib(nibName: "SomethingTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "somethingCell")
        self.table.dataSource = self
        self.table.delegate = self

        self.viewModel.updatedList = {
            self.table.reloadData()
        }
    }
}

extension SomethingViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "somethingCell", for: indexPath) as! SomethingTableViewCell

        let something = viewModel.x(index: indexPath.row)

        cell.setup(something: something)
        
        return cell
    }
}

extension SomethingViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
