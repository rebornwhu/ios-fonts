//
//  RootViewController.swift
//  ios-fonts
//
//  Created by Xiao Lu on 10/13/15.
//  Copyright © 2015 Xiao Lu. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {
    private var familyNames: [String]!
    private var cellPointSize: CGFloat!
    private var favoritesList: FavoritesList!
    private let familyCell = "FamilyName"
    private let favoritesCell = "Favorites"

    override func viewDidLoad() {
        super.viewDidLoad()

        familyNames = UIFont.familyNames().sort() as [String]
        let preferredTableViewFont = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        cellPointSize = preferredTableViewFont.pointSize
        favoritesList = FavoritesList.sharedfavoritesList
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return favoritesList.favorites.isEmpty ? 1 : 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? familyNames.count : 1
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "All Font Families" : "My Favorite Fonts"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier(familyCell, forIndexPath: indexPath)
            cell.textLabel?.font = fontForDisplay(atIndexPath: indexPath)
            cell.textLabel?.text = familyNames[indexPath.row]
            cell.detailTextLabel?.text = familyNames[indexPath.row]
            return cell
        }
        else {
            return tableView.dequeueReusableCellWithIdentifier(favoritesCell, forIndexPath: indexPath)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func fontForDisplay(atIndexPath indexPath: NSIndexPath) -> UIFont? {
        if indexPath.section == 0 {
            let familyName = familyNames[indexPath.row]
            let fontName = UIFont.fontNamesForFamilyName(familyName).first
            
            if fontName != nil {
                return UIFont(name: fontName!, size: cellPointSize)
            }
            else {
                return nil
            }
        }
        else {
            return nil
        }
    }
    
    // MARK: Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPath = tableView.indexPathForCell(sender as! UITableViewCell!)
        let listVC = segue.destinationViewController as! FontListViewController
        
        if indexPath!.section == 0 {
            let familyName = familyNames[indexPath!.row]
            listVC.fontNames = (UIFont.fontNamesForFamilyName(familyName) as [String]).sort()
            listVC.navigationItem.title = familyName
            listVC.showsFavorites = false
        }
        else {
            listVC.fontNames = favoritesList.favorites
            listVC.navigationItem.title = "Favorites"
            listVC.showsFavorites = true
        }
    }

}
