---
category:
  - math
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


#LinearAlgebra #math 