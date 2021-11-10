# 이자율 계산 구조체 및 숫자 야구 게임 구조체

> ### 이자율 계산 구조체 
>> * 다음 메소드를 포함하는 구조체를 구현한다.
>> * 일자(day)를 매개 변수로 받아서 이자율(%)이 얼마인지 계산하는 getInterestRate(byDay:Int) -> Double 메서드
>> >>* 거치 기간이 90일 이내 0.5%
>> >>* 거치 기간 91~180일 경우 1%
>> >>* 거치 기간 181~364일 일 경우 2%
>> >>* 365일 이상 5.6%
>> * calculateAmount(day:Int, amount:Int) -> Double 메서드
>> >>* 예금 거치 기간(day)와 원금(amount)을 넣으면 예치 계산 금액을 계산해서 리턴
>> >>* 예치 금액 = 원금 + 이자
>> * main에서 1~365일까지 unitDay단위씩 증가하면서, 원금 100만원을 예금할 때 이자+원금을 확인하는 testInterest(unitDay : Int) -> Double 함수를 만든다
>> >>* unitDay=1 하루 단위 출력
>> >>* unitDay=10 10일 단위 출력
>
>
> ### 숫자 야구 게임 구조체
>> * 3자리 숫자 야구게임(수비)을 위해서, 다음 메소드를 포함하는 구조체 만들기
>> * newGame()
>>   임의의 3자리 숫자 생성해서 내부 프로퍼티에 저장
>> * hit(num:Int) -> (strikeCount:Int, ballCount:Int)
>>   3자리 숫자를 비교 후 결과(숫자 위치까지 맞춘 경우, 위치만 다른 경우)를 리턴
>> * showGameScore() -> Bool
>>   9번내에 스트라이크 3개 모두 맞췄으면 성공(true). 아니면 실패(false)
>
>
>### 구현 
>> <p align="center"><img width="40%" src="https://user-images.githubusercontent.com/78553659/141098823-749fb426-7f6c-4aed-aa09-2aa48555aa31.gif"/>
>> <img width="40%" src="https://user-images.githubusercontent.com/78553659/141098831-1b7b3370-2b76-43c8-b64c-091e6e8f5e53.gif"/></p>
***
