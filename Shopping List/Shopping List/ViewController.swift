//
//  ViewController.swift
//  Shopping List
//
//  Created by Kedar Rao on 10/3/17.
//  Copyright © 2017 Kedar Rao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listItem", for: indexPath) as! ListItemCell
        cell.decorate(itemName: listItems[indexPath.row].listItemName, checked: listItems[indexPath.row].checkedItem)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listItems[indexPath.row].checkedItem = !listItems[indexPath.row].checkedItem
        listTableView.reloadData()
    }
    
    @IBAction func addItem(_ sender: UIButton) {
        let alert = UIAlertController(title: "Add an Item", message: "Type the item you want to add", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Apple, Oranges, etc."
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        let submit = UIAlertAction(title: "Submit", style: .default) { (_) in
            let textField = alert.textFields!.first!
            
            if textField.text != "" {
                self.listItems.append((listItemName: textField.text!, checkedItem: false))
            }
            self.listTableView.reloadData()
        }
                
        alert.addAction(cancel)
        alert.addAction(submit)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var listTableView: UITableView!
    
    var listItems: [(listItemName: String, checkedItem: Bool)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        listTableView.delegate = self
        listTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

