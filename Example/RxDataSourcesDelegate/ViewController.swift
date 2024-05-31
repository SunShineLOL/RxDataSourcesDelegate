//
//  ViewController.swift
//  RxDataSourcesDelegate
//
//  Created by 443623074@qq.comg on 05/16/2024.
//  Copyright (c) 2024 443623074@qq.comg. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSourcesDelegate

class ViewController: UIViewController {
    
    var disposeBag = DisposeBag()
    
    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.estimatedRowHeight = 50
        view.estimatedSectionFooterHeight = 0
        view.estimatedSectionFooterHeight = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
        view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        view.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIView.appearance().translatesAutoresizingMaskIntoConstraints = false
        self.makeUI()
    }
    
    func makeUI() {
        self.view.backgroundColor = .white
        self.tableView.register(cellWithClass: DemoCell.self)
        self.tableView.register(cellWithClass: DemoSwitchCell.self)
        self.tableView.register(headerFooterViewClassWith: DemoSectionHeaderView.self)
        self.tableView.register(headerFooterViewClassWith: DemoSectionFooterView.self)
        self.bindViewModel()
    }
    
    func bindViewModel() {
        /// bind view model
        /// data
        let dataSource = RxTableViewSectionedDelegateReloadDataSource<DemoSection> { (sources, tableView, indexPath, item) -> UITableViewCell in
            switch item {
            case .content(let model):
                let cell = tableView.dequeueReusableCell(withClass: DemoCell.self)
                cell.bindViewModel(model: model)
                return cell
            case .boolean(let model):
                let cell = tableView.dequeueReusableCell(withClass: DemoSwitchCell.self)
                cell.bindViewModel(model: model)
                return cell
            }
        } configureHeaderView: { (sources, tableView, sectionIndex, section) -> UIView in
            let view = tableView.dequeueReusableHeaderFooterView(withClass: DemoSectionHeaderView.self)
            view.bindViewModel(index: sectionIndex)
            return view
        } configureHeaderViewHeight: { (sources, tableView, sectionIndex, section) -> CGFloat in
            return 80
        } configureFooterView: { (sources, tableView, sectionIndex, section) -> UIView in
            let view = tableView.dequeueReusableHeaderFooterView(withClass: DemoSectionFooterView.self)
            view.bindViewModel(index: sectionIndex)
            return view
        } configureFooterViewHeight: { (sources, tableView, sectionIndex, section) -> CGFloat in
            40
        }
        // 手动设置tableView delegate
        self.tableView.delegate = dataSource
        self.createData().bind(to: self.tableView.rx.items(dataSource: dataSource)).disposed(by: self.disposeBag)
    }
}
/// crate demo data
extension ViewController {
    
    private func createData() -> Observable<[DemoSection]> {
        let contentModels = [DemoContent(content: "Hello GPT-4o"),
                             DemoContent(content: "We’re announcing GPT-4o, our new flagship model that can reason across audio, vision, and text in real time.")]
        let switcModels = [DemoSwitch(isSubscription: false),
                           DemoSwitch(isSubscription: true),
                           DemoSwitch(isSubscription: false)]
        let contentCellVieModels = contentModels.map({DemoContentCellViewModel(model: $0)})
        let switcCellViewModels = switcModels.map({DemoSwitchCellViewModel(model: $0)})
        let contentItems = contentCellVieModels.map({DemoSectionItem.content($0)})
        let switchItem = switcCellViewModels.map({DemoSectionItem.boolean($0)})
        let conetntSections = DemoSection(items: contentItems)
        let switchSections = DemoSection(items: switchItem)
        return Observable.just([conetntSections, switchSections])
    }
}

