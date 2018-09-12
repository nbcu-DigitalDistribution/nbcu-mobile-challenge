//
//  TextController.swift
//  Questionarie
//
//  Created by Honglin Yi on 9/10/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

import UIKit

class TextController: UIViewController, AnswerController {
    
    //MARK: AnswerController
    func getAnswer() -> String? {
        return textView.getCurrentValue()
    }
    func setData(_ model: AnswerModel) {
        viewModel.addData(question: model.question, unit: model.unit, isNumber: model.isNumber)
    }
    
    //MARK: Layout
    private let viewModel = TextViewModel()
    
    private lazy var textView: InputView = {
        let view = InputView(frame: CGRect(x: 0, y: 10, width: tableView.bounds.width, height: 60))
        return view
    }()
    
    private lazy var tableView:UITableView = {
        let view = UITableView(frame: self.view.bounds)
        view.tableFooterView = UIView(frame: CGRect.zero)
        view.separatorColor = UIColor.clear
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    private func getHeaderView(_ string: String) -> HeaderView {
        let headerV = HeaderView(frame: CGRect(x:0, y:0, width:tableView.bounds.width, height: 0))
        headerV.setData(title: string)
        return headerV
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        tableView.tableHeaderView = getHeaderView(viewModel.question)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        textView.textField.becomeFirstResponder()
    }
   
}

extension TextController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.contentView.addSubview(textView)
        cell.selectionStyle = .none
        textView.changeUnit(unit: viewModel.unit)
        textView.changeKeyboard(isNumber: viewModel.isNumber)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

#if DEBUG
extension TextController {
    
    public func exposeTextView() -> InputView {
        return self.textView
    }
    
    public func exposeTableView() -> UITableView {
        return self.tableView
    }
    
}
#endif
