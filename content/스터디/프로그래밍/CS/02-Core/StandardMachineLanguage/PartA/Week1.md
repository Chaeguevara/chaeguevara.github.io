
# 목표
- 특정 `언어`를 배우는 것이 아닌 `개념`을 배우는 것에 초점을 둠
- 또한 개념들을 서로 "맞추는" 방법을 배울 것임
- 프로그램 패러다임을 학습하는 것이 목적임
	- ML, Racket, Ruby는 도구일 뿐임
- 대부분 *[[Functional programming]]* 을 진행할 것임

---

# 용어
- ***Static envinroment*** : type을 판별하는 환경을 뜻하는 것으로 보임. 즉 Python과는 다르게 Java 또는 C 환경에서 타입을 한번 지정하면 바꾸지 못하는 것을 생각하면 되는 것으로 보임
- ***Dynamic envinroment*** : Value를 판별할떄 쓰임. 어떤 변수에 할당된 값이 계속 변할 수 있는 것에서 착안한 듯. 즉 a=7, a=12 처럼 계속변하는(dynamic) 상황에서 착안한 이름인 듯
- ***binding*** : 변수와 Expressio을 묶는(binding) 행위.
- *Read-eval-print-loop*(REPL) : 유저가 입력한 값이 1) 읽어지고 2) 계산되고 3) 그 결과가 유저에게 내보내지는 컴퓨터 환경
 
---
# ML Expression and Variable Bindings
## 강의
- ML이라는 언어를 배우기보다는 *개념*을 배울 것임. 따라서 언어 보다는 **==개념(단어)==** 를 신경써야함
- ML은 *==binding==* 의 연속임
	- 각 *binding*에는 *type-check*이 수반되며, *type-check*이 진행된 후에 *evaluation*이 진행됨
- 특정 *binding*이 가지는 type은 *static environment*에 달려있음
	- 다시말해 *static environment*를 이용해 type을 지정함
- *binding*의 `evaluation`은 *Dynamic environment*에 달려있음
	- *Dynamic environment*를 이용해 `evaluation`을 하게됨

