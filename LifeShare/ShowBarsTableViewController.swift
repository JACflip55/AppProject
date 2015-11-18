//
//  ShowBarsTableViewController.swift
//  Buzzed
//
//  Created by Alan Guerrero on 10/21/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import UIKit

class ShowBarsTableViewController: UITableViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate  {
    
    var backgroundImage : UIImageView!;
    var barData:NSMutableArray = NSMutableArray()
    var data:DataModel = DataModel()
    
    @IBAction func logoutAction(sender: AnyObject) {
        
        PFUser.logOut()
    }
    
    func loginSetup() {
        
        if (PFUser.currentUser() == nil) {
            //            let loginViewController = PFLogInViewController()
            let loginViewController = LoginViewController()
            loginViewController.delegate = self
            loginViewController.fields = [.UsernameAndPassword, .LogInButton, .PasswordForgotten, .SignUpButton, .Facebook]
            loginViewController.emailAsUsername = true
            loginViewController.signUpController!.delegate = self
            
            self.presentViewController(loginViewController, animated: false, completion: nil)        }
        else{
            presentLoggedInAlert()
        }
    }
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
        presentLoggedInAlert()
    }
    
    func presentLoggedInAlert() {
        let alertController = UIAlertController(title: "You're logged in", message: "Welcome to Buzzed", preferredStyle: .Alert)
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        alertController.addAction(OKAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
        presentLoggedInAlert()
    }
    
    //    @IBAction func logoutAction(sender: AnyObject)
    //    {
    //        PFUser.logOut()
    //        print("You have logged out")
    //        self.loginSetup()
    //
    //    }
    
    //    func loadData()
    //    {
    //        hangOutsData.removeAllObjects()
    //        let findHangOutData:PFQuery = PFQuery(className: "Bars")
    //        findHangOutData.findObjectsInBackgroundWithBlock{(objects: [AnyObject]?, error: NSError?) -> Void in
    //
    //            if error == nil
    //            {
    //                if let myObject = objects{
    //                    for object in myObject{
    //                        let hangOuts:PFObject = object as! PFObject
    //                        self.hangOutsData.addObject(hangOuts)
    //
    //                    }
    //                }
    //                let array:NSArray = self.hangOutsData.reverseObjectEnumerator().allObjects
    //                self.hangOutsData =  NSMutableArray(array: array)
    //
    //                self.tableView.reloadData()
    //            }
    //
    //        }
    //    }
    //
    override func viewDidLoad() {
        
        backgroundImage = UIImageView(image: UIImage(named: "Mojito.jpg"))
        backgroundImage.contentMode = UIViewContentMode.ScaleAspectFill
        self.view.insertSubview(backgroundImage, atIndex: 0)
    }
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //        self.navigationController?.title = "Buzzed"
    //
    //        // Uncomment the following line to preserve selection between presentations
    //        // self.clearsSelectionOnViewWillAppear = false
    //
    //        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    //    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.getCount()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! BarTableViewCell
        
        // Configure the cell...
        
        let bar = data.getBar(indexPath.row)
        
        cell.barName.text! = bar.name
        cell.totalDeals.text! = String(data.getDealCount())
        //cell.pic.image = bar.image
        
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "Show Detail" {
            let secondVC:DescriptionViewController = segue.destinationViewController as! DescriptionViewController
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let bar = data.getBar(indexPath.row)
                
                print(bar.name)
                secondVC.storeName = bar.name
            }
        }
    }
}

