//
//  Model.swift
//  MVPPractice
//
//  Created by TAIGA ITO on 2024/11/08.
//

import Foundation
import RealmSwift

class Model {
    private let realm = try! Realm()
    func addTodo(_ todo: Todo) {
        do {
            try realm.write {
                realm.add(todo)
            }
        } catch {
            print("Error adding todo: \(error)")
        }
    }
    func getTodos() -> [Todo] {
        let res = realm.objects(Todo.self)
        return Array(res)
    }
    func deleteTodo(_ todo: Todo) {
        do {
            try realm.write {
                realm.delete(todo)
            }
        } catch {
            print("Error deleting todo: \(error)")
        }
    }
    func updateTitle(_ todo: Todo, title: String) {
        do {
            try realm.write {
                todo.title = title
            }
        } catch {
            print("Error updating title: \(error)")
        }
    }
    func updateIsDone(_ todo: Todo, isDone: Bool) {
        do {
            try realm.write {
                todo.isDone = isDone
            }
        } catch {
            print("Error updating isDone: \(error)")
        }
    }
}
