//
//  GoalController.swift
//  Bbetter_app
//
//  Created by 모바일인터넷과 on 2022/04/13.
//

import UIKit

class GoalController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier: String = "cell"
    let goalsDATA: [String] = ["test"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // 두개리턴
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goalsDATA.count
        
        }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        let text: String =  goalsDATA[indexPath.row]
        
        cell.textLabel?.text = text
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self

    }
    
    
}
