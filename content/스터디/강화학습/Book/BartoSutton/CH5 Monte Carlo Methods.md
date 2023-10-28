---
category:
  - rl
---

환경에 대해 전체를 파악하지 못할때 쓰는 방법. 즉 경험을 통해 학습하게 됨. 이 경험은 state, action, reward의 sequence를 뜻함.

# 1 Monte Carlo 정의
보상 샘플에 기반해 강화학습 문제를 푸는 방법임. 보상을 잘 정의하기 위해서 [[Unit1 - Introduction to Deep Reinforcement Learning#Episodic task|episodic task]]에 대해서만 다룸. 그 말은 경험을 단위 episode로 쪼개서 파악하는 것을 뜻함. 그리고 어떻게든 episode는 종료되어야 함. 한 ==episode가 끝날때 value 추정치와 policy가 변하게 됨==. 이는 다시말하면 한스탭(state -> state)마다 업데이트가 아니라 ==episode to episode마다 업데이트를 시행==한다는 말임. 보통 Monte carlo는 random 한 방식을 뜻하지만, 여기서는 complete return을 평균 내는 것을 뜻함 ^66b7a2

# 2 Monte carlo 와 non stationary
Monte carlo 방식은 nonstationary함. 이 말은 한 state에서 action을 취해 얻는 reward가 다음 state와 action에 의존적임. 이 문제를 해겨하기 위해 general policy iteration(GPI)를 이용한다. 이는 CH4에서 다룬 내용이다.

# 3 Monte Carlo Prediction
주어진 policy에 대해 state-value function을 학습하는 방법 부터 다뤄봄. state-value는 기대 보상으로 정의함. 미래 보상을 할인한 형태로 정의 함. 간단한 방법은 기대 보상을 평균내는 것임
$v_\pi(s)$는 policy $\pi$아래에서 state $s$의 value임. 이때 한 episode 에서$s$를 여러번 지나 갈 수 있음. 이때 두가지 Monte carlo 방식이 존재함. ==1) first-visit MC Method와 2) every-visit MC method가 그것임.== 여기서는 first-visit MC를 중심으로 이야기함. 
==first-visit MC는 한 episode에서 특정 state를 두번 이상 방문하면 업데이트 하지 않는다는 뜻==. [[#^98c40a|밑의 식]]을 제대로 이해했다면 이 설명이 맞음

> [!important] First-visit MC prediction, for estimating $V\thickapprox v_\pi$
> $$
> \begin{align*}
> \text{input : a policy } \pi \text{ to be evaluated}  \\
> Initialize: \\
> &V(s) \in \mathbb{R} \text{ , arbitrarily, for all } s \in \mathcal{S} \\
> &Returns(S) \leftarrow \text{ an empty list, for all } s \in \mathcal{S} \\
> \text{Loop forever (for each episode):} \\
> &\text{Generate an episode follwing $\pi: S_0,A_0,R_1,S_1,A_1,R_2,\cdots,S_{T-1},A_{T-1},R_T$} \\
> &G \leftarrow 0 \\
> &\text{Loop for each step of episode, $t=T-1,T-2,\cdots,0$:}\\
> && G\leftarrow\gamma G + R_{t+1} \\
> && \text{Unless $S_t$ appears in $S_0,S_1,\cdots,S_{t-1}$:} \\
> &&& \text{Append G to $Returns(S_t)$} \\
> &&& V(S_t)\leftarrow average(Returns(S_t)) \\
> \end{align*}
> $$
^98c40a
# 4 Study Question
- [[#^66b7a2|Complete return]]이 뜻하는 바가 무엇일까?
	1. 한 episode가 끝났을 때 나오는 모든 return의 합?
		1. 이 뜻이 맞는듯. 원문에는 [[Unit2 - Introduction to Q-Learning#5.2 TD Learning 각 단계에서 학습|TD learning]] 과 반대라고 한 것을 보면



#MonteCarlo #ReinforcementLearning 