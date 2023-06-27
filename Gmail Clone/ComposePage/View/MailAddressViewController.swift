//
//  MailAddressViewController.swift
//  Gmail Clone
//
//  Created by Dmitriy Mkrtumyan on 27.06.23.
//

import UIKit

class MailAddressViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let dataSource = [
        "randommail123@gmail.com",
        "randommail1234@gmail.com",
        "randommail1@gmail.com",
        "randommail3@gmail.com",
        "randommail4@gmail.com"
    ]
    var completion: ((String) ->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = dataSource[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if completion != nil {
            completion!(dataSource[indexPath.row])
        }
        dismiss(animated: true)
    }

}
