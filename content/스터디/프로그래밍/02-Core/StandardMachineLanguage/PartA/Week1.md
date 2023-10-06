
# 목표
- 특정 `언어`를 배우는 것이 아닌 `개념`을 배우는 것에 초점을 둠
- 또한 개념들을 서로 "맞추는" 방법을 배울 것임
- 프로그램 패러다임을 학습하는 것이 목적임
	- ML, Racket, Ruby는 도구일 뿐임
- 대부분 *[[Functional programming]]* 을 진행할 것임

# 용어
- *Static envinroment* : type을 판별하는 환경을 뜻하는 것으로 보임. 즉 Python과는 다르게 Java 또는 C 환경에서 타입을 한번 지정하면 바꾸지 못하는 것을 생각하면 되는 것으로 보임
- *Dynamic envinroment* : Value를 판별할떄 쓰임. 어떤 변수에 할당된 값이 계속 변할 수 있는 것에서 착안한 듯. 즉 a=7, a=12 처럼 계속변하는(dynamic) 상황에서 착안한 이름인 듯
- *binding* : 변수와 Expressio을 묶는(binding) 행위.
- *Read-eval-print-loop*
 
# Study Question
- Dynamic과 Static enviroment의 차이는?
- Current, any ___ environment 의 차이는? 

# ML Expression and Variable Bindings
- ML이라는 언어를 배우기보다는 *개념*을 배울 것임. 따라서 언어 보다는 **==개념(단어)==** 를 신경써야함
- ML은 *==binding==* 의 연속임
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

## Value
- 더이상의 계산이 필요없는 상태. 다른말로 더이상 간략화를 할 수 없는 상태
	- 17은 *value*임.
	- 8+9는 *==value==* 가 아님

## Expression 예시

- **Integer constants**:
	- Syntax : 숫자의 연속
	- Type-checking: Int임
	- Evaluation : 자기 자신임.

- **Addition**:
	- Syntax : e1 + e2. e1과 e1는 expression임
	- Type-checking : static environment안에서 e1과 e2가 int 이면 Int. 그 외는 type-check(Type이 맞지 않는다는 뜻인 듯)를 하지 않음
	- Evaluation : e1 -> v1, e2 -> v2 로 evaluate하며 이떄 같은 dynamic environment 안에 있음. evaulate 후, v1과 v2를 더함

- **Conditionals:**
	- Syntax : if e1 then e2 else e3. e1,e2,e3는 expression임
	- Type-check : 같은 Static environment 안에서 1) e1이 bool type 이고 2) e1과 e2가 같은 type일때만 type check를 진행함. 전체 expression의 type은 e2와 e3임
		- e2와 e3의 type이 다른 경우도 있기 때문에 위와 같이 표현한 듯
	- Evaluation : 현재 Dynmic environment에서 e1을 evaluate함.
		- true -> e2를 evaluate해서 결과로 함
		- false -> e3를 evaluate해서 결과로 함

- **Boolean constants:**
	- Syntax : `true` 또는 `false`
	- Type-checking : type `bool`
	- Evaluation : 자기 자신(value)

- Less-than comparison:
	- Syntax: e1 < e2. e1, e2는 expression임
	- Type-checking : e1,e2가 int일 때만 bool로 type check. 
	- Evaluation : e1 -> v1, e2 -> v2 를 같은 dynamic environment 에서 수행. 그 후
		- v1 < v2 -> true
		- else -> false

> [!tip] 언어를 배울 때 생각할 것
> `Syntax`(어떻게 쓰는지, 문법이 무엇인지) 
> 
> `Type-checking`(타입 판별)
> 
> `evaluation rule` (Evaluate 하는 방법)



#Programming #StandardMachineLanguage #Coursera