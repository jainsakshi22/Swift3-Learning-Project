//
//  ViewController.swift
//  SJTableView
//
//  Created by Jain Sakshi on 28/12/16.
//  Copyright © 2016 SnapDeal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let blogsArray = [
                      ["name": "Ray Wenderlich", "url": "https://www.raywenderlich.com"],
                      ["name":"NSHipster","url":"http://nshipster.com/"],
                      ["name":"Jameson Quav","url":"http://jamesonquave.com/"]
                    ]
    let blogCellIdentifier = "BlogTableCellIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "Blog List"
        //When you register cell, no need to loadTableViewCellFromNib()
        //self.tableView.register(BlogTableCell.self, forCellReuseIdentifier: blogCellIdentifier)
      
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blogsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var blogCell = tableView.dequeueReusableCell(withIdentifier: blogCellIdentifier) as? BlogTableCell;
        
        if (blogCell == nil) {
            blogCell = (BlogTableCell.loadTableViewCellFromNib() as! BlogTableCell);
        }
        
        let blogDict = blogsArray[indexPath.row];
        blogCell?.loadCellWithBlogData(blogData: blogDict)
        
        return blogCell!
    
    }
}

