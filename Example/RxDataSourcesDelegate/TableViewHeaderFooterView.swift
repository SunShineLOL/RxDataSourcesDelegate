//
//  TableViewHeaderFooterView.swift
//  RxDataSourcesDelegate_Example
//
//  Created by czn on 2024/5/17.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import UIKit
import RxSwift

class TableViewHeaderFooterView: UITableViewHeaderFooterView {

    var disposeBag = DisposeBag()
    
    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .fill
        self.contentView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 15).isActive = true
        view.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -15).isActive = true
        view.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15).isActive = true
        view.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -15).isActive = true
        return view
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func makeUI() {
        
    }

}
