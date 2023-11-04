---
lastmod: 2023-11-04
---
# 1 Introduction to optimization
- Derivative를 배우는 이유는 최적화를 하기 위함임
	- 여기서 최적화란 주어진 문제에 대해 최대 또는 최소값을 구하는 것을 뜻함
- 그래서 max,min을 구하려면
	- optimization space가 differentiable 해야한다
	- derivative값이 0일때는, local optima일 수도 있다

# 2 Optimization of squared loss - The one powerline problem
- 전신주에 가깝게 집을 짓는 예제를 통해 학습
- 1차원 상에서, 각 전신주에 멀어질수록 공사비가 증가한다고 가정함
- 1차원 상 집의 위치를 $x$, 전신주의 위치를 각각 $a,b,c$라고 하면