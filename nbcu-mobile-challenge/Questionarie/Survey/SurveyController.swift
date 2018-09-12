//
//  SurveyController.swift
//  Questionarie
//
//  Created by Honglin Yi on 9/10/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

import UIKit

class SurveyController: UIViewController, ControlViewDelegate {
    
    //MARK: Layout
    private let top: CGFloat = 90
    private let bottom: CGFloat = 40
    
    public func getFrame(_ xDiff:CGFloat, _ yDiff:CGFloat, _ wDiff:CGFloat,_ hDiff:CGFloat) -> CGRect {
        let width = self.view.bounds.width
        let height = self.view.bounds.height
        let y = yDiff > 0 ? yDiff : height + yDiff
        let h = hDiff > 0 ? hDiff: height + hDiff
        return CGRect(x: 0, y: y, width: width, height: h)
    }
    
    private lazy var controlV: ControlView = {
        let view = ControlView(frame: getFrame(0, -1*bottom, 0, bottom))
        view.delegate = self
        view.backgroundColor = .white
        return view
    }()
    lazy var progressV: ProgressView = {
        guard let view: ProgressView = ProgressView.fromNib() else {
                return ProgressView()
        }
        view.frame = getFrame(0, 10, 0, top - 10)
        return view
    }()
    
    lazy var contentV: UIView = {
        let view = UIView(frame: getFrame(0, top, 0, -1*bottom - top))
        return view
    }()
    
    
    //MARK: SurveyView Presenter
    var presenter: SurveyPresenter?
    var controllers = [UIViewController]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(contentV)
        self.view.addSubview(controlV)
        self.view.addSubview(progressV)
        self.view.backgroundColor = UIColor.white
        presenter = SurveyPresenter()
        presenter?.view = self
        presenter?.setInitViewState()
    }
    
    //MARK: ControlView Delegate
    func clickOnButton(_ isNext: Bool) {
        guard isNext else {
            presenter?.moveBackward()
            return
        }
        presenter?.moveForward()
    }
    
}
