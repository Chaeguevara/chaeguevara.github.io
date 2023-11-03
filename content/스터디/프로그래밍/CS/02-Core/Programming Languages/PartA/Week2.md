---
category:
  - Computer Science
lastmod: 2023-10-31
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
\begin{flalign*}
\text{datatype mytype}& = \text{TwoInts of int * int}\\
&\text{| Str of string}\\
&\text{| Pizza}
\end{flalign*}
$$
새로운 타입을 만들었음. 이 친구는 int\*int 또는 string 또는 nothing을 타입으로 자기게 됨([[#^10e29a|One-of type]]). 위 구문을 통해 한짓은 무엇인가. 1. 새로 정의한 타입의 value를 만드는 function이거나 2. value 자체임. 뭔소린지 잘 이해는 안가지만 TwoInts의 경우 int\*int-> mytype. Str은 string->mytype으로. Pizza는 Mytype의 value 그 자체임. 그리고 Constructor를 case expression안에 넣음

# 5 Study question
> [!question] function은 expression의 한 종류인가? 아니면 Expression이란 종국엔 value로 되는 경우만을 뜻하는가?
> > [!check] Function은 expression이 아닌것으로 보임. [[Week1#3.5 Expression 예시|참조]]

1. 

#StandardMachineLanguage  #syntacticSugar