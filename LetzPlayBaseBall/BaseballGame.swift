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
        print("게임을 시작하지")
        
        while true {
            // 사용자로부터 숫자 입력 받기
            print("숫자를 입력하세요: ", terminator: "")
            guard let input = readLine() else { // 입력값이 없으면 반복문 처음으로 돌아감
                print("올바르지 않은 입력값")
                continue
            }
            
            // 입력된 문자열을 각 문자로 나누어 정수 배열로 변환
            let numbers = input.compactMap { Int(String($0)) }
            guard numbers.count == 3, Set(numbers).count == 3, numbers.allSatisfy({ $0 >= 1 && $0 <= 9 }) else {
                // 입력값이 3자리 숫자가 아니거나, 중복된 숫자가 있거나, 1-9 범위를 벗어난 경우 오류 메시지 출력
                print("올바르지 않은 입력값")
                continue
            }
            
            var strikes = 0 // 스트라이크 개수 초기화
            var balls = 0 // 볼 개수 초기화
            
            // 입력된 숫자와 정답 비교
            for (index, number) in numbers.enumerated() {
                if answer[index] == number { // 같은 자리에 같은 숫자가 있으면 스트라이크 증가
                    strikes += 1
                } else if answer.contains(number) { // 다른 자리에 같은 숫자가 있으면 볼 증가
                    balls += 1
                }
            }
            
            // 스트라이크 개수가 3이면 게임 종료
            if strikes == 3 {
                print("정답입니다!")
                break
            } else if strikes == 0 && balls == 0 { // 스트라이크와 볼이 모두 0이면 Nothing 출력
                print("Nothing")
            } else {
                print("\(strikes)스트라이크 \(balls)볼")
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
}
