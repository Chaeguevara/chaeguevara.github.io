---
lastmod: 2023-12-09
due date: 2023-12-09
category:
  - ComputerScience
---
교수의 참 쉽죠라는 말처럼 그냥 재미있다 보고 있다가 슬슬 어려워지는것 같아 내용을 정리해서 넣어본다

# 1 ML에서 Racket으로 넘어가기
여러가지가 이유가 있겠지만 이제는 racket으로 넘어간다. 내 생각에는 dynamic type environment를 체험시켜주려는 의도인 것 같다. 인터넷을 좀 찾아봐도 Racket이라는 언어의 유용성은 그닥 찾아볼 수 없다. 프로그래밍에서 필요한 용어와 개념을 익히기 위한 것이라고 생각하면 편할 듯 싶다.

## 1.1 역사
이 아저씨는 Racket을 좀 좋아하는 모양이다. 간단한 역사는 이렇다고 한다. LISP라는 언어가 Scheme이 되고, Scheme이 Racket이 되었다.

# 2 Syntax들어가기
앞의 ML에서 말했듯 언어에선 3가지가 중요하다. Syntax(문법), Semantic(그래서 니가 쓴게 무슨 의미를 가지느냐), evaluation(그래서 쓴게 어떤 값을 가지느냐). Syntax는 거의 ==괄호살인마 수준==이다

```racket
#lang racket
```
특이한 언어다. 본인이 racket이라는 것을 알려줘야 하는 모양이다

## 2.1 Binding(여기서는 definition)은 이렇다
```racket
(define a 3)
```
Binding이란 다른 언어에서 `a=3`하는 것과 같은 뜻을 가진다. 

## 2.2 Operation
Operation이라 함은 더하기 빼기 등과 같다. Binding과 합체해보면 이렇다
```racket
(define a (+ a 5))
```

## 2.3 Anonymous function
이 부분은 나도 아직 좀 헷갈리긴 하지만 개념적으로 여러개의 argument를 받기 위해선 currying을 쓴다. 이 중 간편하게 하는 방법이 Anonymous function이다. 한번 써보고 돌려봐야겠다
```racket
(define cube1
	(lambda (x)
		(* x (* x x))))
```


![[Pasted image 20231122223114.png]]


위 그림에서 줄이 좀 흐트러지긴 했지만 argument하나를 받아서 잘 작동하는 것을 볼 수 있다. Racket에서 multiplication은 여러 argument를 받을 수 있다

```racket
(define cube2
	(lambda (x)
		(* x x x)))
```
이것도 세제곱을 해준다는데.

계속해서 하면 power도 할 수 있다 이걸 Recursion으로 쓰면 다음과 같다
```racket
(define power
	(lambda (x y)
		(if (= y 0)
		1
		(* x (power x (- y 1))))))
```
강의 에서는 Anonymous function을 썻음에도 Recursion이 되는것을 강조하던데 나는 크게 감응을 느끼진 못했다.

![[Pasted image 20231122223932.png]]


아무튼 돌려보면 위와 같다

Anonymous function과 Currying은 여러개의 argument를 받기 위함인데(이 내용은 Part A에서 나왔던 내용인데 다시 정리해 보겠다) 어떤 오퍼레이터는 그냥 여러 Argument를 동시에 연산해주기도 단다. 대표적으로 곱하기가 있는데 이를 보면 아래와 같다

```racket
(define (cube3 x)
	(* x x x))
```

그리고 또다시 currying을 쓰는 예제를 보면 아래와 같다

```racket
(define pow2
	(lambda (x)
		(lambda (y)
			(if (= y 0)
			1
			(* x ((pow2 x)(- y 1)))))))
```

위 예제 코드를 직접 써서 돌려보면 상당히 번거롭다. 왜냐면 ()를 많이 써줘야 한다. 그래서 등장하는게  Syntactic sugar. 여기에 정리하지 않았지만 ==같은 동작을 좀더 적은 수의 typing을 통해 해결하는 것을 Syntactic surgar== 라고 이해하면 된다.

```Lisp
(define ((pow3 x) y)
	(if (= y 0)
	1
	(* x ((pow3 x) (- y 1)))))
```

Syntax가 상당히 헷갈리기는 하지만 적응되면 할 수 있는 문제라고 생각한다.  수학식에서 마치  $g(f(x))$를 한다고 생각하면 좀 편할지 모르겠다. 

**List**는 5개의 primitive가 존재하며 책 교재 그대로 가져오면 아래와 같다.

| primitive      | 설명 | 예시|
| ----------- | ----------- | -----------|
| null      | 빈 리스트       | null|
| cons   | 리스트를 만듬        | (cons 2 (cons 3 null))|
| car   | 리스트의 첫 아이템을 가져옴        | (car some-list)|
| cdr   | 리스트의 첫 아이템을 제외한 것(tail)을 가져옴        | (cdr some-list)|
| null?   | 리스트가 비어있으면 `#t` 아니면 `#f`        | (null? some-value)|

List를 만들때 `cons`를 쓰지 않아도 된다. python이랑 유사하게 `(list 2 3 4)`의 형태로 써도 되고 `(cons 2 (cons 3 (cons 4 null)))`로 써도 된다. 마찬가지로 List의 각 item은 같은 Type일 필요는 없다. `list( #t "hi" 14)`처럼 써도 에러가 없다

책을 그대로 카피해서 `map`과 `append`를 써보면 아래와 같다.

```Lisp
(define (map f xs)
	(if (null? xs)
	null
	(cons (f (car xs)) (map f (cdr xs)))))
```

```lisp
(define (append xs ys)
	(if (?null xs)
	ys
	(cons (car xs) (append (cdr xs) ys))))
```

```lisp
(define (sum xs)
	(if (null? xs)
	0
	(+ (car xs) (sum (cdr xs)))))
```

직접 적용해본 코드는 https://github.com/Chaeguevara/UWProgrammingLanguage/blob/main/PartB/Week1/01_intro_to_rkt.rkt 에 저장했다.