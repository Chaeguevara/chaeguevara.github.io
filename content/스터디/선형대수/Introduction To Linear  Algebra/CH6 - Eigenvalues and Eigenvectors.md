---
category:
  - math
---
# 1 Introduction to Eigenvalues

앞의 챕터가 $Ax=b$의 문제를 해결하는 거라면, 여기서는 **변화**에 대한 이야기임. Eigenvector로 해결하려는 것은 문제를 단순하게 푸는 것임. ==가령 어떤 벡터에 대한 답이 그 벡터에 단순히 크기만 곱하게 된다면 문제를 쉽게 풀 수 있게 됨.==

가령 벡터의 제곱을 구한다면, 제곱을 계속하면 *eigenvector*에 가까워짐
$$
\begin{equation}
	\begin{split}
	A,A^2,A^3 = 
		\begin{bmatrix}
		.8 & .3 \\
		.2 & .7 \\
		\end{bmatrix}
		\begin{bmatrix}
		.70 & .45 \\
		.30 & .55 \\
		\end{bmatrix}
		\begin{bmatrix}
		.650 & .525 \\
		.350 & .475 \\
		\end{bmatrix}
		\;\;\; A^100 \approx
		\begin{bmatrix}
		.6000 & .6000 \\
		.4000 & .4000 \\
		\end{bmatrix}
	\end{split}
\end{equation}
$$

*eigenvalue*를 이용하면 100제곱을 하는게 아니라 한방에 찾을수 있다.
> [!question] 아직은 무슨소리인지 제대로 감이 안오지만 일단 알아보자

> [!cite] eigenvector의 정의
> 어떤 matrix $A$를 벡터 $x$에 곱해도 그 방향이 변하지 않는 벡터.
> 
> $Ax = \lambda x$ 
> 
> $\text{where } \lambda  \text{ is an eigenvalue of A}$

^4b3748

일반적으로 2by2 메트릭스의 경우 두개의 eigenvalue를 가짐. 하지만 eigenvalue가 0 이나 1이 될 수도 있음. 그러면 아래와 같은 경우가 발생함
> [!example] unusual case of $\lambda$
> 1. $\lambda=1 -> Ax=x$
> 2. $\lambda=0 -> Ax=0(nullspace)$

> [!question] nullspace는 뭔지 아직 모르니 일단 넘어가자

unusual한 경우는 일단 제끼고 이 챕터에서는 $det(A-\lambda I)=0$ 인 내용을 주로 다룬다. $det(A-\lambda I)=0$ 이 성립하는 이유는 나중에 유도한다. 우선 예시를 통해 $\lambda$를 구해본다

> [!example] 예시1. 메트릭스 *A*의 eigenvalue 구하기. $det(A-\lambda I)=0$
> $$
> A = 
> \begin{bmatrix}
> .8 & .3 \\
> .2 & .7
> \end{bmatrix} \; \;
> det
> \begin{bmatrix}
> .8-\lambda & .3 \\
> .2 & .7-\lambda
> \end{bmatrix} \;
> = \lambda^2 - \frac{3}{2}\lambda + \frac{1}{2} = \left(\lambda-1 \right)\left(\lambda - \frac{1}{2} \right)
> $$

