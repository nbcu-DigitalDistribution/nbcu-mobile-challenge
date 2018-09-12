//
//  ChoiceController.swift
//  Questionarie
//
//  Created by Honglin Yi on 9/6/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

import UIKit

class ChoiceController: UIViewController, AnswerController {
    
    //MARK: AnswerController
    func getAnswer() -> String? {
        return viewModel.getCurrentValue()
    }
    
    func setData(_ model: AnswerModel) {
        viewModel.addQuestion(title: model.question)
        model.dic.forEach {
            viewModel.addItem(title: $0.key, subTitles: $0.value)
        }
    }
    
    
    //MARK: TableView
    private var viewModel = ChoiceViewModel()
    
    private lazy var tableView:UITableView = {
        let view = UITableView(frame: self.view.bounds)
        view.tableFooterView = UIView(frame: CGRect.zero)
        view.estimatedRowHeight = 35.0
        view.rowHeight = UITableViewAutomaticDimension
        view.dataSource = self
        view.delegate = self
        return view
    }()

    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableView)
        viewModel.tableView = self.tableView
        viewModel.reloadTableHeaderView()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.frame = self.view.bounds
    }
    
}

extension ChoiceController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getRows(At: section)
    }
    public func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.getSections()
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.getCellFor(section: indexPath.section, row: indexPath.row)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectCell(section: indexPath.section, row: indexPath.row)
    }
    
}
