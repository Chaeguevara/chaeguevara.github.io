# Solving Linear Systems: 2 variables
- `Python`과 `numpy`를 쓰는 법을 학습하는게 주 목표임
	- linear equation을 푸는 `numpy` 패키지 사용법ㅇ르 배움
	- Elimination 방법을 이용해 linear equation을 푸는 법을 학습함
	- determinant와 matrix singularity의  관계를 평가함

## 메트릭스를 이용해 Linear equation을 표현하고 풀기
$$
\begin{cases} 
-x_1+3x_2=7, \\ 3x_1+2x_2=1, 
\end{cases}\tag{1}
$$
- $x_1,x_2$ 이라는 두 변수를 가진 식임. 
- **==문제를 푼다는 뜻==** 은 $(1)$의 두 식을 동시에 만족하는 $x_1,x_2$을 찾는 것임
- **==inconsistent와 consistent의 정의==**
	- 문제의 해답이 없는경우를 inconsistent라고 하고, 하나의 정답이 있거나, 무한히 많은 경우를 consistent라고 함
### Solving Systems of Linear Equations using Matrices
- 두 식을 가진 Linear system을 손으로 푸는건 쉬움. 그러나 더 복잡한 경우를 위해 풀이 방법을 알아둘 필요가 있음
- `numpy`의 `np.linalg.solve(A,b)`를 이용하면 됨
	- $A$는 (1)을 예로들면 **==좌변의 식을 Matrix형태==** 로 가지고 있음
	- $b$ 우변의 coefficients를 **==1-D array 형태==**로 가지고 있음


#numpy  #python 