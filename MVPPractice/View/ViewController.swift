//
//  ViewController.swift
//  MVPPractice
//
//  Created by TAIGA ITO on 2024/11/08.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    @IBOutlet private var listParentView: UIView!
    @IBOutlet private var textField: UITextField!
    let presenter = Presenter()
    var listView = ListView()
    override func viewDidLoad() {
        super.viewDidLoad()
        listView.delegate = self
        setupTableView()
    }
    @IBAction private func addTodo() {
        presenter.addTodo(title: textField.text ?? "")
        textField.text = ""
    }
    private func setupTableView() {
        let vc = UIHostingController(rootView: listView)
        self.addChild(vc)
        listParentView.addSubview(vc.view)
        vc.didMove(toParent: self)
        // UIView内で表示されているSwiftUIビューの位置とサイズなどを調整
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        vc.view.topAnchor.constraint(equalTo: listParentView.topAnchor, constant: 0).isActive = true
        vc.view.bottomAnchor.constraint(equalTo: listParentView.bottomAnchor, constant: 0).isActive = true
        vc.view.leftAnchor.constraint(equalTo: listParentView.leftAnchor, constant: 0).isActive = true
        vc.view.rightAnchor.constraint(equalTo: listParentView.rightAnchor, constant: 0).isActive = true
    }
}

extension ViewController: ShowDetailDelegate {
    func showDetail(todo: Todo) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailView = storyboard.instantiateViewController(withIdentifier: "detail") as? DetailViewController {
            detailView.todo = todo
            self.present(detailView, animated: true, completion: nil)
        }
        //以下だと画面が表示されなくなる
//        let detailView = DetailViewController(todo: todo)
//        self.present(detailView, animated: true, completion: nil)
    }
}

protocol ShowDetailDelegate: AnyObject {
    func showDetail(todo: Todo)
}
