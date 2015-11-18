
//
//  DescriptionViewController.swift
//  Buzzed
//
//  Created by Alan Guerrero on 10/21/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var backgroundImage : UIImageView!;
    @IBOutlet var detailName: UILabel!
    var storeName:String = ""

    
    @IBOutlet var tableView: UITableView!
    
    func setUp()
    {
        tableView = UITableView()
    }
    
    @IBAction func addDeal(sender: AnyObject) {
        
        let loginAlert:UIAlertController = UIAlertController(title: "Enter Deal",message: "Please enter the product's name and price",
            preferredStyle: UIAlertControllerStyle.Alert)
        
        loginAlert.addTextFieldWithConfigurationHandler(
            {
                textfield in
                textfield.placeholder = "Product:"
        })
        
        loginAlert.addTextFieldWithConfigurationHandler(
            {
                textfield in
                textfield.placeholder = "Price:"
                textfield.secureTextEntry = false
        })
        
        loginAlert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler:
            {
                alertAction in
                let textFields:NSArray = loginAlert.textFields! as NSArray
                let usernameTextfield:UITextField = textFields.objectAtIndex(0) as! UITextField
                let passwordTextfield:UITextField = textFields.objectAtIndex(1) as! UITextField
                
                if (usernameTextfield.text! != "" && passwordTextfield.text! != "")
                {
                    //check why deal is not being added
                    //data.addDeal(usernameTextfield.text!, price:Int(passwordTextfield.text!)!)
                    data.deals.append(Deals(name: usernameTextfield.text!, price:Float(passwordTextfield.text!)!, barID: (data.getBarFromName(self.storeName).barID)))
                    let alert = UIAlertView()
                    alert.title = "Thank You"
                    alert.message = "You have successfully added a deal to \(self.storeName)"
                    alert.addButtonWithTitle("Ok")
                    alert.show()
                    
                    print("Thank You, You have successfully created a deal")
                    self.tableView.reloadData()
                    
                }
                else
                {
                    let alert = UIAlertView()
                    alert.title = "Warning"
                    alert.message = "Missing Entries"
                    alert.addButtonWithTitle("Ok")
                    alert.show()
                    
                    print("Missing Entries")
                    self.presentViewController(loginAlert, animated: true, completion: nil)
                }
        }))
        
        self.presentViewController(loginAlert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        
        backgroundImage = UIImageView(image: UIImage(named: "Mojito.jpg"))
        backgroundImage.contentMode = UIViewContentMode.ScaleAspectFill
        self.view.insertSubview(backgroundImage, atIndex: 0)
        detailName.text! = storeName
//        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell2")
        
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool)
    {
        self.loadData()
    }
    
    func loadData()
    {
        self.tableView.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return data.getDealCountBarID(data.getBarFromName(self.storeName).barID)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell2", forIndexPath: indexPath) as! DealsTableViewCell
        //let deal = data.getDeal(indexPath.row)
        let deal = data.getNextDealBarID(indexPath.row, barID: data.getBarFromName(storeName).barID)
        
        cell.dealName.text! = deal.name
        cell.dealPrice.text! = String(deal.price)
        //compute rating percent
        //let ratingPercent = 100
        //let ratingPercent = (100*deal.upvotes/(deal.upvotes+deal.downvotes))
        //cell.rating.text! = "\(ratingPercent)%"
        return cell
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
