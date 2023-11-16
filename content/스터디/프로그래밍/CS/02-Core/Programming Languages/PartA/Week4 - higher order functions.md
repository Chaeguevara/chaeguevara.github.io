---
lastmod: 2023-11-15
tags:
  - StandardMachineLanguage
category:
  - Computer Science
---
# 1 도입 및 몇몇 용어들
- `first-class function`과 `function closure`에 대해서 다룸
- `first-class`라는 말은 어떤 기능이, 계산, 건내줌, 저장이 가능하다는 말임 ^e6649b
- `function closure`는 `function`외부에 정의된 변수를 가져다 쓰는 것을 뜻함
	- 이 덕에 `fist-class`는 짱짱맨이 됨
- `higher-order function`은 다른 function을 입력으로 받거나, function을 output으로 내보낼 수 있는 function을 뜻함 ^7b7750
- 용어를 헷갈려도 되지만 `first-class`와 `function closure`는 구분해야함

- 위 용어들을 버무릴 수 있는 것은 `functional programming`임
	- mutable data를 사용하지 않음
	- Function을 값으로 사용함
	- functional programming과 관련된 말들은 아래와 같음
		- recursion을 사용하는 프로그래밍 스타일
		- 수학 비슷한 정의
		- OOP 반대
		- laziness와 관련된 것들
- 위 조건들에 좀더 부합하는 언어가 `functional language`라 할 수 있음
# 2 기능을 Argument로 이용함
- `first-class function`을 다른 Function의 argument로 쓰는 일이 흔함
```sml
fun n_times(f,n,x) = 
	if n =0
	then x
	else f(n_times(f,n-1,x))
	
```

^8cef35

- 위 코드를 실전으로 써보면 아래와 같다
```sml
fun double x = x+x
val x1 = n_times(double,4,7) (*ans = 2^4*7*)

fun increment x = x+1
val x2 = n_times(increment,4,7) (*ans = 11*)
val x3 = n_times(tl,2,[4,8,12,16])(*ans = [12,16]*)
```

- [[#^8cef35|n_times]]부분을 통해 중복되는 코드를 abtraction해서 사용 가능함

# 3 Polymorphic Type과 Function as Arguments
- `n_times`의 타입은 `('a->'a)*int*'a-> 'a`다
- 이떄 각 'a는 원래는 가기 다른 타입이 될 수 있지만, function argument 부분이 `'a -> 'a`로 되어있기 때문에 
- 위 처럼 어떤 type이라도 적용 가능하도록 한 것을 *==parametric polymorphism==* 또는 *==generic types==* 라고 함
- *generic type*을 만드는 경우와 그렇지 않은 경우를 아래와 같이 나눠 볼 수 있음
	- function을 argument로 받지만 polymorphic type이 아닌경우
	- polymorphic type이지만 function을 argument로 받지 않는 경우
- Parametric polymorphism이 없다면, list의 length를 구할때 매번 각 element의 type에 대해 신경을 써야할 것음
	- 그러나 현재 그런데 없어도 length를 쉽게 구할 수 있음
	- 반대로 [[#^7b7750|higher-order function(function을 argument로 받는 경우)]]이지만 polymorphic하지 않은 경우도 있음
```sml
fun times_unitl_zero (f,x)=
	if x = 0 then 0 else 1 + times_unitl_zero (f,f x)
	(*(int*int) * int -> int *)
```


# 4 Anonymous functions
> [!tldr] fn y => 3*y


- 외부로 노출되지 않는 기능들. 예를 들어 `3배`라는 기능이 외부로 노출될 필요가 없다면 local function으로 만들어 사용하고 끝냄
```sml
fun triple_n_times (n,x)=
	let fun triple x = 3*x
	in
		n_times(triple,n,x)
	end
```
- 위의 `triple`이 local function이 될 것임.
- 좀더 짧게 쓰기도 가능
```sml
fun triple_n_times (n,x)=
	n_times((let fun triple in y=3*y end), n, x)

fun triple_n_times(n,x) = (*best versino*)
	n_times((fn y => 3*y), n, x)
```
- 여기서 `fn y => 3*y`를 ==anonymous function==이라 함
	- 왜냐하면 이름이 없음
	- 이름 없이 ==기능만 넣고 싶을때 사용함==
	- expression이 들어가는 자리엔 모두 사용가능
	- ==recursion은 불가능 함==. 하고 싶으면 `fun` binding을 해야함
	- 그래서 ==결론이 다음과 같다==
		- recursion이 필요한 경우 -> `fun`
		- 아니면 -> `val`

```sml
fun increment x = x+1
val increment = fn x => x+1
```

# 5 Unnecessary Function Wrapping
> [!tldr] f x를 쓸 자리에 fn x -> f x로 쓰는 경우

- 다음 코드를 보면 됨
```sml
fun nth_tail_poor (n,x) = n_times((fn y => tl y),n,x)
fun nth_tail (n,x) = n_times(tl,n,x)
```

# 6 Maps and filters
- list에 대해 유용한 higher-order function임
```sml
fun map (f, xs) =
	case xs of
	[] => []
	x::xs' => (f x)::(map(f,xs'))
```

```sml
val x1 = map(increment,[1,3,5,7]) (* [2,4,6,8]*)
val x2 = map(hd, [[1,3],[2,5],[5,6,9]]) (*[1,2,5]*)
```

- maps의 데이터 타입을 글로 써보면 이렇다. map은 a type을 b로 바꿔주는 것이기 때문에, list의 element type은 a 여야 하고, map을 이용한 higher-order function의 return type은 b가 된다
- `('a->'b) * 'a list -> 'b list`
- 그러면 위 `x1`, `x2`를 기준으로 써보면 아래와 같다
	- `(int->int) * int list -> int list*`
	- `(int list ->int) * int list list -> int list*`

- 여기는 ==filter function==
```sml
fun filter (f, xs) =
	case xs of 
	[] => []
	x::xs' => if f x 
				then x::(filter(f,xs'))
				else filter(f,xs')
	
```
- 위를 적용해보자. list에 있는 아이템은 `'a*int'`라면

```sml
fun get_all_even_snd xs = filter((fn (_,v) => v mod 2 = 0),xs)
```

# 7 Returning functions
- [[#^e6649b|first-class]]를 얘기할때 function을 return할 수 있댔음. 예제로 보면 아래와 같다

```sml
fun double_or_triple f =
	if f 7
	then fn x => 2*x
	else fn x => 3*x
```
- 위의 데이터 타입을 적어보면 `(int->bool) -> (int -> int)`