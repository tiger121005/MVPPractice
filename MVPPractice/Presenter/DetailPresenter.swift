//
//  DetailPresenter.swift
//  MVPPractice
//
//  Created by TAIGA ITO on 2024/11/08.
//

import Foundation

protocol DetailPresenterProtocol: AnyObject {
    var title: String { get }
    var isDone: Bool { get }
    func updateTitle(_ title: String)
    func updateSwitch(_ isDone: Bool)
    func deleteTodo()
}

class DetailPresenter {
    var todo: Todo
    let model = Model()
    let mainPresenter = Presenter()
    init(todo: Todo) {
        self.todo = todo
    }
}

extension DetailPresenter: DetailPresenterProtocol {
    var title: String {
        todo.title
    }
    var isDone: Bool {
        todo.isDone
    }
    func updateTitle(_ title: String) {
        mainPresenter.todos.first { $0.id == todo.id }?.title = title
        model.updateTitle(todo, title: title)
    }
    func updateSwitch(_ isDone: Bool) {
        mainPresenter.todos.first { $0.id == todo.id }?.isDone = isDone
        model.updateIsDone(todo, isDone: isDone)
    }
    func deleteTodo() {
        mainPresenter.todos.removeAll { $0.id == todo.id }
        model.deleteTodo(todo)
    }
}
