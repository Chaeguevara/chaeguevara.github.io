---
lastmod: 2024-04-09
---
#MIT #LinearSorting 
오늘도 신나게 해보자 알고리즘. Recitation5의 주제는 Linear Sort Algorithm이다. Sort를 몇강 울궈먹는 얘기 중 Lienar time $O(n)$으로 해결 가능한 알고리즘에 대해서 이야기한다. 내가 이해한 것을 기반으로 이야기하자면 Direct Access Array Sort -> Counting Sort -> Radix Sort 순서로 Linear Sorting Algorithm에 대해서 이야기 하는 내용이다. 그럼 타워다이브를 해본다


# 1 Direct Access Array Sort
> [!note] 메모리를 이용해 정렬을 수행하는 알고리즘. $O(u) \text{ where u is max key of array}$

한 Array를 정렬하는 방법 중 단순하게 떠올릴 수 있는 방법은, Array의 모든 아이템의 key값이 정수라 할때, 해당 정수에 대응되는 메모리 주소에 각 아이템을 놓고, 다시 이를 순서대로 traverse하면 정렬을 수행할 수 있다. 무슨얘기인지 이해가 안 갈 것이다. 그렇다면 오늘도 그림쟁이는 그림을 그려본다.

![[Pasted image 20240409202438.png]]

위와 같은 Array가 있다고 가정해 보자. 이 친구들을 Merge Sort를 통해 정렬하는 방식도 있다. 하지만 직관적인 방법으로는 위 Array를 traverse해서 가장 큰 key값을 찾은 후, 그 값만큼 array를 만든 후 대응되는 위치에 각 아이템을 넣을 수 있다. 이때 최대 key 값을 $u$로 표현한다. 이 내용을 이용해 크기 $u$인 array를 만들고 정렬을 시행하면 아래와 같다.

![[Pasted image 20240409205641.png]]

그러면 위 그림처럼 표현할 수 있다. 두 단계가 한꺼번에 표현되어 다소 복잡할 수 있으나 하나씩 뜯어보면 다음과 같다. 
1. 가장 큰 Key값 만큼의 Array를 만든다. 위 경우엔 2990(오타가 있지만 넘어가도록 하자)가 가장 큰 Key였기 때문에 해당 key 만큼 array를 만들어 주도록 한다
2. 그 후 각 원본 Array의 key를 새로 만들어진 Array의 index로 이용해 해당 아이템을 놓는다. 

여기까지 진행하면 사실상 Sort가 다 된것이나 다름없다. 마지막 작업으로 중간중간에 있는 None을 없애주면 된다. 코드를 쓰면 그렇게 어려운 부분은 아니니 큰 설명은 생략하도록 하자. 최종적인 모습을 표현하면 아래와 같다.

![[Pasted image 20240409211322.png]]

그럼 이 과정중에 생긴 Complexity는 어떨까? 하나하나 나열해 보자

1. 가장 큰 Key 값을 찾는다 => 최초 Array를 처음부터 끝까지 탐색한다. 이때 Array의 크기를 $n$, 가장 큰 key를 $u$라 하자  $\therefore O(n)$
2. u 크기의 array를 만든다 => $O(u)$
3. 기존 Array의 각 item의 key값을 이용 새로 만든 Array의 각 index에 item을 놓는다 => $O(n)$
4. 다시 새 Array를 만들어 정렬 순서대로 넣는다 => $O(u)$

이렇게 하면 Sort를 수행할 수 있다. 우선 해당 내용을 직접 적용한 코드를 아래 쓰고 그리고 여기서 질문해야 할 거리를 적은 후 다음 내용으로 넘어가보자
```python
def direct_access_sort(A:list) -> None:
	""" Direct Access Sort를 수행함. Aliasing을 이용해 Sort하기 떄문에 return None
	Args:
		A(list) : key,item으로 이루어진 Array
	"""
	u = 1 + max([x.key for x in A]) #위에서 편의상 int array로 했지만 수업내용 코드에선 일종의 object로 가정하고 시작함
	D = [None] * u #Direct Access Array 의 D
	for x in A:
		D[x.key] = x
	i = 0
	for key in range(u):
		if D[key] is not None:
			A[i] = D[key]
			i += 1
```



> [!question] Direct Access Array Sort의 한계와 $O(n)$
> Direct Access Array Sort의 한계는 다음과 같다.
> 1. 만약 같은 Key값이 있다면 어떻게 처리할 것인가?
> 2. $O(n)$의 Sort를 수행해야 하는데 $u$가 너무 큰거 아닌가?

위 두가지를 차근차근 해결해 나가보면 결국 $O(n)$에 다다를 수 있다. 바로 이어지는 Counting Sort는 Key가 중복되는 문제를 해결해준다.