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
    
    var authorsArray = [AuthorModel] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        self.navigationItem.title = "Blog Authors"
        
        //When you register cell, no need to loadTableViewCellFromNib()
        //self.tableView.register(BlogTableCell.self, forCellReuseIdentifier: BLOG_TABLE_CELL_IDENTIFIER)
      
        self.callBlogListWebService()
      
    }
    
    //MARK: Table View Data source and delegate method
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return authorsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var authorCell = tableView.dequeueReusableCell(withIdentifier: AUTHOR_TABLE_CELL_IDENTIFIER) as? AuthorTableCell
        
        if (authorCell == nil) {
            authorCell = (AuthorTableCell.loadTableViewCellFromNib() as! AuthorTableCell)
        }
        
        let authorData = authorsArray[indexPath.row];
        authorCell?.loadCellWithAuthorData(authorData)
        
        return authorCell!
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Redirect to blog detail page
        self.performSegue(withIdentifier: DISPLAY_BLOG_AUTHOR_TO_BLOG_COLLECTION_SCREEN, sender: authorsArray[indexPath.row])
    }
    
    //MARK:  Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        blogData = sender as! Dictionary<String, String>;
    }
    
    // MARK: Web Service
    func callBlogListWebService() -> Void {
        
        let serviceObj: AuthorListWebService = AuthorListWebService()
        serviceObj.executeGetRequest(completion:{
            (response: Any?, error : Error?) in
            
            if (response != nil && error == nil) {
                self.authorsArray = response as! [AuthorModel]
                self.tableView.reloadData()
            }
        })
    }
    
}

