//
//  CustomTabBarViewController.swift
//  Assignment2
//
//  Created by ALEX RUTH on 11/05/2017.
//  Copyright © 2017 ALEX RUTH. All rights reserved.
//

import UIKit

class CustomTabBarViewController: UITabBarController, CustomTabBarDataSource, CustomTabBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isHidden = true
        let customTabBar = CustomTabBar(frame: self.tabBar.frame)
        self.view.addSubview(customTabBar)
        customTabBar.datasource = self
        customTabBar.setup()
        customTabBar.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tabBarItemsInCustomTabBar(tabBarView: CustomTabBar) -> [UITabBarItem] {
        return tabBar.items!
    }
    func didSelectViewController(tabBarView: CustomTabBar, atIndex index: Int) {
        self.selectedIndex = index
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
