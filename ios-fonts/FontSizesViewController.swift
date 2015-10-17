//
//  FontSizesViewController.swift
//  ios-fonts
//
//  Created by Xiao Lu on 10/16/15.
//  Copyright © 2015 Xiao Lu. All rights reserved.
//

import UIKit

class FontSizesViewController: UITableViewController {
    
    var font: UIFont!
    private var pointSizes: [CGFloat] {
        struct Constants {
            static let pointSizes: [CGFloat] = [
                9, 10, 11, 12, 13, 14, 18, 24, 36, 48, 64, 72, 86, 144]
        }
        
        return Constants.pointSizes
    }
    
    private let cellIdentifier = "FontNameAndSize"
    

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pointSizes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)

        cell.textLabel?.font = fontForDisplay(atIndexPath: indexPath)
        cell.textLabel?.text = font.fontName
        cell.detailTextLabel?.text = "\(pointSizes[indexPath.row]) point"
        
        return cell
    }
    
    // MARK: - Helper methods
    func fontForDisplay(atIndexPath indexPath: NSIndexPath) -> UIFont {
        let pointSize = pointSizes[indexPath.row]
        return font.fontWithSize(pointSize)
    }

}