## 코드
[[Week1-Code#ML Expression and Variable Bindings]]


---
## Syntax
- 어떻게 쓰는지(writing)
- *variable binding*의 예시를 보면 다음과 같음
	- `val x = e;`
	- `val`은 keyword, `x`는 변수, `e`는 *expression*
	- `;`는 부수적인 요소지만 `read-eval-print loop`에서 typing을 끝냈다는 표시가 됨
 
## Semantic
- *type-check*와 *evaluation*에 대해 알아봐야함
- "Current static environment"를 이용해 `e`에 대해 *type-check*를 하게 됨
- `e`의 type(`t`)을 이용해 "new static environment"를 만듬
	- "new static environment"의 다른점은 `x`의 type이 `t`가 되었다는 것

## Value
- 더이상의 계산이 필요없는 상태. 다른말로 **==더이상 간략화를 할 수 없는 상태==**
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

# Using use
- `REPL`환경에서 여러 binding을 하나의 파일로 불러오면 편리함
	- `use "foo.sml";`
- 해당 파일의 타입은 `uint`임. 하지만 위 명령어를 통해 해당 파일안에 있는 모둔 binding을 불러옴




# Variables are Immutable
- Binding은 *Immutable*(변경 불가능)함
- `val x = 8+9;` -> `val x = 17;` 로 dynamic environment안에서 수행됨
- 이후 `val x = 19;`로 할 경우 이전 값이`shadowing`되며 이때 다른 environment를 만들게 된다.

# Functional Bindings
- 각 binding은 static environment와 dynamic environment에 추가된다.
- variable binding 외에 *functional binding*이 존재한다
	- **==즉 어떻게 function을 정의하고 사용하는지에 관한 얘기==**
- 예시를 통해 살펴봄. $x^y$
``` sml
fun pow (x:int, y:int) = (* correct only for y >= 0 *)
    if y=0
    then 1
    else x * pow(x,y-1)
```
- **Syntax:**
	- `fun x0(x1 : t1, ...,xn: tn) = e`
	- `x0`: 이름
	- `(x1 : t1, ..., xn)` :n arguments
	- `e` : expression in body
- **Type-checking**
	- `e`에 대해서 static environment안에서 수행함
		- 해당 static environment에선 `x1 -> t1,..., xn ->tn`과 `x0 -> t1*...*tn-> t`가 동시에 수행
		- **==해당 envrionment안에 x0가 포함되어 있기 때문에 recursion을 사용 가능하다==**
		- Function의 type은 "arguments types" -> "result type"
			- arguments types는`*`로 분리해서 표현됨
		- e는 type t를 가져야 함
	- `t`는 어떤 타입이던 가능함
		- 즉, x0는 어떤 type이든 만들어 낼 수 있음
- **Evaluation**
	- 그렇게 중요하지 않음(?)
	- *Function is a value* 
- **Function calls** 
	- **Syntax**
		- e0 (e1,...,en)
			- argument가 하나이면 `()`는 부수적임
	- **typing rules**
		- e0 가 `t1*...*t1n->t*`와 같은 형태를 가져야 함
	- **Evaluation**
		- e0 -> v0, e1 -> v1, ..., en ->vn
		- v0는 Function이어야 한다
- 아래코드는 `ans=64`의 결과를 만들 것임
``` sml
fun pow (x:int, y:int) = (* correct only for y >= 0 *)
    if y=0
    then 1
    else x * pow(x,y-1)

fun cube (x:int) =
    pow(x,3)

val ans = cube(4)
```


# Pairs and Other Tuples
- 간단한 또는 복합 데이터를 만들 필요가 있음
	- ML안에서 *pairs*를 이용할 수 있음
		- Syntax : (e1,e2)
		- evaluate : e1 -> v1, e2 ->v2. (v1,v2)
		- type : t1\*t2. 왜냐하면 e1과 e2의 type은 다를 수 있음
		- #1, #2 를 이용해 각 요소들을 불러올 수 있음
			- #1 e, #2 e. e는 ta\*tb의 Type 구조를 가지고 있어야 함
- Pair 사용 예시
``` sml
fun swap (pr : int*bool) =
    (#2 pr, #1 pr)

fun sum_two_pairs (pr1 : int*int, pr2 : int*int) =
    (#1 pr1) + (#2 pr1) + (#1 pr2) + (#2 pr2)

fun div_mod (x : int, y : int) =  (* note: returning a pair is a real pain in Java *)
    (x div y, x mod y)

fun sort_pair (pr : int*int) =
    if (#1 pr) < (#2 pr)
    then pr
    else ((#2 pr),(#1 pr))
```

# Lists
- [[#Pairs and Other Tuples | Pair]]에 비해 유연한 구조를 가진 List
	- Length 제한 없음
	- 하지만 List안의 모든 요소는 같은 type이어야 함(cf. Python에서는 다른 Type도 가능)
- Syntax:
	- `[]` : Empty list
	- type : type t list -> ML안에서는 `'a list`(alpha list라고 읽음)
	- `[v1,v2,...,vn]` : Non-empty list. `[e1,...,en]`방식으로 만들 수 있음
	- 일반적으로 `e1 :: e2`으로 list를 만들게 됨. "e1 consed onto e2"라고 읽음.
	- `e1`은 type t를 가진 Item. `e2`는 type t를 가진 values가 됨
- List를 이용한 기능
	- `null` -> true if empty else false
	- `hd` -> first element of list. *raising an exception* if list is empty
	- `tl` -> tail of a list. *raising an exception* if list is empty
``` sml
fun sum_list (xs : int list) =
    if null xs (* xs가 Null이면*)
    then 0
    else hd(xs) + sum_list(tl xs) (* xs의 hd와 recursion*)

(* x에 대해 [x,...,1]*)
(*int -> int list*)
fun countdown (x : int) =
    if x=0
    then []
    else x :: countdown(x-1)
(* (int list*int list) -> int list *)
fun append (xs : int list, ys : int list) =
    if null xs
    then ys
    else (hd xs) :: append(tl xs, ys)
```
- **==List와 관련된 Function은 대부분 recursion에 기반함==**
	- 왜냐하면 **List의 길이를 알 수 없음**
	- recursion을 위해서는 **`base`와 `recurse` 경우**로 나눠 생각해야함
		- `base` : List가 empty인 경우, 답을 내놓는 경우
		- `recurse` : 나머지 list를 이용해 답을 계산
	- recursion을 통해 문제를 쉽게 풀 수 있음
		- `append`
``` sml

(*(int*int) list -> int *)
(* tuple list 의 tuple의 각 값을 더한 값을 Return *)
fun sum_pair_list (xs : (int * int) list) =
    if null xs (* empty  list -> 0*)
    then 0
    else #1 (hd xs) + #2 (hd xs) + sum_pair_list(tl xs) (* #1과 #2를 더하고, 다음 element에 대해 계속*)

(* (int*int) list -> int list *)
fun firsts (xs : (int * int) list) =
    if null xs (* Empty list -> []*)
    then []
    else (#1 (hd xs))::(firsts(tl xs)) (* xs의 hd 중 첫번째를 뽑음*)

(* (int*int) list -> int list *)
fun seconds (xs : (int * int) list) =
    if null xs
    then []
    else (#2 (hd xs))::(seconds(tl xs))

(* (int*int) list -> int list *)
fun sum_pair_list2 (xs : (int * int) list) =
    (sum_list (firsts xs)) + (sum_list (seconds xs))
```

# Let Expression
- Local variable을 정의할떄 쓰임
- **Syntax**
	- `let b1 b2 ... bn in e end`
- **Type-check**
	- 각 binding을 순서대로 돌아가며 check함
		- 앞선 binding을 뒤에서 사용 가능
	- 최종적으로 e 안에서 binding을 사용 가능
``` sml
let val x = 1 
in
	(let val x = 2 in x+1 end) (*여기서 x=2로 shadowing*) 
	+ (let val y = x+2 in y+1 end) (*여기서 x=1*)
	(* 최종 답은 7 *)
end
```
- Function
	- helper Function이 필요하며 다른 Function안에서 쓰이지 않을 때 let을 이용 정의 가능
```sml
(* int -> int list *)
fun countup_from1 (x:int) =
    let fun count (from:int, to:int) =
            if from=to
            then to::[]
            else from :: count(from+1,to)
    in
        count(1,x) (*[1,...,x]*)
	end
```
- 위 코드를 개선 가능.
	- `x` 는 `count`가 정의될 때, 같은 환경안에 존재함. 따라서 `x`는 항상 같은 값으로 존재하게 됨
	- 같은 scope의 다른 variable을 사용하는 것은 functional programming에서 흔한 테크닉임
``` sml
fun countup_from2 (x:int)=
	let fun count(from:int)=
		if from=x
		then x::[]
		else from :: count(from+1)
	in
		count 1
	end
```
- Local variable을 이용 expensive computation을 줄일 수 있음
``` sml
(* exponential growth *)
fun bad_max (xs : int list) =
    if null xs
    then 0 (* note: bad style; see below *)
    else if null (tl xs)
    then hd xs
    else if hd xs > bad_max(tl xs) (* call once*)
    then hd xs
    else bad_max(tl xs) (* call twice*)

(* linear growth *)
fun good_max (xs : int list) =
    if null xs
    then 0 (* note: bad style; see below *)
    else if null (tl xs)
    then hd xs
    else
        (* for style, could also use a let-binding for hd xs *)
        let val tl_ans = good_max(tl xs)
        in
            if hd xs > tl_ans
            then hd xs
            else tl_ans
		end
```
- let expression을 이용해 $O(2^n)$을 $O(n)$으로 바꿈

# Options
- [[#Let Expression | 이전 예시]]에서 empty list를 잘 다루지 못함 
	- empty -> 0.실제 max가 0이 아닌게 문제임
	- 해당 문제를 합리적으로 해결할 필요가 있음
	- 실제 max 값을 return하거나, list가 비어있어 no maximum을 표현할 필요가 있음
	- options 사용 가능
		- 0 또는 1개의 요소를 표현하게 됨
			- `NONE`은 아무것도 없는 상태임. type : `'a option`
			- `SOME e`. `e -> v`로 계산됨. type: `t option` `e`의 `type`이 `t`일때 성립함
- `isSome`을 이용해서 활용 가능함
	- `isSome(NONE) -> false`
	- `valof(SOME e)` -> `SOME`이 가지고 있던 value(e의 계산 값)를 가져옴
``` sml
(* 앞에서 0으로 return 하는 문제를 해결함*)
fun better_max (xs : int list) =
    if null xs
    then NONE
    else
        let val tl_ans = better_max(tl xs)
        in if isSome tl_ans andalso valOf tl_ans > hd xs
			then tl_ans
           else SOME (hd xs)
        end
```
- Local helper function을 이용 위 코드 개선
	- 위 코드에서 `SOME`이 추가된 것 말고 크게 개선된 점이 없다
``` sml
fun better_max2 (xs : int list) =
    if null xs
    then NONE
    else let (* fine to assume argument nonempty because it is local *)
            fun max_nonempty (xs : int list) =
                if null (tl xs) (* xs must not be [] *)
                then hd xs (* Recursion으로 인해 맨 마지막 item 부터 시작 -> back tracking?*)
                else let val tl_ans = max_nonempty(tl xs) 
                     in
                         if hd xs > tl_ans
                         then hd xs
                         else tl_ans
					end
		in
            SOME (max_nonempty xs)
		end
```

# Some Other Expressions and Operators
- 유용한 operations
- `e1 andalso e2` 
- `e1 orelse e2`
- `not e`
- `e1 = e2` : compare
- `not (e1 = e2)` better style **==`e1 <> e2`==**
- `<,>,<=,>=`
- `~e`

# Lack of Mutation and Benefits Thereof
- ML에서 `list`,`tuple`등의 내부 Item을 바꿀 수 없음
- assignment statement가 존재하지 않는다
- **==mutation이 불가능하다==**
- Immutable은 강력한 기능 중 하나임
	- aliasing을 방지함
```sml
fun sort_pair (pr : int*int) =
    if (#1 pr) < (#2 pr)
    then pr
    else ((#2 pr),(#1 pr))
```

- 위 코드의 `then` branch 에서는 *copy*를 return 또는 `alias`를 return?
	- ML에서는 aliasing이 되었는지 알 방법이 없다(?)
	- Mutation이 안되니까 aliasing이 안됬다는 얘기?
	- **==위 코드에서는 aliasing이 됨==**. 왜냐하면 좀 더 효율적이기 때문에
	- 아래 예제는 비효율적인 방식임
```sml
fun sort_pair (pr : int*int) =
    if (#1 pr) < (#2 pr)
    then (#1 pr, #2 pr)
    else ((#2 pr),(#1 pr))
```

- 위 방식으로 할 경우 새롭게 Pair를 만들기 때문에 비효율적임
- 결론적으로, mutation이 안되기 때문에 aliasing이 된다해도 원본 데이터가 변형될 걱정을 하지 않아도 된다
	- 또한 매 회 `copy`를 하는 방식이 아니기 때문에 좀더 효율적이다

- 두번째 예제
```sml
fun append (xs : int list, ys : int list) =
    if null xs
    then ys
    else (hd xs) :: append(tl xs, ys)
```
- 위 예제에서 `aliasing`이 일어나는가?
	- 답할 수 없지만, 위 경우에는 yes임
		- `ys`를 이용해 새 List를 만들고 있기 떄문임. `ys`를 이용해 공간을 절약함(메모리 얘기인 듯)



---
# Study Question
- Dynamic과 Static enviroment의 차이는?
- Current, any ___ environment 의 차이는? 
- function is a value의 뜻은?
- Function calls 부분이 잘 이해가 되지 않는다
- immutable이 그렇게 중요한 이슈인가([[#Lack of Mutation and Benefits Thereof]])?
	- 다시 말하면 aliasing을 다루는 문제가 어떤게 좋은 방법인지를 모르겠다. 왜냐하면 어떤 경우엔 aliasing을 일부러 발생시키는 경우도 있었음

# Summary


#Programming #StandardMachineLanguage #Coursera #functionalProgramming