//
//  Onboarding.swift
//  AeTrapp
//
//  Created by Renan Matias on 03/08/17.
//  Copyright © 2017 Renan Matias. All rights reserved.
//

import UIKit

class Onboarding: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    lazy var onboardingArr: [UIViewController] = {
        return [self.OnboardingInstance(name: "01Onboarding"),
                self.OnboardingInstance(name: "02Onboarding"),
                self.OnboardingInstance(name: "03Onboarding"),
                self.OnboardingInstance(name: "04Onboarding")]
    }()
    
    private func OnboardingInstance(name: String) -> UIViewController {
        return UIStoryboard(name: "Onboarding", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
        if let firstOnboarding = onboardingArr.first {
            setViewControllers([firstOnboarding], direction: .forward, animated: false , completion: nil)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = onboardingArr.index(of: viewController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil // onboardingArr.last
        }
        
        guard onboardingArr.count > previousIndex else {
            return nil
        }
        
        return onboardingArr[previousIndex]
        
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = onboardingArr.index(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < onboardingArr.count else {
            return nil
        }
        
        guard onboardingArr.count > nextIndex else {
            return nil
        }
        
        return onboardingArr[nextIndex]
        
    }

    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return onboardingArr.count
    }

    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = onboardingArr.index(of: firstViewController) else {
            return 0
        }
        
        return firstViewControllerIndex
        
    }
}
