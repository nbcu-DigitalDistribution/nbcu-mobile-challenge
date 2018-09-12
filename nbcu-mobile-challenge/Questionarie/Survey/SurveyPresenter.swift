//
//  SurveyPresenter.swift
//  Questionarie
//
//  Created by Honglin Yi on 9/10/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

import UIKit

class SurveyPresenter: NSObject {
    public weak var view: SurveyView?
    private var collector = SurveyCollector()
    
    private var index = 0
    private var controllers = [AnswerController]()
    private var models = [AnswerModel]()
    
    override init() {
        super.init()
        
         let model1 = AnswerModel(question: "How many hours do you watch videos in a week on Netflix/Amazon/Hulu/Etc?", isNumber: true, unit: "Hours", resultType: .Number)
        
        let model2 = AnswerModel(question: "How many devices you typically have at home that you want to watch videos simultaneously?", isNumber: true, unit: "Devices", resultType: .Number)
        
        let model3 = AnswerModel(question: "Do you like to have a phone service at home?", dic: ["Yes":[], "No":[]], isNumber: false, unit: "", resultType: .String)

        let model4 = AnswerModel(question: "Do you like to make international calls using your home phone?", dic: ["Yes":["Asia", "Europe", "Rest of the World", "Word"], "No":[]], isNumber: false, unit: "", resultType: .String)
        models.append(model1)
        models.append(model2)
        models.append(model3)
        models.append(model4)
    }
    
    func setInitViewState() {
        addFirstController()
        view?.setProgressView(value: index+1, max: models.count)
    }
    
    func moveForward() {
        guard index < controllers.count else { return }
        
        guard let answer = controllers[index].getAnswer(), !answer.isEmpty else {
            view?.presentAlertView("Please finish the answer", "Thanks >_<", isDefault: true, more: [UIAlertAction]())
            return
        }
        
        collector.modifyResult(At: index, result: answer, resultType: models[index].resultType)
        
        guard index < models.count - 1 else {
            addSubmitAlert()
            return
        }
        
        index = index + 1
        view?.setProgressView(value: index+1, max: models.count)
        transitToNext(view)
    }
    
    func addFirstController() {
        guard index == 0 else { return }
        guard controllers.count == 0 else { return }
        let (controller, aController) = models[index].getController()
        view?.addNew(controller: controller)
        controllers.append(aController)
    }
    
    func moveBackward() {
        guard index > 0 else {
            view?.presentAlertView("This is the begining", "Sorry ~_~", isDefault: true, more: [UIAlertAction]())
            return
        }
        index = index - 1
        view?.setProgressView(value: index+1, max: models.count)
        view?.transitTo(controller: index)
    }
    
    private func addSubmitAlert() {
        var actions = [UIAlertAction]()
        let yesAction = UIAlertAction(title: "Yes", style: .default) {
            _ in
            print(self.collector.toString())
        }
        let noAction = UIAlertAction(title: "No", style: .destructive, handler: nil)
        actions.append(yesAction)
        actions.append(noAction)
        self.view?.presentAlertView("Are you sure to submit the survey?", "",isDefault: false, more: actions)
    }
    
    private func transitToNext(_ view: SurveyView?) {
        guard index < controllers.count - 1 else {
            let (controller, aController) = models[index].getController()
            view?.addNew(controller: controller)
            controllers.append(aController)
            return
        }
        view?.transitTo(controller: index)
    }

}

#if DEBUG
extension SurveyPresenter {
    
    public func exposeProperties() -> (Int, [AnswerController], [AnswerModel]) {
        return (self.index, self.controllers, self.models)
    }
    
}
#endif

