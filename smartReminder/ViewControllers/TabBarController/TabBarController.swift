//
//  TabBarController.swift
//  smartReminder
//
//  Created by Mingyong Zhu on 8/5/22.
//

import UIKit

class TabBarController: UITabBarController {
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let alarmViewController = AlarmViewController()
        let noteViewController = NoteViewController()
        viewControllers = [alarmViewController, noteViewController]
        selectedIndex = 0
    }

}
