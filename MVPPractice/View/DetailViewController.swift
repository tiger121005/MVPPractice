//
//  DetailViewController.swift
//  MVPPractice
//
//  Created by TAIGA ITO on 2024/11/08.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet private var textField: UITextField! {
        didSet {
            textField.delegate = self
            textField.text = presenter.title
        }
    }
    @IBOutlet private var switchView: UISwitch! {
        didSet {
            switchView.isOn = presenter.isDone
        }
    }
    private var presenter: DetailPresenter!
    var todo: Todo! {
        didSet {
            presenter = DetailPresenter(todo: todo)
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if #available(iOS 13.0, *) {
            presentingViewController?.beginAppearanceTransition(true, animated: animated)
        }
    }
    @IBAction private func switchValueChanged(_ sender: UISwitch) {
        presenter.updateSwitch(sender.isOn)
    }
    @IBAction private func tapDelete() {
        presenter.deleteTodo()
        self.dismiss(animated: true, completion: nil)
    }
}

extension DetailViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        presenter.updateTitle(textField.text ?? "")
    }
}
