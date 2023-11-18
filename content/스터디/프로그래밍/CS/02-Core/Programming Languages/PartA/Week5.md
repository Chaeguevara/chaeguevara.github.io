---
lastmod: 2023-11-17
category:
  - ComputerScience
due date: 2023-11-19
Progress(10): 3
중요도: 10
완료됨: true
---
# 1 Type inference란?
> [!tldr] 작동 가능한 프로그램에서 각 변수의 type을 정하는 행위

## 1.1 필요한 이유?
> ==*statically typed language*== and ==*implicitly typed*==

내가 이해하기로는 ==ML에서 각 변수에 type을 지정해주지 않음==. C나 Java와는 다른 문법임. 이상하게 들릴순 있지만, type을 지정하지 않지만 ==프로그램의 구동 논리==를 보면 각 변수의 type을 추정할 수 있음. 그래서 type inference라는 말을 하는 것으로 보임.

이걸 좀더 풀어서 설명하면 다음과 같다. 어떤 변수의 ==*Type을 확인하는 방법은 두가지*==가 있다. ==Compile시 확인하느 statically typed languages== 방식과, ==작동시 확인하는 dynamically typed languages 방식==이 있다. 사실상 Dynamically typed language 방식은 어떤 Function의 return type이 맘대로니까 확인한다고 말하기도 애매하다.  전자에 해당하는 언어는 C, Java, ML 등이 있고 후자에는 Python, Ruby, Racket 등이 있다. 

그 중 ML은 좀 특이하게 변수 앞에 type을 지정하지 않는다. 이게 무슨소리냐. 프로그램을 짜면 그 논리관계를 통해 각 변수의 type을 추정하는 것이다. 원문 텍스트에서 제대로 이해하진 못했지만 이게 Type Inference가 무엇인지와 왜 필요한지를 설명한다고 이해할 수 있다.

실무적으로는 type inference와 type check가 거의 구분되지는 않는 모양이다. 과정을 쪼개서 생각해보면 최초 compile시 각 변수의 type을 inference하고 그 후 맞는지 type을 check 한다고 이해하면 좀더 나을 것 같다.

# 2 ML Type Inference 개요
> ML에서 Type inferenceing을 하는 과정을 살펴보자

앞에서 Type Inference가 필요한 이유를 살펴봤다. 그럼 이제 실전이다. 인생이다. Type inference를 하는 과정에 대한 개요는 다음과 같단다
- 순서대로 훑는다. 그러면 각 type이 나온다
- val,fun binding을 보고 계산 식 등을 통해 각 값의 Type을 추론한다. 가령 x+1이라는 연산이 있다면, x는 당연히 Int다. 이렇게 추론을 한다.
- 이렇게 하고 나서도 모르겠는 애들은 일종의 무엇이든 다 됨 표시를 해줘야 한다. 이게 type variable이다. REPLE에서 본 것 중 'a가 여기 해당한다.

순서대로 훑기 떄문에 넘어가야 하는 type이 분명한 애들을 실행 할 수 있고, type이 불분명한 애들을 넘길 수있다. 사실 그렇게 대단한 이야기인지 체감은 안된다. 그런 학생을 위해서인지 예시를 가져왔다.

```sml
val x= 42
fun f(y,z,w) = if y then z+x else 0
```
위를 보면 
- x:int.
- `if y`가 있으니까 y:bool. 
- `z+x`가 있어서 z:int. 
- `w`는 쩌리니까 w:'a
- 그리고 fun 자체는 int를 Output 함

위 정보를 긁어서 모아보면 f의 타입은 `bool*int*'a -> int`가 될 것이다

# 3 ML Type Inference 예시

바로 예시로 보자
```sml
fun f x =
	let val (y,z) = x in
		(abs y) + z
	end
```
위 예제를 순서대로 읽어보면
- fun f 니까 t1-> t2 를 가질 것임. input이 x 니까 x:t1이 됨
- (y,z) = x로 부터 t1=t3\*t4 인걸 볼 수 있음
- 그 다음줄에 (abs y)로 부터 t3는 Int. int와 더하기를 하려면 t4도 Int
- 다시 가면 t1=int\*int가 된다. 그리고 전체 타입은 int\*int -> int

이제 에러가 날 수 밖에 없는 예제로 보자
```sml
fun broken_sum xs =
	case xs of 
		[] => 0
		| x::xs' => x + (broken_sum x)
```
위를 한줄 씩 해보면
- T1 -> T2
- case를 지나며 'a list -> int
- x::xs -> int list -> int가 되는거 같지만
- broken_sum x 가 되면 최초에는 int list였던게 int가 되면서 에러가 난다

# 4 Polymorphic type
사실 어떤 Function은 Input의 type이 크게 중요하지 않은 경우가 있다. 즉 `'a`로 처리해버려도 크게 상관없는 경우다. 이런일이 생기는 경우는 ==*uncontrained*==하기 때문이며, 우리말로는 구속조건이 충분하지 않다 정도로 이해하면 될 것 같다. 역시나 또 예제
```sml
fun length xs =
	case xs of
		[] => 0
		| x::xs' => 1 + (length xs')
```

위를 뜯어보면
- length : t1 -> t2
- xs:t1
- t2:int because of 0
- t1 = t3 list
- xs' also t1
그래서 위를 보면 t3는 사실 뭐든 됨. 이런 경우 t3 = 'a가 됨 그래서 전체 type은
=='a list -> int==

그럼 다른 예ㅔ를 한번 해 보자
```sml
fun compose (f,g) = fn x => f (g x)
```
앞에서 한것처럼 하면 순서대로 하면 되겠지
- compose : t1 \*t2 -> t3. f:t1,g:t2
- 근데 t3는 function이니까 t3 = t4 -> t5. 즉 x:T4
- g : t4 -> t6
- f : t6 -> t7
- f를 한게 compose의 결과기도 하니까 t7=t5
- 이걸 정리하면 (T6->T5)\*(T4->T6) -> (T4 -> T5)
- ('a ->'b)\*('c->'a)->('c->'b)

그리고 또 해보자
```sml
fun f (x,y,z) =
	if true
	then (x,y,z)
	else (y,x,z)
```
- x:T1, y:T2, z:T3
- T1\*T2\*T3 -> T4
- T2\*T1\*T3
- T1\*T2\*T3
- T1=T2
- T1\*T1\*T3 -> T1\*T1\*T3
- `('a * 'a * 'b) ->('a * 'a * 'b)`
와우 신난다

# 5 Value Restriction
앞에서 예제에서 보듯, 틀린 type을 받을 수도 있음. 이런 문제가 없으려면 *value restrction*을 해야함

```sml
val r = ref NONE (* 'a option ref*)
val _ = r := SOME "hi" (* 'a string*)
val i = 1 + valOf(!r) (* 'a int*)
```

이런 문제가 없으려면 val binding을 할떄 오른쪽은 value 또는 variable로 하면 된다고함. 그렇다면 위에선 왜 안됬냐. ref 는 Value가 아니라 Function이라서 그렇단다. 와우. 이처럼 val binding을 하는걸 ==*value restriction*==이라고 한단다. 사실  별거 없어보이기도 한다. 그래서 위 예제에서는 최초 `r`은 `?X1 option ref`라고 뜨고 이건 Dummy type이다. 