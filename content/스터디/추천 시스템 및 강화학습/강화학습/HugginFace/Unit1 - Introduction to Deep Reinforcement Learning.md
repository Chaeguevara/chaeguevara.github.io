# 강화학습이란?
Agent가 주위 환경과 상호작용을 통한 보상을 이용해 학습하는 방식. 보상을 통해 따로 ==감독없이== 학습 가능

예) 게임환경에서 상호작용을 통해 학습하는 게임 플레이어

## 공식 정의

> [!INFO]
>  Reinforcement learning is a framework for solving control tasks (also called decision problems) by building agents that learn from the environment by interacting with it through trial and error and receiving rewards (positive or negative) as unique feedback.

![[Pasted image 20230929144234.jpg]]

# 게임 예시

![](https://huggingface.co/datasets/huggingface-deep-rl-course/course-images/resolve/main/en/unit1/RL_process_game.jpg)

1. 게임환경에서 첫 프레임을 받게 됨($S_{0}$)
2. $S_{0}$에서 행동($A_{0}$)을 택함. 예를들면 오른쪽으로 이동
3. 오른쪽으로 이동함으로 다음 프레임($S_{1}$)으로 변경됨
4. 이때, 캐릭터가 사망하지 않는다면 보상($R_{1}$)을 받게됨

 위와같은 State, action, Reward, Next state,…을 반복하게 됨
![[Pasted image 20230929163719.png]]

에이전트의 목표는 기대 수익(expected return)을 최대화 하는 것임. 기대수익은 경제학에서 이야기하는 [[현재가치]]로 설명 가능

# Markov property
이 내용은 다른 강의를 듣게 되면 상당히 길게 설명하는 부분임. 상당히 길게 이야기 하지만 핵심은 에이전트가 오직 현재 상태를 기준으로 내린다는 것. 달리말하면 현재 상태가 과거의 상태를 요약해서 가지고 있다 할 수 있음(대학원 수업때 교수님이 한 말)

# Observation / State
에이전트가 환경으로 부터 얻는 정보를 뜻함. State를 $S$, Observation을 $Obs$라고한다면
==$Obs \subset S$== 으로 표현할 수 있음. 
주식거래 봇 이라면 특정 주식의 가격이, 게임이라면 한 프레임이 위 값에 해당할 수 있음

## observation과 state의 차이
둘은 거의 유사하지만 위에서 언급했듯 observation은 state에 포함됨. 즉 state는 state world를 모두 표현한 것이고, observation은 state 중 일부를 표현

### state
![[Pasted image 20230929170845.png]]

State는 agent가 판단을 하기위해 숨겨진 정보가 없는 상태. 달리 말해 ==fully observed state==.
### observation
![[Pasted image 20230929170757.png]]

Observation의 경우 state의 일부만 볼 수있음. 즉 위의 마리오 게임의 경우 위 프레임 다음에도 여러 프레임이 존재함. 따라서 위의 프레임은 모든 state를 표현하지 못하기에. Observation에 속함

# Action space

환경 안에서 가능한 모든 행동을 뜻함. Discrete 경우와 continuous 경우가 있음

### Discrete = finite

Discrete의 경우 제한된 숫자의 행동만 가능 


![[Pasted image 20230929170757.png]]


위 마리오 게임의 경우, 위,아래,좌,우 의 4가지 행동 중 선택가능.

### Continuons = infinite
Continuous 의 경우 가능한 행동이 무한대임. 
![[Pasted image 20230929172235.jpg]]
가령 자동차 운전의 경우 핸들움직이기(0,0.1,0.2,…), 경적울리기, 기어바꾸기, 브레이크 밟기 등 거의 무한한 행동이 가능함

# 테스크의  종류

## Episodic task
시작과 끝이 정해진 경우. 게임의 경우, 게임을 완수하거나 아니면 캐릭터가 중간에 사망하는 경우로 나눌 수 있음.
![[Pasted image 20230929203609.png]]
마리오 게임의 경우 Episodic task의 한 종류임

## Continuing Task
끝나는 시점이 없는 경우. 이때 에이전트의 일은 ==최선의 행동을 하면서 동시에 환경과 상호작용을 하는 것==. 따라서 에이전트는 우리가 정지 신호를 보낼때 까지 계속 학습하게 됨. 예를들어 주식거래 에이전트를 만들게 되면 해당 경우에 시작과 끝점이라는 것은 존재하지 않음
![[Pasted image 20230929203927.png]]
주식거래 예시 이미지

# Exploitation / Exploration
한국말로는 ==착취==(여기서는 *기존방법 고수*라고 표현하겠다)와 ==탐험==으로 해석되지만 요지는 기존 방식을 그대로 유지할지 또는 새로운 방법을 시도하는지의 차이로 볼 수 있다. 가령 다음과 같은 예를 통해 살펴 볼 수 있다
![[Pasted image 20230929210214.png]]

위 그림에서 치즈 1개는 +1의 보상을 뜻하고, 치즈 3개는 +1000의 보상을 뜻한다. 그리고 직관적이게 해골은 사망을 뜻한다. 

만약 쥐가 충분한 탐험을 하지 않고 기존방법을 고수하게 된다면 주위의 3개 치즈만 보상으로 받으며 기대 보상을 최대화하기 힘들 것이다.

반면 충분한 탐험을 하게 되면 왼쪽위의 +1000의 보상을 통해 더 큰 기대 보상을 만들어 낼 수 있다. 해당 결과를 그림으로 표현하면 아래와 같다.
![[Pasted image 20230929211059.png]]

위 그림과 같이 충분한 탐험이 전재되지 않은 상태에서 기존방법을 고수하게 되면(오른쪽) 상대적으로 작은 기대 보상을 받을 수 있고, 충분한 탐험을 하게되면 높은 기대 보상을 받을 수 있다.

# 강화학습 문제를 해결하는 두가지 방법
위에 나온 내용들은 강화학습의 전반적인 문제를 다뤘다. 그렇다면 이를 어떻게 해결할 수 있는지 알아봐야 한다.

#ReinforcementLearning