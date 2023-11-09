---
lastmod: 2023-11-08
tags:
  - python
  - pytorch
---
데이터를 가져오는 방법을 학습하는 부분. 어느정도는 외워야 겠다는 생각이 들어서 Pseudocode를 쓰고 이를 내가 테스트 하는 과정을 반복해본다. 일단 내가 외운 부분을 Pesudocode로 써보면 아래와 같다. 근데 Pseudocode가 맞나. Comment로 설명문을 쓴다

# 1 PseudoCode

```python
# Pytorch 관려 패ㅋ지를 로드한다
# 데이터를 시각화 하는 패키지를 로드한

# Training data를 로드한다
# Test data를 로드한다

# 데이터를 보여주기위한 준비로
## row,col을 정의한다(figure 안에 grid 형식으로 넣을거라서)
## figure를 정의한다

# label과 실제 이름을 정의한 테이블
labels_map = {
    0: "T-Shirt",
    1: "Trouser",
    2: "Pullover",
    3: "Dress",
    4: "Coat",
    5: "Sandal",
    6: "Shirt",
    7: "Sneaker",
    8: "Bag",
    9: "Ankle Boot",
}

# figure size만큼 루프를 돌며
## 랜덤 인덱스를 가져온다
## 트레이닝 데이터의 이미지와 레이블을 가져온다
## sub plot을 더한다
## 제목을 설정
## 엑시스를 끈다
## 이미지를 보여준다
# Figure를 띄운다

```

# 2 정답 부분
```python
import torch
from torch.utils.data import Dataset
from torchivision import datasets
from torchivision.transforms import ToTensor
import matplotlib.pyplot as plt

training_data = datasets.FashionMNIST(
	root="data",
	train=True,
	download=True,
	transform=ToTensor()									  
)

test_data = datasets.FashionMNIST(
	root="data",
	train=False,
	download=True,
	transform=ToTensor()									  
)

row,cols = 3,3
figure = plt.figure(figsize=(3,3))

labels_map = {
    0: "T-Shirt",
    1: "Trouser",
    2: "Pullover",
    3: "Dress",
    4: "Coat",
    5: "Sandal",
    6: "Shirt",
    7: "Sneaker",
    8: "Bag",
    9: "Ankle Boot",
}

for i in range(1,row * col + 1):
	idx = torch.randint(len(labels_map),(1,)).item()
	img, label = train_data[idx]
	figure.add_subplot(row,col,i)
	plt.title(labels_map[label])
	plt.axis("off")
	plt.imshow(img.squeeze(),cmap='gray')
plt.show()

```