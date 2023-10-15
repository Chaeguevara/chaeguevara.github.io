---
created date: 2023-10-15
---

# 목표
- Value-based methods 와 Q-Learning을 중심으로 진행함
- Q-Learning Agent를 처음부터 implementation할 것임
- Agent는 두가지 환경에서 학습 시킬 것임
	- Frozen-Lake-v1 (non-slippery version) : 특정 state(s)에서 goal state(g)로 감. 이 과정에서, Fronzen tile(F)로 걷고, 구멍(H)는 피함(아래 그림 중 우측)
	- An autonomous taxi: 도시를 누비며 승객을 A 지점에서 B 지점까지 태워다 주는 환경
- Monte Carlo와 Temporal Difference Learning(TD)의 차이를 배우게 됨
![[envs.gif]]
# Two types of value-based methods
Value-based methods 에서는 각 ==state에 대한 할인 기대 보상(expected discounted return)의 mapping function을 학습==시키게 됨. 이 mapping function을 *==Value function==* 이라 함
![[Pasted image 20231015201408.png]]

어떤 state의 <u>할인 기대 보상</u>은 agent가 ==특정 state에서 시작해 Policy에 따라 행동할때 얻는 보상을 뜻함==.

> [!attention] Value-based에서 policy란?
> 위 문장에서 "Policy를 따라" 라고 했지만, value-based에서는 value function을 학습시킴. 따라서 여기서 Policy란 무엇인가

RL Agent의 목표는 Optimal Policy $\pi^{*}$를 학습시키는 것임
Optimal Policy를 학습시키는 방식은 두가지가 있음
- [[Unit1 - Introduction to Deep Reinforcement Learning#Policy-Based Methods | Policy based method]] : state에서 취해야할 action을 바로 학습시킴. 이때 value function은 없음
![[Pasted image 20231015202723.png]]
	-  따라서 우리가 Policy를 지정하는 것이 아닌 **==학습을 통해 Policy를 정의하게 됨==**
- [[Unit1 - Introduction to Deep Reinforcement Learning#Value-based method | Value based method]] : Value funtion은 state또는 state-action pair의 value를 내보냄. Value function을 기준으로 policy가 행동을 취함
	- Policy를 학습시키는 것이 아니기 때문에, Policy에 해당하는 행동을 정의해야함
	- 예를 들어 항상 가장 큰 보상 방향으로 행동하려면 **==Greedy Policy==** 로 할 수 있음
![[Pasted image 20231015203810.png]]

어떤 경우에도 ==Policy는 가지게 됨==. Value-based에서 policy는 미리 정의한 간단한 function임

## Policy와 Value-baesd의 차이점
다시 쓰면 이 둘의 차이점은 다음과 같음
- Policy-baesd : Optimal policy($\pi^{*}$)는 학습을 통해 바로 찾게 됨
- Value-based : optimal value function($Q^{*},V^{*}$)을 찾는 것이 optimal policy를 찾게 해줌
![[Pasted image 20231015205545.png]]
> [!question] Value와 Policy는 밀접한 관계로 보임
> Policy를 어떻게 정햐느냐 따라 한 state의 value도 정의가 달라질 것 같음.

보통은 **==Epsilon-Greedy Policy==** 를 사용해 [[Unit1 - Introduction to Deep Reinforcement Learning#Exploitation / Exploration|exploration/exploitation trade-off]]를 다루게 됨 