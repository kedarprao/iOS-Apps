//
//  ListViewController.swift
//  About  Me
//
//  Created by Kedar Rao on 9/19/17.
//  Copyright © 2017 Kedar Rao. All rights reserved.
//

import UIKit
import SafariServices

class ListViewController: UITableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
            //show our resume
            let resume = URL(string: "http://www.google.com")!
            let safari = SFSafariViewController(url: resume)
            
            self.present(safari, animated: true, completion: nil)
        }
    }
}
