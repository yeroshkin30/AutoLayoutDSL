//
//  MainView.swift
//  AutoLayoutDSL
//
//  Created by Oleh Yeroshkin on 23.06.2024.
//

import UIKit

final class MainView: UIView {

    // MARK: - Private properties

    private let firstView: UIView = .init()
    private let secondView: UIView = .init()
    private let thirdView: UIView = .init()
    private let forthView: UIView = .init()


    // MARK: - Initialisers

    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private properties

private extension MainView {
    func setupView() {
        setupSubviews()
        setupConstraints()
    }

    func setupSubviews() {
        firstView.backgroundColor = .white
        secondView.backgroundColor = .red
        thirdView.backgroundColor = .green
        forthView.backgroundColor = .blue
    }

    func setupConstraints() {
        firstView.layout(in: self)

        secondView.layout(in: firstView) {
            $0.top == firstView.safeAreaLayoutGuide.topAnchor + 30
            $0.leading == firstView.leadingAnchor + 30
            $0.width == 150
            $0.height *= secondView.widthAnchor * 0.8
        }

        thirdView.layout(in: firstView) {
            $0.leading == firstView.leadingAnchor + 30
            $0.bottom == safeAreaLayoutGuide.bottomAnchor - 30
            $0.width == secondView.widthAnchor
            $0.height == secondView.heightAnchor
        }

        forthView.layout(in: self) {
            $0.centerX == secondView.centerXAnchor
            $0.centerY == centerYAnchor
            $0.width == 50
            $0.height == $0.width
        }
    }
}
