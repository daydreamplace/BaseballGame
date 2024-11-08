//
//  BaseballGame.swift
//  LetzPlayBaseBall
//
//  Created by eden on 11/7/24.
//

import Foundation

class BaseballGame {
    // 게임 시작 함수
    func start() {
        let answer = makeAnswer() // 숫자 생성
        print(answer)
        // 로직 추가 예정
    }
    
    // 1-9 사이 임의 숫자 3개 생성
    private func makeAnswer() -> [Int] {
        var numbers: Set<Int> = [] // 숫자 저장용 Set
        
        // Set 크기가 3이 될 때까지 반복
        while numbers.count < 3 {
            let randomNumber = Int.random(in: 1...9) // 랜덤 숫자 생성
            numbers.insert(randomNumber) // 중복을 제외하고 Set에 추가
        }
        
        return Array(numbers) // Set을 배열로 변환해 반환
    }
}
