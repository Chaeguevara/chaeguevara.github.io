# 1 벡터와 벡터의 속성
방향과 크기를 가진다. 두점 간의 크기를 나타 낼 수도 있는데 이때를 L1-Norm이라 하고 기호로는 다음과 같이 쓴다
$\lVert h \rVert_{1}$ 

# 2 벡터의 합과 차
두 벡터를 합하고 싶다면 각 값을 합하면 구할 수 있음. 벡터의 차도 마찬가지임

# 3 벡터의 거리
L1 = 두 벡터를 뺀 후 각 요소의 절대값을 합함
L2 = 두 벡터를 뺀 후 각 요소를 제곱하고 더한 후 루트
Cos distance

# 4 벡터 스케일링
벡터의 각 요소에 스케일 값만큼 곱하면 된다

# 5 Dot product

갯수
2 apple
4바나나
1체리

가격
3
5
2

이때 총 가격을 구하기는 각 요소들 끼리 곱해서 더하면 됨
이와 같은 방법이 닷 프로덕트임
첫번째 벡터는 로우로, 두번째는 칼럼으로 표현

닷 프로덕트와 벡터의 길이
자기자신의 닷 프로덕트는 L2의 제곱. 다시말해 자기 자신의 길이에 제곱

# 6 닷 프로덕트와 각도
평행한 두 벡터의 닷은 두 벡터의 크기를 곱한것과 같음. 각도가 있는 경우 다른 하나를 프로젝션 시켜서 문제를 플 수 있음

# 7 linear transformation
$$
\begin{bmatrix}
3 & 1 \\
1& 2
\end{bmatrix}
$$
ㅇㅟ와 같은 벡터가 있으면

아래와 같은 점들은 위치가 바뀐다

$$
\begin{bmatrix}
3 & 1 \\
1& 2
\end{bmatrix}
\begin{bmatrix}
1\\
0
\end{bmatrix}= 
\begin{bmatrix}
3\\
1
\end{bmatrix}
$$
$$
\begin{bmatrix}
3 & 1 \\
1& 2
\end{bmatrix}
\begin{bmatrix}
1\\
1
\end{bmatrix}= 
\begin{bmatrix}
4\\
3
\end{bmatrix}
$$
$$
\begin{bmatrix}
3 & 1 \\
1& 2
\end{bmatrix}
\begin{bmatrix}
0\\
1
\end{bmatrix}= 
\begin{bmatrix}
1\\
2
\end{bmatrix}
$$
이렇게 나온 벡터들을 basis라고 한다. Basis를 이용해 원하는 위치를 정의 가능하게 됨

# 8 Identity matrix
어떤 메트릭스를 곱한다 해도 자기 자신이 나오도록 하는 매투릭스

# 9 Matrix Inverse
프로ㄷㅓㄱ크를 했을때 아이덴티티 매트릭스를 만드는 애들
찾는 방법
Solve system of linear equation

# 10 which matrix has inverse
ㄱㅡ냥 숫자를 기준으로 설명하면 0의 인버스는 존재하지 않음
싱귤러 메트릭스는 인버스가 없다 - 디터미넌트를 이용해 구할 수 있음

# 11 뉴럴 네트워크와 메트릭스
스팸 데이터 셋
각 단어에 점수를 부여해 스팸을 거르는 방식
각 문장을 linear transformation을 이용해 좌표에 대응 시킬수 있음. 그 후 linear classfier를 ㅇㅣ용해 거를 수 있음 
