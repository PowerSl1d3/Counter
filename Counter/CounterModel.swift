//
//  CounterModel.swift
//  Counter
//
//  Created by Олег Аксененко on 03.10.2022.
//

import Foundation

struct Counter: CounterProtocol {
    private(set) var value = 0

    var description: String { "Значение счётчика \(value)" }

    mutating func makeStep() {
        value += 1
    }
}
