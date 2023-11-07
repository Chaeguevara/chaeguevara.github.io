---
category:
  - Computer Science
lastmod: 2023-11-07
---
# 1 새로운 Type을 만드는 개념적인 방법
compound type을 만드는 방법은 여러가지가 있음
- tuple, list, option 등이 존재함
- 정식 표현은 아니지만 "Each-of types" "one-of types" "self-reference types"이 존재함
- "each-of types" : tuple 처럼 다른 type을 한데 묶은 형태. 있는데 t1 and t2가 한데 있는 형태 ^950eca
- "one-of" : int option이 예시임. int or not.있거나 없거나 형태 ^10e29a
- "Self-reference" : recursive data structures. Each-of와 One-of를 합쳐놓은 형태임. 예를 들면 int list는 1) 아무것도 없거나 2) int 와 int list의 합으로 이루어져 있음


# 2 Records : "Each-of" Type을 만드는 또다른 접근방법
> Python의 dictionary와 동일함

Record 는 [[#^950eca| each of type]]임. 그러니까 t1과 t2가 동시에 존재하는 형태임 예를들면 다음과 같은 데이터 구조가 있음
```sml
{foo: int, bar : int*bool, baz : boo*int}
```

^34e692

이런 방식을 통해 새로운 데이터 타입을 정의할 수 있음

expression을 이용해 표현 가능함
```sml
{bar = (1+2,true andalso true), foo = 3+4, baz = (false,9)}
{bar = (3,true), foo = 7, baz = (false,9)}
```
이 경우 데이터 타입은 [[#^34e692|위에서]] 쓴 내용과 같음. Syntax 측면에서 보면 아래와 같이 쓸 수 있음
```sml
{f1 = e1, ..., fn = en}
```
이때 ei는 어떤 expression이라도 올  수 있음

Field의 순서는 상관 없지만 *[[Week1#^f2052c|REPL]]* 환경에서는 alphabet 순서대로 record의 내용을 출력함

> 데이터에 접근하는 법

field name 중 `foo`라는 이름이 있다면 `#foo e`라는 Syntax를 통해 값을 불러 올 수 있음

# 3 By name vs. By Position, Syntactic Sugar, an the Truth about tuple
슬슬 냄새가 수상해지는 부분임. record와 tuple이 굉장히 유사한 것을 볼 수 있음. 유일하게 다른점은 데이터를 access하는 방식이 다르다는 것임. 즉, file name을 쓰느냐 position을 이용하느냐 차이밖에 없음.

> 이름과 위치를 사용하는 것은 칼로 물베기

file name을 써서 데이터를 가져오느냐 position을 통해 가져오느냐 하는 문제는 오랜 논쟁 거리임. 서로 올바른 때에 쓰면 되는 것. Tuple은 record 로 정의 가능함

- Tuple의 Syntax인 (e1,...,en)을 다시쓰면 {1=e1,...,n=en}이라 쓸 수 있임. 
- Tuple의 type을 t1 \* ... \* tn이라하면, {1:t1,...,n:tn}으로 쓰는 것과 동일함

이게 **Tuple의 진실임**. 이를 "Tuple은 recods의 *Syntactic sugar*"라고 표현함. Syntactic sugar는 같은 기능을 하는데 좀더 간편한 Syntax를 가지는 경우를 뜻함


# 4 Datatype Bindings : Our Own "One-of" Types
예시를 통해 배워보자
$$
\begin{align*}
\text{datatype mytype}& = \text{TwoInts of int * int}\\
&\text{| Str of string}\\
&\text{| Pizza}
\end{align*}
$$

^4aa254

새로운 타입을 만들었음. 이 친구는 int\*int 또는 string 또는 nothing을 타입으로 자기게 됨([[#^10e29a|One-of type]]). 위 구문을 통해 한짓은 무엇인가. 1. 새로 정의한 타입의 value를 만드는 function이거나 2. value 자체임. 뭔소린지 잘 이해는 안가지만 TwoInts의 경우 int\*int-> mytype. Str은 string->mytype으로. Pizza는 Mytype의 value 그 자체임. 그리고 Constructor를 case expression안에 넣음

# 5 Datatype에 있는 value를 가져오기

[[#^4aa254|위]]에서 정의한 데이터 타입이 있음. 그러나 활용하기 위해서는 해당 데이터 타입안의 value를 가져오는 일이 필요함. 현재 데이터 타입은 "one-of" 타입 이기 때문에, 어떤 variant인지 판별하는 것이 필요함. 즉, `TwoInts`,`Str`,`Pizza` 중에 무엇인지 먼저 판별을 해야함. 여러 방법이 있지만 ==ML에서는 Case Expression을 사용함. 저자의 주장은== [[#6 Case Expression]]==이 다른 언어의 if else recursion 과 같은 방법 보다 효율적이라고 함==.


# 6 Case Expression
기본적으로 쓰는 법은 이렇다

```sml
fun f x = (*f는 mytype -> int*)
	case x of
		Pizza => 3
		| TwoInts(i1,i2) => i1 + i2
		| Str s => String.size s
```
- 각 패턴(variant)에 맞는 branch에 expression을 정의하기 때문에 if, else보다 더 낫다
- 그리고 각 branch의 expression은 같은 타입을 가져야 한다. 왜냐하면 type-checker는 어떤 branch가 실제로 사용될지 모르기 때문에? 데이터 타입이 일관적이야해서 그런거 같다.
	- 여기서 branch란 `case x of` 다음에 나오는 `Pizza`, `| TwoInts(i1,i2)` 등을 뜻한다
- 각 branch를 표현하는 syntax는 `p=>e`다. 그리고 branch를 구분할때 `|`를 쓴다
	- `p`는  `case x`가 어느 branch에 속하는지 판별할때 쓰인다. expression같이 생겼지만 `pattern`이라 부른다
	- 어느 한 pattern에 대응시키는 과정을 하기 때문에 `case-expression`을`pattern-matching`이라고도 부른다
	- 그리고 하나의 패턴은 하나의 expression과 대응시키게 만든다
		- `TwoInts(7,9)`이 있다면, 다른 branch로 evaluation하지 않는다
	- 그리고 해당 branch를 통해 각 variant안에 들어있는 값도 가져올 수 있다
		- `TwoInts(7,9)`를 예로 들면 `TwoInts(i1,i2)`로 되어 있었으니까, `i1=7`,`i2=9`로 binding해서 expression을 돌릴 수 있다
- 그래서 ==저자가 말하는 case-expression이 좋은점==은 다음과 같단다
	- variant가 헷갈릴 일이 없다. 한 vairant는 한 branch에서만 작동한다
	- 대응 되는 variant의 branch가 없으면 경고를 띄워준다. 뺴먹은게 없는지 알 수 있다
	- 같은 variant를 두번 쓰면 error가 나온다
	- null,hd를 여전히 쓸 수는 있다(권장은 안한다)

# 7 "One-of" Type의 유용한 예시

- 정해진 크기의 옵션 중 하나를 고르는 경우에 유용함. 카드를 예로 들면
```sml
datatype suit = Club | Diamond | Heart | Spade
```

```sml
datatype rank = Jack | Queen | King | Ace | Num of Int
```
이렇게 만들어 놓고, 둘을 결합한다. 즉 카드를 정의한다(`suit*rank`)

One-of 각 상황별 쓰임이 다를때 유용하다. 가령 신입생관리 시스템이 필요하다고 해보자. 그러면 아직 학번이 없을 수 있는데, 학번이 없는 경우 이름으로 대체해서 관리 할 수 있다. 이 경우 데이터 타입은 아래처럼 만들어 볼 수 있다
```sml
datatype id = StudentNum of int
			| Name of string * (string option)* string
```
근데 위의 방식은 잘못된 것이다(?). 내가 이해하기론 위처럼 하면 한명의 학생을 숫자로 표현된 아이디와 이름을 만들 수 없다. 그래서 한명의 학생에 대한 이름과 id를 제대로 하기 위해서는 "each-of" type으로 아래와 같이 만들어야 한다.(Record)
```sml
{
	StudentNum : int option,
	Name : string,
	MiddleName : string option,
	lastName : string
}
```

수학 연산 예시를 마지막으로 들어본다
```sml
datatype exp = Const of int
			| Negate of exp
			| Add of exp * exp
			| Multiply of exp * exp
```
- self-reference가 가능하기 때문에, tree 구조로 생각하면 말단에는 int(Const)를 기준으로 계산을 하게 된다. eval 을 한번 직접 써보다

```sml
fun eval = e
	case e of
		Constant i => i
		| Negate e1 => ~(eval e1)
		| Add(e1,e1) => (eval e1) + (eval e2)
		| Multiply(e1,e2) => (eval e1) * (eval e2)
```

만약 아래와 같이 쓴다면 그 결과는 어떨까
```sml
eval (Add (Constant 19, Negate (Constant 4)))

```
위 예제가 계산되는 과정을 써보면
```sml
Constant 4 => 4
Negate 4 => ~4 => -4
Constant 19 => 19
Add(19,-4) => 19 -4 => 15
```
최종적으로 15를 얻을 것이다


# 8 Type synonym
카드를 가지고 예시를 들어본다
```sml
type card = suit*rank

type name_record = {
	studentNum : int option,
	firstName : string,
	middleName : string option,
	lastName : string
}
```

위 `card`를 중심으로 보면 type은 `card` -> `int`가 되거나 `suit*rank`->`int`가 된다. 두 표현은 달라도 완전히 동일하다

# 9 Study question
> [!question] function은 expression의 한 종류인가? 아니면 Expression이란 종국엔 value로 되는 경우만을 뜻하는가?
> > [!check] Function은 expression이 아닌것으로 보임. [[Week1#3.5 Expression 예시|참조]]

1. 

#StandardMachineLanguage  #syntacticSugar