//
//  Todo.swift
//  MVPPractice
//
//  Created by TAIGA ITO on 2024/11/08.
//

import Foundation
import RealmSwift

class Todo: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var title: String = ""
    @objc dynamic var isDone: Bool = false
    override static func primaryKey() -> String? {
        "id"
    }
}
