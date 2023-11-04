---
category:
  - math
lastmod: 2023-11-04
---

# 1 Determinants in Depth

## 1.1 Singularity and rank of linear tx

![[Pasted image 20231028192439.png]]
Singular matrix를 쓰면 line으로 transformation 하게 됨

Transformation 결과를 한장의 그림으로 요약하면 아래와 같음

![[Pasted image 20231028192624.png]]


## 1.2 Determinant as an area
$$
\begin{bmatrix}
3 & 1 \\
1 & 2
\end{bmatrix}
-> det(A) = 5
$$
![[Pasted image 20231028192824.png]]

Tx결과인 오른쪽을 잘 계산하면 면적이 나온다

![[Pasted image 20231028193111.png]]

Determinant가 negative인 경우는?

![[Pasted image 20231028193318.png]]

두 벡터의 순서에 따라 sign이 달라진다.

## 1.3 Determinant of a product
product를 했을 때 determinant는 어떻게 되는가

$$
\begin{bmatrix}
3 & 1 \\
1& 2
\end{bmatrix}
\begin{bmatrix}
1 & 1 \\
-2& 1
\end{bmatrix} = 
\begin{bmatrix}
1 & 4 \\
-3& 3
\end{bmatrix}
$$

$$
\begin{equation}
	\begin{split}
	det(A) = 5, \; det(B) = 3, \; det(C) = 15\; \\
	\text{where C}=A\cdot B\\
	det(AB) = det(A)det(B)
	\end{split}
\end{equation}
$$
면적으로 기억해도 됨

![[Pasted image 20231028194748.png]]
면적을 5배, 3배를 만드는 Linear transformation의 연속으로도 볼 수 있음


## 1.4 Determinant of Inverse

$$
\begin{equation}
	\begin{matrix}
		\begin{bmatrix}
			3 & 1 \\
			1 & 2
		\end{bmatrix}^{-1} &=
		\begin{bmatrix}
			0.4 & -0.2 \\
			-0.2 & 0.6
		\end{bmatrix}
		\\
		det =5  & det = 1/5
	\end{matrix}
\end{equation}
$$

$$
\begin{equation}
	\begin{split}
		det(A^{-1}) = \frac{1}{det(A)} \\ \\
		det(AB) = det(A)det(B) \\
		det(AA^{-1}) = det(A)det(A^{-1}) \\
		det(I) = det(A)det(A^{-1}) \\
		1 = det(A)det(A^{-1}) \\
		\therefore det(A^{-1}) = \frac{1}{det(A)}
	\end{split}

\end{equation}
$$

# 2 Eigenvalues and Eigenvectors
## 2.1 Bases in Linear Algebra 

**Bases란?**

![[Pasted image 20231029095958.png]]

각 공간에 있는 점은 base의 조합으로 표현 가능함. 이 정의에 따르면 한 plane에서 base는 여러가지가 될 수 있음

![[Pasted image 20231029100144.png]]

**Base가 아닌경우?**

![[Pasted image 20231029100216.png]]

같은 방향의 두 벡터의 경우 base가 될 수 없음



## 2.2 Span
벡터 둘의 조합으로 다다를 수 있는 모든 점들
두 벡터가 평행하지 않으면 ==평면==, 두벡터가 평행하면 ==라인==이 될 것임

basis is a miniminal spanning set

![[Pasted image 20231029100509.png]]

한 선은 하나의 vector로 모든 span을 표현 가능함. 따라서 두개의 벡터가 있는경우 이 친구들은 basis가 될 수 없고 하나만 선택

![[Pasted image 20231029100558.png]]
평면은 두개의 벡터로 span을 만들 수 있음. 따라서 세개의 vector는 redundant하기 때문에 basis가 될 수 없음

## 2.3 Eigenbaes
PCA 등에 매우 중요한 개념임

Matrix가 fundamental base에 미치는 영향

![[Pasted image 20231029101428.png]]


![[Pasted image 20231029101515.png]]
Scale되는 경우
**Stretch만 되는 경우**

왜 유용한가 -> Linear Tx를 간편하게 표현 가능함

![[Pasted image 20231029101652.png]]

- Eigen vector : TX와 평행한 두 벡터
- Eigen Value : Stretching value

## 2.4 Eigenvalues and Eigenvectors
Eigenvector를 찾는 법

![[Pasted image 20231029102203.png]]

https://www.youtube.com/watch?v=ajXb3N6QEqc

평행사변형을 이용해 Linear transformation을 만듬

![[Pasted image 20231029103222.png]]

Eigenspace는 TX후에도 자기 자신인 것들( Eigenvector로 정의 되는 각 선)


좀더 자세한 내용은 [[CH6 - Eigenvalues and Eigenvectors]]에 정리함


#LinearAlgebra #math #eigenvalue #eigenvector