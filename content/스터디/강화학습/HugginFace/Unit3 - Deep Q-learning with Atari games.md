---
category:
  - rl
---

# 1 Introducction
> 기존 방법으로 감당할 수 없는 state의 수. 비효율적인 Q-table

[[Unit2 - Introduction to Q-Learning]]에에서는 처음부터 Q-learning을 적용하는 방법을 했음. 간단한 알고리즘을 통해 꽤나 좋은 성능을 가질 수 있었음. 그러나 state의 크기가 작고 서로 불연속(discrete)하기 때문에 가능했음(16~500정도). 하지만 Atari 게임의 경우 $10^9$\~$10^{11}$state를 다뤄야 함. ==따라서 이런 경우 Q-table을 사용하는 것은 비효율적임==

> Q-table을 대신하는 Deep Q-Learning

State를 입력값으로 사용하는 Neural Network를 쓰는 방식이며, 해당 State에서 action의 Q-value를 추정하는 방식임

# 2 From Q-Learning to Deep Q-Learning

> Q-learning recap[[Unit2 - Introduction to Q-Learning]]

Q-learning이란 Q-function을 학습시키는데 사용되는 알고리즘임. 여기서 Q-function이란 action-value function을 뜻함[[Unit2 - Introduction to Q-Learning#7 Introduction to Q-learning|(unit2 참조)]]. Q-function을 학습시킬때 Q-table을 사용하게 됨. 각 action-value를 가지고 있는 테이블임. ==State와 action이 작을 때는 문제를 해결할 수 있지만 state가 커지면 굉장히 비효율적이게됨==

> Atari game의 state = (210,160,3). 우주 원자 수 만큼의 state

쥐 예제([[Unit2 - Introduction to Q-Learning]])의 state는 16 정도 밖에 안됨. 그러나 atari game의 경우
$256^{210\times160\times3}$이 됨. 왜냐면 한 픽셀의 한 채널에는 256임. RGB채널이 있으니까 $256^3$이 됨. Atari game의 해성다노느 210\*160임. 그래서 $256^{210\times160\times3}$임. $256^{210\times160\times3} = 256^{100800} \approx 10^{80}$정도가 됨. ==이 수는 우주의 원자의 갯수와 유사함. 즉 state가 너무 많음==

![[Pasted image 20231029210531.png]]

> 그래서 Deep Q learning이 필요함

![[Pasted image 20231029210634.png]]

# 3 The Deep Q-Network (DQN)
> Deep Q-learning Preprocessing : Stack과 crop

4개 프레임을 쌓아서(stack) CNN에 집어 넣으면 state에서 가능한 action vector가 나옴. 그럼 action vector 중에 epsilon greedy를 이용해 action을 고르면 됨(생각보다 간단한데?)

## 3.1 입력값 전처리와 시간적 제한(Temporal limitation)
> 전처리를 통한 복잡도 감소

space를 84\*84 및 그레이스케일로 바꿀 수 있음. 그레이스케일을 해도 상관없는 이유는 컬러가 중요한 정보를 가지지 않기 때문임. 반면 crop의 경우 crop 외 부분에 중요한 정보가 없다는 가정하에 가능함. 해당 과정을 그림으로 살펴보면 아래와 같음

![[Pasted image 20231029211749.png]]

> Stack : 시간적 제한 해소. 공이 진행하는 방향

한 프레임을 기준으로 앞뒤 프레임이 없으면 진행 상태를 알 수 없음. ==가령 픽셀로 공을 표현하면 하나의 프레임을 가지고 공이 왼쪽으로 가는지 오른쪽으로 가는지 알 수 없음==. 해당 경우를 아래 그림을 통해 알 수 있음

![[Pasted image 20231029211946.png]]

하지만 프레임 세개를 더하면 공의 이동방향을 알 수 있음. 해당 경우를 아래 그림을 통해 확인 가능함.

![[Pasted image 20231029212015.png]]

위 과정을 거쳐 stack된 프레임은 CNN을 통과함. stack이 되어있어 공간적 관계 파악 및 시간적 제한 요소도 파악할 수 있음.

그 후 Fully Connected Layer를 붙여 한 state에서 Q-value를 구할 수 있음