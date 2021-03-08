//
//  Model.swift
//  ToDoListWithRxSwiftMVVM
//
//  Created by Taylan Bostanci on 6.03.2021.
//
import Foundation

struct Task {
    let title: String
    let priority: Primary
}

enum Primary: Int {
    case first
    case second
}
