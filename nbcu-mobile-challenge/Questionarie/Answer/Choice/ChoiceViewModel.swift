//
//  ChoiceViewModel2.swift
//  Questionarie
//
//  Created by Honglin Yi on 9/6/18.
//  Copyright © 2018 henryyi. All rights reserved.
//

import Foundation
import UIKit


public class ChoiceViewModel: NSObject {
    
    var items = [ChoiceViewModelItem]()
    
    //MARK: Question Header
    var question: String = ""
    
    public func reloadTableHeaderView() {
        guard let tableView = tableView else { return }
        let headerV = HeaderView(frame: CGRect(x:0, y:0, width:tableView.bounds.width, height: 0))
        headerV.setData(title: question)
        tableView.tableHeaderView = headerV
    }
    
    //MARK: Init Methods
    weak var tableView: UITableView?

    convenience init(_ tableView: UITableView) {
        self.init()
        self.tableView = tableView
    }
    
    public func addItem(title: String, subTitles: [String]) {
        let item = ChoiceViewModelItem(title: title, subTitles: subTitles)
        self.items.append(item)
    }
    
    public func addQuestion(title: String) {
        self.question = title
    }
    
    func reloadSection(_ section: Int) {
        tableView?.beginUpdates()
        tableView?.reloadSections([section], with: .fade)
        tableView?.endUpdates()
    }
    
    //MARK: User Selected Options
    public func getCurrentValue() -> String? {
        guard let indexPath = tableView?.indexPathForSelectedRow else {
            return nil
        }
        let section = indexPath.section
        let row = indexPath.row
        if row == 0 {
            return items[section].title
        }
        return items[section].subTitles[row - 1]
    }
    
    var selectTitle: ((_ title: String) -> Void)?
    
    
    //MARK: For Tableview Delegates
    
    func getSections() -> Int {
        return items.count
    }
    
    func getRows(At section: Int) -> Int {
        return items[section].rowCount
    }
    
    func getCellFor(section: Int, row: Int) -> UITableViewCell {
        if row > 0 {
            let subTitle = items[section].subTitles[row-1]
            guard let cell:SubTitleCell = SubTitleCell.fromNib()
                else { return UITableViewCell() }
            cell.setData(title: subTitle)
            return cell
        }
        
        let title = items[section].title
        guard let cell:TitleCell = TitleCell.fromNib()
            else { return UITableViewCell() }
        cell.setData(title: title)
        return cell
    }
    
    func selectCell(section: Int, row: Int) {
        if row == 0 && !items[section].isCollapsible {
            selectTitle?(items[section].title)
        }
        if row == 0 && items[section].isCollapsible {
            items[section].isCollapsed = !items[section].isCollapsed
            reloadSection(section)
        }
        if row > 0 {
            selectTitle?(items[section].subTitles[row - 1])
        }
    }
    
}