위 식을 풀면 $\lambda=1$,$\lambda=\frac{1}{2}$를 구할 수 있다. 이를 [[#^4b3748|Eigen vector의 정의]]에 대입해보면 $A-\lambda I$는 Singular가 된다. 그러면 $x_1,x_2$는 각각 $A-I, A-\frac{1}{2}I$의 nullspace에 놓이게 된다.
- $(A-I)x_1=0$ -> $Ax_1=x_1$이 되서 첫번째 Eigenvector는 $(.6,.4)$
- $(A-\frac{1}{2}I)x_2=0$ -> $Ax_2=\frac{1}{2}x_2$이 되서 첫번째 Eigenvector는 $(1,-1)$
- 이 내용을 [[#^4b3748|Eigen vector의 정의]]에 대입하면
- $x_1 = \begin{bmatrix}.6 \\ .4\end{bmatrix}$ -> $Ax_1 = \begin{bmatrix}.8 & .3 \\ .2 & .7 \end{bmatrix}\begin{bmatrix}.6 \\ .4\end{bmatrix} = x_1$
- $x_2 = \begin{bmatrix}1 \\ -1\end{bmatrix}$ -> $Ax_2 = \begin{bmatrix}.8 & .3 \\ .2 & .7 \end{bmatrix}\begin{bmatrix}1 \\ -1\end{bmatrix} = \begin{bmatrix}.5 \\ -.5\end{bmatrix}$

> [!question] $x_1$이 꼭 $(.6,.4)$ 이여야 하나. 식을 풀이해보면 큰값도 가능해 보이는데. 일단 제낀다

^47039f

> [!done] 크기가 다른(평행한) eigenvector를 써도 상관없음. Resonable하면 됨.  현재 챕터에서 $\begin{bmatrix}.6 \\ .4\end{bmatrix}$외 다른걸 고르면 수렴하는 모습을 보여 줄 수 없음
> [^1]



그래서 위 식이 의미하는게 무엇인가. [[#^4b3748|Eigen vector의 정의]]에다가 양변에 $A$를 곱하면 유도되는 성질이기도 하지만 적어보면 아래와 같다
1. $A^n$을 해도 eigenvector는 변하지 않는다. 다시말하면 방향은 그대로다
2. $A^n$을 하면 eigenvalue는 $\lambda^n$이 된다.
원문에는 그림으로 설명되어 있지만 저작권 문제가 있을거 같아 캡쳐는 하지 않는다.

A의 첫번째 column을 두 eigenvector의 linear combination으로 표현해서 곱하기를 계속해보면(방향이 변하지 않을때 계산이 편리함을 보여주고 싶은 듯)
$$
\begin{bmatrix}
.8 \\
.2
\end{bmatrix}
= x_1+(.2)x_2 
= 
\begin{bmatrix}
.6 \\
.4
\end{bmatrix}+
\begin{bmatrix}
.2 \\
-.2
\end{bmatrix}
$$
그렇다면 아래와 같은 식이 성립함
$$
A\begin{bmatrix}.8\\.2\end{bmatrix} = Ax_1 +.2Ax_2 = x_1 + .2\frac{1}{2}x_2 = \begin{bmatrix}.6\\.4\end{bmatrix} + \begin{bmatrix}.1\\-.1\end{bmatrix} = \begin{bmatrix}.7 \\ .3\end{bmatrix}
$$
이 과정을 반복하면 아래와 같아짐. ==다시 쓰면 두 칼럼중 왼쪽 칼럼이 결국 eigenvector로 수렴함을 보여주고 싶었던 것으로 보임==. 하지만 오른쪽 칼럼도 마찬가지로 수렴하게 될 것임
$$
A^{99}\begin{bmatrix}.8\\.2\end{bmatrix} 
= Ax_1 +.2Ax_2 = x_1 + .2\left(\frac{1}{2}\right)^{99}x_2 
= \begin{bmatrix}.6\\.4\end{bmatrix} + \begin{bmatrix}very \\ small \\ vector\end{bmatrix} 
$$
> 굉장히 유용한 방식으로 보임. 

$x_1$은 안정적인 상태($\lambda=1$)이고 $x_2$는 점차 줄어드는(decay($\lambda=0.5$)) 상태임. 

위 $x_1$과 같이 안정적인 상태의 eigenvalu와 eigenvector를 가질 때 $\text{matrix }A$를 **Markov matrix**라고 하며 이 내용은 나중에 다룬다



 [^1]: 21. Eigenvalues and Eigenvectors_, (2019). Accessed: Oct. 29, 2023. [Online Video]. Available: [https://www.youtube.com/watch?v=cdZnhQjJu4I](https://www.youtube.com/watch?v=cdZnhQjJu4I) 



#eigenvalue #eigenvalue #LinearAlgebra 