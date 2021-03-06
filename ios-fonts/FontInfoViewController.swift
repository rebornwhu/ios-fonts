//
//  FontInfoViewController.swift
//  ios-fonts
//
//  Created by Xiao Lu on 10/16/15.
//  Copyright © 2015 Xiao Lu. All rights reserved.
//

import UIKit

class FontInfoViewController: UIViewController {
    var font: UIFont!
    var favorite: Bool = false
    
    @IBOutlet weak var fontSampleLabel: UILabel!
    @IBOutlet weak var fontSizesSlider: UISlider!
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBOutlet weak var favoriteSwitch: UISwitch!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fontSampleLabel.font = font
        fontSampleLabel.text = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz 0123456789"
        fontSizesSlider.value = Float(font.pointSize)
        fontSizeLabel.text = "\(Int(font.pointSize))"
        favoriteSwitch.on = favorite
    }
    
    @IBAction func slideFontSize(slider: UISlider) {
        let newSize = roundf(slider.value)
        fontSampleLabel.font = font.fontWithSize(CGFloat(newSize))
        fontSizeLabel.text = "\(Int(newSize))"
    }
    
    @IBAction func toggleFavorite(sender: UISwitch) {
        let favoritesList = FavoritesList.sharedfavoritesList
        if sender.on {
            favoritesList.addFavorite(font.fontName)
        }
        else {
            favoritesList.removeFavorite(font.fontName)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
