---
created date: 2023-10-15
---

## Solving system of linear equations: Elimination
다음 식을 푸는 과정
$$
\begin{align*}
5a +b = 17 \tag{1}\\
4a -3b = 6 \tag{2}
\end{align*}
$$
- $(1),(2)$에서 a를 eliminiation하기 위해서 a 앞의 coefficient로 각 식을 나눔
$$
\begin{align*}
a +b/5 = 17/5 \tag{1}\\
a -3b/4 = 6/4 \tag{2}
\end{align*}
$$
- $(1)-(2)$를 해서 b를 구할 수 있음
- $b=2$ b를 대입하면 $a=3$
- 두 변수 중 하나의 coefficient가 0이라 하면 , a 또는 b가 정의 되기 떄문에 대입하면 풀 수 있음

Singular
- Singular는 redundant와 contradict가 존재함
- 이 경우 값이 소거가 되지 않거나 모순되기 때문에 **==무한한 값이 존재==** 하거나 **==답이 모순됨==**

## Solving system of linear equations: Solving system of equations with more variables

다음과 같은 식이 있다면
$$
\begin{align*} 
a+b+2c=12\tag{1} \\
3a-3b-c=3\tag{2} \\
2a-b+6c=24\tag{3}
\end{align*}
$$
1. a를 elimination하기 위해, 각 식을 a의 coefficient로 나눔

$$
\begin{align*} 
a+b+2c=12\tag{1} \\
a-b-c/3=1\tag{2} \\
a-b/2+3c=12\tag{3}
\end{align*}
$$
2. 첫번째 식($(1)$)으로 나머지를 빼면
$$
\begin{align*} 
a+b+2c=12\tag{1} \\
-2b-7c/3=-11\tag{2} \\
-3b/2+c=0\tag{3}
\end{align*}
$$
위 중 **(1)의 상태를 $a$가 isolated되었다** 고 말함

3. b를 elimination하기 위해서 $(2),(3)$에서 각 $b$앞의 coefficient로 나눈후 $(3) = (3)-(2)$를 하면
$$
\begin{align*} 
a+b+2c=12\tag{1} \\
b+7c/6=11/2\tag{2} \\
-11c/6=-11/2\tag{3}
\end{align*}
$$
마찬가지로 **==b가 isolated된 상태==** 임
4. c를 구했으니 이를 다시 하나씩 대입하면 $a,b,c$를 구할 수 있음

## System of equations to matrix
> [!tldr] Matrix 와 row echelon form
> equation을 푸는 과정에서 각 coefficeint를 elimination하게 됨. 이 과정에서 나오는 upper diagnaol matrix형태를 row-echelon form이라고 함. 여기에서 한단계 더 나아가, diagonal위에만 숫자가 남아있는 matrix를 reduced row-echelon form이라 칭함

아래 식을 Matrix로 표현하면 다음과 같음
$$
\begin{align*}
5a +b = 17 \tag{1}\\
4a -3b = 6 \tag{2}
\end{align*}
$$
$$
\begin{bmatrix}
5 & 1 \\
4 & -3
\end{bmatrix}
$$

위 식을 푸는 과정에서 matrix는 다음과 같이 변환되게 됨(중간과정, **==Row echelon form==** , upper diagonal matrix)
$$
\begin{align*}
1a +0.2b = 3.4 \tag{1}\\
 b = 2 \tag{2}
\end{align*}
$$

$$
\begin{bmatrix}
1 & 0.2 \\
0 & 1
\end{bmatrix}
$$

최종 해결 단계(**==reduced row echelon form==** , diagonal matrix)
$$
\begin{align*}
a= 3 \tag{1}\\
 b = 2 \tag{2}
\end{align*}
$$
$$
\begin{bmatrix}
1 & 0 \\
0 & 1
\end{bmatrix}
$$

### Row echelon form
아래와 같은 경우도 row echelon form 또는 upper diagonal matrix라고도 부름
$$
\begin{align*}
5a +b = 11 \tag{1}\\
10a +2b = 22 \tag{2}
\end{align*}
$$
$$
\begin{align*}
a + 0.2b = 2.2 \tag{1}\\
0a +0b = 0 \tag{2}
\end{align*}
$$


$$
\begin{bmatrix}
1 & 0.2 \\
0 & 0
\end{bmatrix}
$$
## Row operations that preserve singularity
> [!tldr] Row 연산을 해도 singularity에 변함이 없는 연산
> 한 row내 또는 각 row간 특정 연산을 했을때 singularity에 변함이 없는 경우를 보여줌
> 한 row에 임의의 scalar를 곱하거나, 한 row에 다른 row를 더한후 update해도 singularity에는 변함이 없음


# Rank of a matrix
## rank의 중요성
한 matrix가 얼마나 많은 정보를 가지고 있는지를 뜻함

## rank in ML
이미지 압축 예제
- Rank 200이미지를 각기 다른 Rank로 바꿀 시, 좀더 낮은 화질이지만 유사한 이미지를 얻을 수 있음
- 각 equation이 정보를 전달 할 수 있으면 rank = rank +1로 할 수 있음
- 정보를 전달할 수 있다는 것은 각 row가 서로 의존성이 없어야 함을 뜻함
	- 하나의 row가 다른 row의 배(linear dependent)인 경우 rank는 1
rank = rank - Dimension of solution space

# Rank of a matrix in general
3 by 3을 예시로 하면
- 각 row 가 independant 하다면 -> rank(3)
한 row가 다른 row에 dependent하면
- Rank(2)
==Row echelon form을 이용해 rank를 쉽게 구할 수 있음==


# Row echelon form
만드는 방법
1. 각 row의 첫 coefficient로 나눔
2. 두번째 row를 첫번째 row로 뺌
3. 그러면 두번째 변수의 값을 구할 수 있음

# Row echelon form in General
- Upper triangle 형태가 도도록 만드는 것
- Pivot은 각 row에서 가장 왼쪽의 non-zero위치를 뜻함
- 따라서 Rank는 # of pivots가 됨
- 일반적으로 pivot에 놓이는 숫자가 1이 되도록 함

Row echelon form을 만들어 pivot을 갯수를 구하게 된다. 이 pivot을 통해 rank를 구한다.

# Reduced row echelon form
Diagonal에만 숫자가 있는 경우
Rank와 Pivot이 같아야 함
각 pivot 위의 값은 모두 0
그래서 결론은



# Summary

# Questions