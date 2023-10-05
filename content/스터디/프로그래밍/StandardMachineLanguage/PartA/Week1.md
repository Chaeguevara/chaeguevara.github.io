
# 목표
- 특정 `언어`를 배우는 것이 아닌 `개념`을 배우는 것에 초점을 둠
- 또한 개념들을 서로 "맞추는" 방법을 배울 것임
- 프로그램 패러다임을 학습하는 것이 목적임
	- ML, Racket, Ruby는 도구일 뿐임
- 대부분 *[[Functional programming]]* 을 진행할 것임

# 용어
- *Static envinroment*
- *Dynamic envinroment*
- *binding*
- *Read-eval-print-loop*
 
# Study Question
- Dynamic과 Static enviroment의 차이는?

# ML Expression and Variable Bindings
- ML이라는 언어를 배우기보다는 *개념*을 배울 것임. 따라서 언어 보다는 ==**개념(단어)**==를 신경써야함
- ML은 *binding*의 연속임
	- 각 *binding*에는 *type-check*이 수반되며, *type-check*이 진행된 후에 *evaluation*이 진행됨
- 특정 *binding*이 가지는 type은 *static environment*에 달려있음
	- 다시말해 *static environment*를 이용해 type을 지정함
- *binding*의 `evaluation`은 *Dynamic environment*에 달려있음
	- *Dynamic environment*를 이용해 `evaluation`을 하게됨
## Syntax
- 어떻게 쓰는지(writing)
- *variable binding*의 예시를 보면 다음과 같음
	- `val x = e;`
	- `val`은 keyword, `x`는 변수, `e`는 *expression*
	- `;`는 부수적인 요소지만 `read-eval-print loop`에서 typing을 끝냈다는 표시가 됨
 
## Semantic
- *type-check*와 *evaluation*에 대해 알아봐야함
- "Current static enviroment"을 이용해 `e`에 대해 *type-check*를 하게 됨
- `e`의 type(`t`)을 이용해 "new static environment"를 만듬
	- "new static environment"의 다른점은 `x`의 type이 `t`가 되었다는 것



#Programming #StandardMachineLanguage #Coursera