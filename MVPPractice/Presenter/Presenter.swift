//
//  Presenter.swift
//  MVPPractice
//
//  Created by TAIGA ITO on 2024/11/08.
//

import Foundation

protocol PresenterProtocol: AnyObject {
    var todosCount: Int { get }
    func itemTitle(at index: Int) -> String
    func itemIsDone(status: Bool) -> String
    func addTodo(title: String)
}

class Presenter: ObservableObject {
    var delegate: PresenterProtocol?
    let model = Model()
    @Published var todos: [Todo] = []
    init() {
        todos = model.getTodos()
    }
}

extension Presenter: PresenterProtocol {
    var todosCount: Int {
        todos.count
    }
    func itemTitle(at index: Int) -> String {
        todos[index].title
    }
    func itemIsDone(status: Bool) -> String {
        status ? TodoStatus.done.rawValue : TodoStatus.undone.rawValue
    }
    func addTodo(title: String) {
        if title.isEmpty {
            return
        }
        let todo = Todo()
        todo.title = title
        model.addTodo(todo)
        todos = model.getTodos()
    }
}
