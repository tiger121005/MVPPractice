//
//  ListView.swift
//  MVPPractice
//
//  Created by TAIGA ITO on 2024/11/11.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var presenter = Presenter()
    weak var delegate: ShowDetailDelegate?
    var body: some View {
        VStack {
            ForEach(presenter.todos, id: \.id) { todo in
                Button(action: {
                    delegate?.showDetail(todo: todo)
                }, label: {
                    ListItemView(todo: todo)
                })
            }
            Spacer()
        }
    }
}

struct ListItemView: View {
    var todo: Todo
    @ObservedObject var presenter = Presenter()
    var body: some View {
        VStack {
            VStack {
                Text(todo.title)
                    .foregroundColor(.black)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(presenter.itemIsDone(status: todo.isDone))
                    .foregroundColor(todo.isDone ? .green : .red)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Rectangle()
                    .fill(Color.gray)
                    .frame(maxWidth: .infinity, maxHeight: 1)
            }
        }
        .padding(.vertical, 3)
        .padding(.horizontal, 30)
    }
}
