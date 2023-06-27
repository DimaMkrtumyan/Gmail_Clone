//
//  TabBarController.swift
//  Gmail Clone
//
//  Created by Dmitriy Mkrtumyan on 27.06.23.
//

import UIKit

class TabBarController: UITabBarController {

    func setup() {
        if let tabBarItem1 = self.tabBar.items?[0] {
            tabBarItem1.title = nil
            tabBarItem1.image = UIImage(named: "mailboxIconSelected")?.withRenderingMode(.alwaysOriginal)
            tabBarItem1.selectedImage =
            UIImage(named: "mailboxIconSelected")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        }
        if let tabBarItem2 = self.tabBar.items?[1] {
            tabBarItem2.title = nil
            tabBarItem2.image = UIImage(named: "videoMeetingIcon")?.withRenderingMode(.alwaysOriginal)
            tabBarItem2.selectedImage =
            UIImage(named: "videoMeetingIcon")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        }
        
        tabBar.backgroundImage = UIImage()
        tabBar.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9882352941, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    

}
