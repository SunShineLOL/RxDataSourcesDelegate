//
//  DemoSectionFooterView.swift
//  RxDataSourcesDelegate_Example
//
//  Created by czn on 2024/5/17.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import UIKit

class DemoSectionFooterView: TableViewHeaderFooterView {

    lazy var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.font = .boldSystemFont(ofSize: 20)
        view.textAlignment = .left
        return view
    }()

    override func makeUI() {
        super.makeUI()
        self.stackView.addArrangedSubview(label)
    }
    
    func bindViewModel(index: Int) {
        label.text = "FooterView:\(index)"
    }
}
