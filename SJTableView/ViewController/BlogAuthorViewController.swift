//
//  ViewController.swift
//  SJTableView
//
//  Created by Jain Sakshi on 28/12/16.
//  Copyright © 2016 SnapDeal. All rights reserved.
//

import UIKit

class BlogAuthorViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let blogsArray = [
                      ["name": "Ray Wenderlich", "url": "https://www.raywenderlich.com"],
                      ["name":"NSHipster","url":"http://nshipster.com/"],
                      ["name":"Jameson Quav","url":"http://jamesonquave.com/"]
                    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "Blog Authors"
        //When you register cell, no need to loadTableViewCellFromNib()
        //self.tableView.register(BlogTableCell.self, forCellReuseIdentifier: BLOG_TABLE_CELL_IDENTIFIER)
      
      
    }
    
    //MARK: Table View Data source and delegate method
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blogsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var blogCell = tableView.dequeueReusableCell(withIdentifier: BLOG_TABLE_CELL_IDENTIFIER) as? BlogTableCell
        
        if (blogCell == nil) {
            blogCell = (BlogTableCell.loadTableViewCellFromNib() as! BlogTableCell)
        }
        
        let blogDict = blogsArray[indexPath.row];
        blogCell?.loadCellWithBlogData(blogData: blogDict)
        
        return blogCell!
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Redirect to blog detail page
        self.performSegue(withIdentifier: DISPLAY_BLOG_AUTHOR_TO_BLOG_COLLECTION_SCREEN, sender: blogsArray[indexPath.row])
    }
    
    //MARK:  Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var blogListCollectionVC: BlogListCollectionController = segue.destination as! BlogListCollectionController;
        blogData = sender as! Dictionary<String, String>;
    }
    
}

