---
lastmod: 2024-05-30
---
# 1 그래프 탐색 방법
그래프를 탐색하는 방법 그 두번째 DFS. DFS를 쓰던 BFS를 쓰던 하나의 노드로부터 접근 가능한 모든 노드를 구한다는 개념 자체는 동일하다. 차이점이 있다면 깊게 파고들어갈 것이냐 한겹한겹 해결해 나갈 것이냐 선택의 문제가 된다. 6006에서는 Parent Tree라는 것을 이용해 하나의 노드로부터 접근 가능한 노드들의 합(연결된 노드들이니 path)을 구하게 된다. 그림으로 DFS와 BFS의 차이를 살펴보자.

![[Pasted image 20240530173140.png]]그림1 : 예시 그래프^c844e2

위 [[#^c844e2|그림1]]을 보자. <a style="color:red">빨간색</a>은 시작 노드를 뜻한다. 사실 아무거나 해도 되지만 편의를 위해서 처음 노드를 시작 노드로 하자. 자 그럼 BFS를 이용했을때 순서가 어떻게 되는지 살펴보자. 

# 2 BFS

![[Pasted image 20240530174145.png]]
그림2: BFS로 해결했을때 ^7fc0a0

[[#^7fc0a0|그림2]]에서 볼 수 있듯, BFS는 Level set을 기준으로 노드를 탐색하게 된다. 쉽게 비유하면 양파껍질 하나하나 벗기든 진행한다고 생각하면 된다. 같은 껍질(level)에 포함된 노드들은 그 안의 순서대로 순회를 하게된다. 위를 예시로하면 `[[0],[1],[2],[3,4],[5,6],[7]]`순서로 각 노드를 순회하고 어떤 계산을 수행하게된다. 여기서 어떤 계산이란 scope를 뜻한다. scope는 하나의 function이 열려있는 상태라고 이해하는게 편하다. 즉, BFS에선느 노드에 다다라는 순간 어떠한 계산이 바로 수행되게 된다. 

# 3 DFS
BFS가 양파 껍질을 벗기며 들어간다면 DFS는 외길인생이라고 볼 수 있다. DFS를 제대로 이해하려면 Backtracking도 알아야하지만 일단 내가 그 말뜻을 제대로 모르니 슬쩍 넘어가도록 하자. DFS는 Recursive Function의 형태를 띄고 있다. 이게 무슨말이냐. Scope가 열리는 시기와 닫히는 시기가 동시에 진행되지 않는다는 것이다. 그러니까 어떤 노드 k가 있으면 k번째에 scope가 해결되는 것이 아니라 k+n번째에 해결된다는 것이다. 무슨말이냐 오늘도 그림을 그린다.

![[Pasted image 20240530182215.png]]
그림3: DFS의 Scope가 열리는 순서 ^32cbcc

[[#^32cbcc|그림3]]을 이해하기 위해서는 DFS의 Pseudo code를 봐야한다. 강의에서는 `visit(u)`라는 표현을 썼다. 그대로 적어보면 아래와같다
```python
init P <- Empty array
P(s) = None
run visit(s)
visit(u):
	for every v in Adj(u) that does not appear in P:
		set P(v) = u and recurse visit(v)
```

자 그럼 위 코드를 기준으로 scope를 표시해보자
```python
visit(0) -> visit(1) ->visit(2) ->visit(3) -> complete(3) 
-> visit(4) -> visit(5) -> visit(7) -> visit(6) -> complete(6) ->
complete(7) -> complete(5) -> complete(4) -> complete(2) ->
complete(1) -> complete(0)
```

음 이렇게 쓰니까 보기 어렵다. 위의 level set과 비슷하게 해결된 순서대로 노드의 번호를 쓰면 다음과 같다. `[3,6,7,5,4,2,1,0]` 마지막으로 그림까지 그려보자

![[Pasted image 20240530185136.png]]
그림4: DFS에서 Scope가 해결되는 순서 ^e8a139

[[#^e8a139|그림4]]에서 볼 수 있듯, 가지의 끝에 있는 노드의 scope가 먼저 해결되고 시작 노드가 마지막에 해결되는 것을 볼  수 있다.

# 4 DFS의 python 코드
pseudo code를 보고도 python코드를 짤 수 있어야 진정한 개발자라고 할 수 있다. 아직은 부족하지만 늘 시도해본다

```python
def dfs(Adj,s,parent=None,order=None):
	if parent is None:
		parent = [None]*len(Adj)
		parent[s] = s
		order = []
	for v in (len(Adj)):
		if parent[v] is None:
			parent[v] = s
			dfs(Adj,v,parent,order)
	order.append(s)
	return parent,order
		
```

틀렸다. 다시 고쳐보면
```python
def dfs(Adj,s,parent=None,order=None):
	if parent is None:
		parent = [None]*len(Adj)
		parent[s] = s
		order = []
	for v in Adj[s]:
		if parent[v] is None:
			parent[v] = s
			dfs(Adj,v,parent,order)
	order.append(s)
	return parent,order
		
```

위 코드의 단점은 무엇일까. 만약 Graph안의 모든 노드가 하나의 path로 연결되어 있지 않거나, Directed Graph의 경우 방향떄문에 이전 노드는 탐색할 수 없는 단점이 존재한다. 따라서 모든 노드를 탐색하기 위해서는 'Full_xxx'가 필요하다. xxx라고 표현한 이유는 이 위치에 BFS 또는 DFS가 들어갈 수 있기 때문이다. 뭘 넣어야 할지는 각자 용도에 맞게 선택하면된다. 근데 나도 아직 어떤게 어떤 용도에 적합한지는 모르겠다. 아무튼 그래도 FULL버전을 적어본다


```python
def full_DFS(Adj):
	parent = [None]*len(Adj)
	order = []
	for v in len(Adj): #full scan
		if parent[v] is None:
			dfs(Adj,v,parent,order)
```

위 내용을 적어보니 이런 아이디어도 떠오른다. 만약 partial implementation을 적용할 수 있다면 function을 입력받아서 위 기능을 일반화 할 수 있을 것이다. 그건 일단 시간이 남으면 해보자

## 4.1 사서고생 : currying 또는 partial Implementation

에 그러니까... currying 또는 partial Implementation은 무엇이냐... [[Week4 - higher order functions]] 이 내용을 공부할때 나왔던 내용이다. function을 일반화 시킨 후 function을 입력값으로 받아 새로운 기능을 만드는 방식이다. 아주 쉬운 예제로 개념을 이야기해보자. 
수학식으로 표현하면 x,y를 더하는 function은 $f(x,y) = x+y$라고 표현할 수 있다. 그리고 이를 python 코드로 쓴다면 아래와 같다.
```python
def add(x,y):
	return x+y
```

그럼 이런 상상을 해보자. 만약 어느 숫자에 6만 더해야한다면? 그럼 식은 $g(x)=f(x,6)=x+6$으로 쓸 수 있다. 여기서 $g(x)$를 만드는 법. 이것을 currying이라고 한다. 좀더 들어가면 functional programming에 대해서도 다뤄야 하는데 나도 까먹었으니 넘어가도록 하자.

### 4.1.1 function을 return
function을 return한다는게 가장 적당한 표현이다. 일반적으로 컴퓨터에서는 `()`를 마지막에 붙여주면 기능을 실행하는 것이라고 한다. 그럼 거꾸로 말하면 ()를 붙이지 않으면 function 그 자체를 가져갈 수 있다는 말이다. javascript에서는 아주 명확하게 보이는 패턴인데 python에서는 그냥 때려 넣어본다

```python
add_6 = lambda x: add(x,6)
```
이렇게 쓰면 된다. lambda라는게 계산된 값이 아니라 function을 내보내게 된다. 그래서 add_6는 현재 function을 가지고 있다. 이제 여기에 원하는 값을 넣으면 function이 작동하게 된다. 다른 구문으로는 아래와 같이 쓸 수 있다.

```python
def add_6(x):
	return add(x,6)
```
자 그럼 위 패턴을 이용해 `Full_xxx`를 만들면 된다

### 4.1.2 Full_xxx

다시 Full_DFS를 가져오면...
```python
def full_DFS(Adj):
	parent = [None]*len(Adj)
	order = []
	for v in len(Adj): #full scan
		if parent[v] is None:
			dfs(Adj,v,parent,order)#function
```

그럼 위의 dfs부분을 argument로 받아서 설정하도록 만들면 된다. 그럼 우선 function을 입력받도록 코드를 수정해야한다. lambda를 써서 하는 코드와 def를 써서 하는 방법이 다르기 때문에 lambda기준으로 먼저 써본다

```python
def full_xxx(Adj,f):
	parent = [None]*len(Adj)
	order = []
	for v in len(Adj): #full scan
		if parent[v] is None:
			f(Adj,v,parent,order) #xxx
full_dfs = lambda Adj : full_xxx(Adj, dfs)

```

위처럼 쓰면 `f`에 `dfs`를 입력받는다. 그러면 코드 안의 f가 dfs로 치환된다. 그리고 lambda로 코드를 짰기 때문에 function이 return되게 된다. 