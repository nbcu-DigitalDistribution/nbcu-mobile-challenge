//
//  SurveyC+SurveyView.swift
//  Questionarie
//
//  Created by Honglin Yi on 9/11/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

import UIKit

protocol SurveyView: class {
    func transitTo(controller i: Int)
    func addNew(controller: UIViewController)
    func addNewChildController(_ controller: UIViewController)
    func removeChildController(_ viewContoller: UIViewController)
    func presentAlertView(_ title: String, _ message: String, isDefault: Bool, more actions: [UIAlertAction])
    func setProgressView(value: Int?, max: Int?)
}

extension SurveyController: SurveyView {
    
    func transitTo(controller i: Int) {
        guard i < controllers.count else { return }
        addNewChildController(controllers[i])
    }
    
    func addNew(controller: UIViewController) {
        addNewChildController(controller)
        controllers.append(controller)
    }
    
    func addNewChildController(_ controller: UIViewController) {
        self.childViewControllers.forEach { removeChildController($0) }
        self.addChildViewController(controller)
        controller.view.frame = contentV.bounds
        self.contentV.addSubview(controller.view)
    }
    
    func removeChildController(_ viewContoller: UIViewController) {
        viewContoller.willMove(toParentViewController: nil)
        viewContoller.view.removeFromSuperview()
        viewContoller.removeFromParentViewController()
    }
    
    func presentAlertView(_ title: String, _ message: String, isDefault: Bool = true, more actions: [UIAlertAction] = [UIAlertAction]()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        if isDefault {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
                alert.dismiss(animated: true, completion: nil)
            }
        } else {
            actions.forEach { alert.addAction($0) }
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    func setProgressView(value: Int?, max: Int?) {
        progressV.setValueMax(value: value, max: max)
    }
    
}
