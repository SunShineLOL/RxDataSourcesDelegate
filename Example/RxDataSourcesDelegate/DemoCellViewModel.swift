//
//  DemoCellViewModel.swift
//  RxDataSourcesDelegate_Example
//
//  Created by czn on 2024/5/16.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import Foundation
import RxDataSources
import RxCocoa

struct DemoSection {
    var items: [DemoSectionItem]
}

enum DemoSectionItem {
    case content(_ item: DemoContentCellViewModel)
    case boolean(_ item: DemoSwitchCellViewModel)
}

extension DemoSection: SectionModelType {
    typealias Item = DemoSectionItem
    
    init(original: DemoSection, items: [DemoSectionItem]) {
        self.init(items: items)
    }
}

enum DemoCellType {
    case content
    case boolean
    var title: String {
        switch self {
        case .content: "Chat GPT4o Descend"
        case .boolean: "Subscription Chat GPT4o"
        }
    }
}

struct DemoContent {
    var title: String?
    var content: String?
    var type: DemoCellType?
}

struct DemoSwitch {
    var title: String?
    var isSubscription: Bool?
    var type: DemoCellType?
}


struct DemoContentCellViewModel {
    let name: Driver<String>
    let value: BehaviorRelay<String>
    let type: BehaviorRelay<DemoCellType>
    let model: DemoContent
    init(model: DemoContent) {
        self.model = model
        self.name = Driver.just(model.title ?? "")
        self.value = BehaviorRelay(value: model.content ?? "")
        self.type = BehaviorRelay(value: model.type ?? .content)
    }
}

struct DemoSwitchCellViewModel {
    let name: Driver<String>
    let value: BehaviorRelay<Bool>
    let type: BehaviorRelay<DemoCellType>
    let model: DemoSwitch
    init(model: DemoSwitch) {
        self.model = model
        self.name = Driver.just(model.title ?? "")
        self.value = BehaviorRelay(value: model.isSubscription ?? false)
        self.type = BehaviorRelay(value: model.type ?? .boolean)
    }
}
