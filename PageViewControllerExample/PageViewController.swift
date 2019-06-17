//
//  PageViewController.swift
//  PageViewControllerExample
//
//  Created by CuongVX-D1 on 6/17/19.
//  Copyright © 2019 CuongVX-D1. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
        
    lazy var viewControllerList: [UIViewController] = {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let vcOne = storyBoard.instantiateViewController(withIdentifier: "vcOne")
        let vcTwo = storyBoard.instantiateViewController(withIdentifier: "vcTwo")
        let vcThree = storyBoard.instantiateViewController(withIdentifier: "vcThree")
        let vcFour = storyBoard.instantiateViewController(withIdentifier: "vcFour")
        let vcFive = storyBoard.instantiateViewController(withIdentifier: "vcFive")
        
        return [vcOne, vcTwo, vcThree, vcFour, vcFive]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        
        setViewControllers([viewControllerList[0]],
                           direction: .forward,
                           animated: true,
                           completion: nil)
    }
    
    @IBAction func deleteAction(_ sender: Any) {
        
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let currentIndex = viewControllerList.firstIndex(of: viewController) ?? 0
        guard currentIndex > 0 else { return nil }
        return viewControllerList[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let currentIndex = viewControllerList.firstIndex(of: viewController) ?? 0
        guard currentIndex < viewControllerList.count - 1 else { return nil }
        return viewControllerList[currentIndex + 1]
    }
}
