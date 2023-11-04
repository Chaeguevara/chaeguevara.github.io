---
lastmod: 2023-11-04
---
# 1 Machine Learning Activation
- Feature가 주어졌을때, 이를 통해
	- Linear Regression을 하는 것
		- 방의 갯수와 집값의 상관관계
	- Classification 등을 할 수 있다.
		- 문장에 나타난 특정 단어의 수와 감성의 상관관계

# 2 Motivation to Derivatives
- 속도 추정
	- 시간과 이동한 거리가 주어진다면
	- 시간 간격이 더 촘촘하게 주어진다면 해당 간격에서 속도를 더 잘 추정할 수 있음
	- 

# 3 Derivatives and Tangents
- 앞의 예제는 Tabular data 였음. Smooth 한 커브 그래프가 주어진다면 이야기가 달라짐
- 속도 예제를 계속 가져가면 다음과 같다
	- 이동거리 증가분 / 미분(derivative)은 아주 작은 시간 변화분 으로 표현 가능하다
	- $\frac{\Delta y}{\Delta x}$를 미분은 아니고 $\frac{riser}{run}$이라 하면 미분은 아주 미세한 값으로 표현한다. 아래와 같이 적는다
	- $\frac{\mathrm{d}y}{\mathrm{d}x}$
	- 학교에서 배운 ==접선의 기울기==

# 4 Slopes, maxima and minima
- Tangent가 0이면 -> `maxima` or `minima`

# 5 Derivatives and their notation
- *Lagrange's notation*
	- $f^{\prime}(x)$
- *Leibniz's notation*
	- $\dfrac{\mathrm{d}}{\mathrm{d}b}f(x)$

#derivative
