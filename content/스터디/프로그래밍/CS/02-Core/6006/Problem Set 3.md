---
lastmod: 2024-04-25
---

# 1 Ananagram Archaeoogy
해당 문제를 풀기 위해서는 anagram이 무엇인지 알아야 한다. anagram은 한 문자열에 대해 해당 문자열의 순서를 바꿔서 생기는 조합을 뜻한다. 가령 "car"라는 단어가 있으면 이 단어의 anagram은 `["car", "arc", "rac", "cra", "rca", "acr"]`가 있다. 대문자까지 고려하면 복잡해지니, 해당 문제에선 ==소문자만 취급==한다.
이 문제에서 다뤄야 하는 것은 A라는 문자열에 B문자열의 anagram의 갯수를 세는 것이다. 원문의 문제를 그대로 가져와 본다면 `A = ’esleastealaslatet’`이라하고 `B='tesla'`라고 하면 `A`안의 `B`의 anagram은 `('least','steal','slate')`가 존재한다. 따라서, ==답은 3==이 된다. 이 문제를 풀기위해 각 단계를 증명해 나가는 문제다. 나는야 그림쟁이 위 과정을 그림으로 그려보면 아래와 같다.

![[Pasted image 20240425184048.png]]

위 A안에 B의 Anagram을 구한다 할때

![[Pasted image 20240425184237.png]]

이 그림처럼 3개의 Anagram을 구할 수 있다.

 > [!important] 문제는 항상 호락호락하지 않다! 이제 위 문제를 효율적으로 푸는 방법을 한단계씩 해보자

## 1.1 하나의 문자열 안에 있는 또 다른 문자열의 갯수 구하기
말을 쓰다보니 어려워졌지만 ==위 예시에서 나온 문제==와 같은 말이다. 문자열 `A`와 `B`가 있을때, `A`안에 `B`의 anagram을 구하는 자료구조를 설명하는 부분이다. 그렇다면 주어진 조건을 보자

---

$$
\text{(1),(2)의 조건이 주어졌을때}
$$

$$
\begin{align}
A,B : String  \\
|B| = k \\
\end{align}
$$
---
$$
\text{(3),(4)를 만족하는 자료구조를 설명하시오}
$$
$$
\begin{align}
\text{Build data structure} : O(|A|) \\
\text{A 안에 나타나는 B의 Anangram count} : O(k)
\end{align}
$$

---

문제를 풀기 위해서는 생각을 조금 바꿔야한다. 나는 최초에 anangram을 직접 구해야 한다고 생각했다. 하지만 서로가 ==anagram이 되는 조건을 생각==하면 해답에 접근할 수 있다. ananagram은 알파벳의 출현빈도만 같으면 된다. 

가령 예를 들면
```javascript
car => {a:1, c:1, r:1}
arc => {a:1, c:1, r:1}
```

우리는 CNN을 아니까 CNN에서 빗대어 설명해보면 이렇다. Window size가 k 이고 stride가 1인 1D CNN을 돌려서, `A`에 대해 Hash table을 만들면 된다.  `A="aaabc"`라고 가정하고 1D CNN을 해보자
```python

A = "aaabc"
B = "aaa" #k=3
k = len(B)

#build first O(k)
a1 = [3,0,0,...] #aaa O(k)
a2 = [2,1,0,...] #이때 처음부터 계산하는 것이 아니라 alphabet a에 대응되는 index의 값을 -1하고, b에 대응되는 위치를 +1 준다 O(1)
a3 = [1,1,1,...] # 마찬가지로 처음부터하지 않고 변화량 만큼만 더하고 뺀다 O(1)

```

따라서 위 과정을 반복하게 되면 $O(k+1*n)$의 복잡도를 가지며, $n$이 더 크기 때문에 최종적으로 $O(n) = O(|A|)$의 복잡도를 가지게 된다. 자 그럼 이제 search time으로 넘어가보자 참고로 (2)에서 $O(k)$면 됬다. 코드레벨로 바로 넘어가보자

```python

A = "aaabc"
B = "aaa" #k=3
k = len(B)

H = dict()
#build first O(k)
a1 = [3,0,0,...] #aaa O(k)
a2 = [2,1,0,...] #이때 처음부터 계산하는 것이 아니라 alphabet a에 대응되는 index의 값을 -1하고, b에 대응되는 위치를 +1 준다 O(1)
a3 = [1,1,1,...] # 마찬가지로 처음부터하지 않고 변화량 만큼만 더하고 뺀다 O(1)

H[a1] = 1
H[a2] = 1
H[a3] = 1

b = [3,0,0] # k를 모두 순회 => O(k)
print(H[b]) #1 => got answer

```
이러하다. 여기까지하면 거진 다 되었다.

## 1.2 이번엔 하나의 문자열 T와 k길이의 문자열 n개
이번 문제는 점수도 작고 비교적 쉬운 내용이다. 또다시 Latex로 써보자
$$
\text{주어진 조건이 (5),(6),(7),(8),(9) 같을 떄}
$$
$$
\begin{align}
T,S_i: string \\
S = (S_0,...,S_{n-1}) \\
|S|=n \\
|S_n| = k \\
0 < k < |T| 
\end{align}
$$
$$
\text{아래 조건을 만족하는 자료구조}
$$
$$
\begin{align}
\text{T 에서 발생하는 }S_i의 \text{anagram의 갯수를 } A = (a_0,\dots,a_{n-1})으로 구하며 \\
O(|T|+nk)의 complexity
\end{align}
$$

우선 앞에서 봤듯, k 길이만큼 T의 anagram을 만들면 O(|T|)시간이 걸린다. $S$의 각 item의 경우, frequency table을 만드는데 $k$, hash table의 값을 증가시키는데 $c$, 해당 작업을 $n$번해서 전체 걸리는 시간은 $O(|T|+cnk) = O(|T|+nk) $가 된다.