---
category:
  - Computer Science
---
# 1 새로운 Type을 만드는 개념적인 방법
compound type을 만드는 방법은 여러가지가 있음
- tuple, list, option 등이 존재함
- 정식 표현은 아니지만 "Each-of types" "one-of types" "self-reference types"이 존재함
- "each-of types" : tuple 처럼 다른 type을 한데 묶은 형태. 있는데 t1 and t2가 한데 있는 형태 ^950eca
- "one-of" : int option이 예시임. int or not.있거나 없거나 형태
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

# 3 Study question
> [!question] function은 expression의 한 종류인가? 아니면 Expression이란 종국엔 value로 되는 경우만을 뜻하는가?
> > [!check] Function은 expression이 아닌것으로 보임. [[Week1#3.5 Expression 예시|참조]]

1. 

#StandardMachineLanguage 