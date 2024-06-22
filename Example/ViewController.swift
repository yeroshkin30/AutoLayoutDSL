//
//  ViewController.swift
//  AutoLayoutDSL
//
//  Created by Oleh Yeroshkin on 23.06.2024.
//

import UIKit


final class ViewController: UIViewController {

    // MARK: - Private properties

    private let mainView: MainView = .init()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        super.loadView()
        view = mainView
    }
}
