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
        print("게임을 시작하지") // 게임 시작 메시지 출력
        
        while true {
            // 사용자로부터 숫자 입력 받기
            print("숫자를 입력하세요: ", terminator: "")
            guard let input = readLine() else { // 입력값이 없으면 반복문 처음으로 돌아감
                print("올바르지 않은 입력값")
                continue
            }
            
            let numbers = getUserInput() // 입력값 유효성 검사 및 변환
            let result = compare(numbers, with: answer) // 입력된 숫자와 정답 비교
            
            // 결과 출력
            displayResult(result)
                        
            // 스트라이크 개수가 3이면 게임 종료
            if result.strikes == 3 {
                print("정답입니다!")
                break
            }
        }
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
    
    // 사용자 입력 받기 및 유효성 검사
    private func getUserInput() -> [Int] {
        while true {
            print("숫자를 입력하세요: ", terminator: "")
            guard let input = readLine() else { // 입력값이 없으면 반복문 처음으로 돌아감
                print("올바르지 않은 입력값입니다")
                continue
            }
            
            let numbers = input.compactMap { Int(String($0)) }
            guard numbers.count == 3, Set(numbers).count == 3, numbers.allSatisfy({ $0 >= 1 && $0 <= 9 }) else {
                // 입력값이 3자리 숫자가 아니거나, 중복된 숫자가 있거나, 1-9 범위를 벗어난 경우 오류 메시지 출력
                print("올바르지 않은 입력값입니다")
                continue
            }
            return numbers
        }
    }
    
    
    // 사용자 입력과 정답 비교
    private func compare(_ guess: [Int], with answer: [Int]) -> (strikes: Int, balls: Int) {
        var strikes = 0
        var balls = 0
        
        for (index, number) in guess.enumerated() {
            if answer[index] == number { // 같은 자리에 같은 숫자가 있으면 스트라이크 증가
                strikes += 1
            } else if answer.contains(number) { // 다른 자리에 같은 숫자가 있으면 볼 증가
                balls += 1
            }
        }
        
        return (strikes, balls) // 스트라이크와 볼의 개수를 튜플로 반환
    }
    
    // 결과 출력 함수
        private func displayResult(_ result: (strikes: Int, balls: Int)) {
            if result.strikes == 0 && result.balls == 0 {
                print("Nothing")
            } else {
                print("\(result.strikes)스트라이크 \(result.balls)볼")
            }
        }
}

