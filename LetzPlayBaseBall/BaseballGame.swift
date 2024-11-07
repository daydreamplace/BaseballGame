//
//  BaseballGame.swift
//  LetzPlayBaseBall
//
//  Created by youbin on 11/7/24.
//

import Foundation

class BaseballGame {
    func start() {
        let answer = makeAnswer()
        print(answer)
    }
    
    private func makeAnswer() -> [Int] {
        var numbers: Set<Int> = []
        
        while numbers.count < 3 {
            let randomNumber = Int.random(in: 1...9)
            numbers.insert(randomNumber)
        }
        return Array(numbers)
    }
}
