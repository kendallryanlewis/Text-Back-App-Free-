//
//  recentMessageViewController.swift
//  Text Back App (Free)
//
//  Created by Kendall Lewis on 2/25/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit

var userMessages: [String] = ["this is message 1", "this is message 2","this is message 3","this is message 4","this is message 5","this is message 6","this is message 7","this is message 8","this is message 9","this is message 10","this is message 11","this is message 12","this is message 13","this is message 14"]
var messageIndex = 0;

class recentMessageViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    var myString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let indexPath = IndexPath(row: userMessages.count - 1, section: 0)
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (userMessages.count) //counts the messages from userMassages
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{//displays cells
        //UserDefaults.standard.set(userMessages[indexPath.row], forKey: "myName")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = userMessages[indexPath.row]
        return(cell)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {//deletes rows
        if (editingStyle == .delete){
            userMessages.remove(at: indexPath.item) //removes message
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        messageIndex = indexPath.row //cell that was selected
    }
}
