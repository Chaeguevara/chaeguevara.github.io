---
lastmod: 2023-11-22
due date: 2023-12-04
---
# 1 CH1 The role of Algorithms in Computing
- 알고리즘이란
	- 어떤 값을 받고, 유한한 시간내에 처리해서 어떤 값 또는 값의 집합을 출력해주는 계산절차
	- 잘 정의된 계산 문제를 풀어주는 도구
	- 예시) sorting algorithm
		- Input : $\text{A sequence of n numbers} <a_1,a_2,...,a_n>$
		- Output: $\text{A Permutation (recordering)} <a^{\prime}_1 \le a^{\prime}_2 \le...\le a^{\prime}_n>$
	- input sequence를 `instance`라고 함. 일반적으로 `instance of a problem`
	- 올바른 알고리즘은 주어진 계산 문제를 해결함
		- 올바른 상태는 instance에 대해 문제를 해결하고
		- 유한한 시간내에 문제를 해결함
- Data structure
	- 데이터를 저장하고 관리하는 방법이며 이는 데이터 접근 또는 변경을 용이하게 하기 위함
- Technique
	- 이 책을 통해 스스로 알고리즘을 디자인하거나 진단하는 방법을 배움

## 1.1 Excercises
1. 정렬이 필요한 실생활 문제. 그 중 두 점 사이의 거리를 필요로 하는 문제
	1. 여러 식당 중 현재 위치에서 가장 가까운 식당위치 구하기
2. 속도 말고 실제 프로그래밍에서 고민할 문제
	1. 메모리
3. 실제 접해본 데이터 구조. 장점과 한계
	1. LL : 
	   장점 - Array와 다르게 메모리 공간상 고정된 공간을 차지할 필요가 없다. --> 유동적으로 메모리에 데이터를 분산가능
	   단점 - find를 하려면 $O(n)$이 걸림
4. Traveling sale person / shortest-paht
	1. shortest-path는 두 점간 최단거리를 구하면 됨
	   Traveling sale person은 여러 점을 이을때 가장 짧은 조합을 구해야 함
   