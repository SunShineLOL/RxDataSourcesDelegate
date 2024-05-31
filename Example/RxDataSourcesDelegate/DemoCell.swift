//
//  DemoCell.swift
//  RxDataSourcesDelegate_Example
//
//  Created by czn on 2024/5/16.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import UIKit
import RxCocoa

class DemoCell: TableViewCell {
    
    lazy var cellContentView: DemoCellContentView = {
        let view = DemoCellContentView(type: .content)
        return view
    }()
    
    override func makeUI() {
        super.makeUI()
        self.stackView.addArrangedSubview(cellContentView)
    }
    
    func bindViewModel(model: DemoContentCellViewModel) {
        model.name.drive(self.cellContentView.title.rx.text).disposed(by: disposeBag)
        model.value.bind(to: self.cellContentView.title.rx.text).disposed(by: disposeBag)
    }
}

class DemoSwitchCell: TableViewCell {
    
    lazy var cellContentView: DemoCellContentView = {
        let view = DemoCellContentView(type: .boolean)
        return view
    }()
    
    override func makeUI() {
        super.makeUI()
        self.stackView.addArrangedSubview(cellContentView)
    }
    
    func bindViewModel(model: DemoSwitchCellViewModel) {
        model.name.drive(self.cellContentView.title.rx.text).disposed(by: disposeBag)
        model.value.bind(to: self.cellContentView.switcView.rx.isOn).disposed(by: disposeBag)
    }
}
