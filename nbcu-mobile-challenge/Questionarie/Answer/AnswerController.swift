//
//  AnswerController.swift
//  Questionarie
//
//  Created by Honglin Yi on 9/10/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

import UIKit

protocol AnswerController {
    func getAnswer() -> String?
    func setData(_ model: AnswerModel)
}




