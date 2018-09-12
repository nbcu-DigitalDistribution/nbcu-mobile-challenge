//
//  ChoiceViewModelTests.swift
//  nbcu-mobile-challengeTests
//
//  Created by Honglin Yi on 9/11/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

import XCTest
@testable import nbcu_mobile_challenge

class ChoiceViewModelTests: XCTestCase {
    var viewModel: ChoiceViewModel!
    var tableView: UITableView!
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 375, height: 600))
        viewModel = ChoiceViewModel(tableView)
        viewModel.addQuestion(title: "......")
        viewModel.addItem(title: "Yes", subTitles: ["China", "US", "Canada"])
        viewModel.addItem(title: "No", subTitles: [])
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    
    func testDisplayRows() {
        XCTAssert(viewModel.getSections() == 2, "Wrong at first")
        XCTAssert(viewModel.getRows(At: 0) == 1, "Shouldn't unfold")
        XCTAssert(tableView.numberOfSections == 2, "Tableview is wrong")
        
        viewModel.selectCell(section: 0, row: 0)
        XCTAssert(viewModel.items[0].isCollapsed == true, "Viewmodel goes wrong")
        XCTAssert(tableView.numberOfRows(inSection: 0) == 4, "Tableview didn't unfold")
        
        XCTAssert(viewModel.getCellFor(section: 0, row: 0) as? TitleCell != nil, "Wrong cell class")
    }
    
    func testHeaderView() {
        viewModel.reloadTableHeaderView()
        XCTAssert(tableView.tableHeaderView != nil, "No header view")
        XCTAssert((tableView.tableHeaderView?.bounds.height)! > CGFloat(20), "No header view")
    }
    
}

extension ChoiceViewModelTests: UITableViewDelegate, UITableViewDataSource {
    
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
