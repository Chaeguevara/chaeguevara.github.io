---
lastmod: 2024-01-03
---
오케이. 내 스타일대로 해보겠다. 강화학습 해보자

## 0.1 K-armed Bandit problem
![[Pasted image 20231203204717.png]]
k-armed bandit problem은 슬롯 머신을 떠올리면 된다. 근데 팔이 k 개인 슬롯머신이다. 우리가 슬롯머신을 당기는 이유는 간단하다. 잭팟이 터졌으면 좋겠으면 하는 마음이다. 그걸 수학적으로는 ==기대 보상을 최대화한다==라고 말한다. 기대보상이란 최초에 알 수 있는 것이 아닌 실험을 통해 도출해야 한다. 슬롯 머신의 팔이 k 개라 할때 각 팔을 당길때 기대보상은 각기 다르다. 이 각 기대보상을 value라고 표현한다. 어떤 시점에서 action a를 선택했을때 받는 기대 보상을 다음과 같이 정의 한다
$$q_{*}(a) \doteq \mathbb{E}[R_t|A_t=a]$$
$$A_t = \text{time step t에서 선택한 action}$$$$R_t = \text{time step t에서 선택한 action에 대한 보상}$$
여기서 가정은 이렇다. 어떤 action에 대한 가치는 정해져 있지만 우리가 확실히 모르기 때문에 이 값을 추정해 나가야 하는 것이다. 예를 통해 살펴보면 아래와 같다.

가령 우리가 강아지를 키운다고 생각해보자. 강아지가 배변패드에 용변을 눌때 사료를 3,4,5,3,4,5 알을 줬다 하면 $q_*(배편패드)=4$가 될 것이다.

충분한 반복시행을 통해서 얻은 값을 $q_*(a)$라 한다. 그리고 우리가 고등학교 수준 통계에서 배웠듯, 반복시행은 충분히 많아야 한다. 충분한 단계와 상관없이 특정 횟수를 반복했을 때 $q_*(a)$의 추정치를 $Q_t(a)$라 한다. 

## 0.2 추정해보기 : Action-value Methods
항상 단어를 잘 정의하고 시작해야한다. Action-value methods란 두가지를 아우르는 말이다. 1. Action의 value를 추정하는 작업과 2. 추정한 값을 가지고 어떤 action을 취할지 사용하는데 쓰는 두가지를 뜻한다. action얘기가 나와 잠시 관련 얘기를 설명해보자

우리가 회사 주변에 맛집을 간다면 두가지 중 하나를 선택할 수 있다. 1. 기존에 가던 잘하는 집. 2. 무작위로 아무집이나. 우리가 기존에 가던 잘하는 집을 간다면 현재로서 가장 맛있는 집을 고를 수 있다. 그러나 그 집이 동네에서 가장 맛있는 집이라고 할 수 없다. 왜냐면 우리가 충분히 탐색해보지 않고 선택했을 수 있기 때문이다. 이와같이 기존에 가장 높은 기대보상을 가지는 액션을 취하는 것을 greedy method 또는 exploitation이라 하고, 새로운 탐험을 하는 것을 exploration이라 한다. 이 관련된 이야기는 책에서 계속해서 나오는 부분이다.

다시 돌아와서 그렇다면 action value를 추정하기 위해선 현지 시점을 기준으로 action a에 대한 기대 보상을 추정해야 한다. 쉽게 생각하면 t 까지 단계 중 a가 선택되었을 때 값을 더하고 이를 a가 선택된 횟수로 나누면 된다. 식으로 쓰면 다음과 같다.
$$Q_t(a) = \frac{\sum_{i=1}^{t-1}R_i\cdot\mathbb{1}_{A_i=a}}{\sum_{i=1}^{t-1}\mathbb{1}_{A_i=a}}$$
이게 수학식으로 보면 참 어렵다. $\mathbb{1}_{A_i=a}$라는 친구는 이번에 처음 접했는데 뜻은 이렇다. i 번째에 선택된 action이 a냐는 것을 묻는 것이다. 일종의 `mask`역할을 한다. 막간을 이용해 위 내용을 python으로 써보면 아래와 같다.

```python
import numpy as np

def calc_exp_reward():
	TARGET_ACTION = 1
	selected_actions = np.array([0,1,1,1,1,2,2,2,3,4]) #각 action에 고유 번호가 있다하고 0,1,2,3 4개만 해보자
	rewards = np.array([2,1,1,1,1,1,2,2,3,4]) # 각 action을 골랐을때 해당 rewards
	rewards_sig = np.sum(rewards[selected_actions==TARGET_ACTION]) # rewards 중 Target Action과 동일한 reward만 합함
	count = len(selected_actions[selected_actions==TARGET_ACTION]) # 선택된 횟수
	exp_reward = rewards_sig / count
	print(f"{exp_reward=} for {TARGET_ACTION=}")
	return exp_reward
```

수학식이 되었건 코드가 되었건 어쨋든 이해했으면 그것으로 되었다. 이렇게 각 시점에서 어떤 action value를 추정할 수 있다. 앞에서 언급했듯이 이 추정한 값을 이용해 다음 action을 선택할때 쓰게 된다.

## 0.3 다음 action을 선택해보자
그럼 다음 action은 어떻게 선택할 것인가. 1. 기존에 높은 action value를 가진 action을 선택한다. 2. 완전 random으로 선택한다. 1 번을 greedy라고 하고 수학적으로는 아래와 같이 쓴다
$$A_t \doteq argmax_aQ_t(a)$$
풀어서 설명하면 $Q_t$를 최대화 하는 action a를 선택한다는 말이다. 근데 이렇게 하면 충분히 탐색을 하지 않은 상태에서 실행하게 되면 가장 높은 기대보상을 받을 수 없다. 앞에서 비유한 것 처럼 진짜 맛집은 다른곳에 있을 수 있기 때문이다. 그래서 가끔씩 무작위로 맛집을 들려보는 것을 $\epsilon-greedy$라고 한다. 이 이상은 다음에 계속
