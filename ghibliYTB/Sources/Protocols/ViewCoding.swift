//
//  File.swift
//  ghibliYTB
//
//  Created by Yago Marques on 02/09/22.
//

import Foundation

protocol ViewCoding {
    func setupView()
    func setupConstraints()
    func setupHierarchy()
}

extension ViewCoding {
    func buildLayout() {
        setupView()
        setupHierarchy()
        setupConstraints()
    }
}
