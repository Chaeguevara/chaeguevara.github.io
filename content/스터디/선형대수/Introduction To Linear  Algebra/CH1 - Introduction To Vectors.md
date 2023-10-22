# 1 pset 1.1
1. 다음 linear combination에 대해 geometrically 설명하시오
	1. $$
	   (a) \begin{bmatrix} 1 \\ 2 \\ 3\\\end{bmatrix} 
	    and
	   \begin{bmatrix}3 \\ 6 \\ 9\\\end{bmatrix}
		\;\;\;
		(b)\begin{bmatrix}1 \\ 0 \\ 0\\\end{bmatrix} 
	    and
	   \begin{bmatrix}0 \\ 2 \\ 3\\\end{bmatrix}
	   \;\;\;
		(c)\begin{bmatrix}2 \\ 0 \\ 0\\\end{bmatrix} 
	    and
	   \begin{bmatrix}0 \\ 2 \\ 2\\\end{bmatrix}
	   and
	   \begin{bmatrix}2 \\ 2 \\ 3\\\end{bmatrix}
	   $$
		1. (a) 두 vector가 평행함 -> **Line**
		2. (b) $$a\begin{bmatrix}1 \\ 0 \\ 0\\\end{bmatrix} + 
		   b\begin{bmatrix}0 \\ 2 \\ 3\\\end{bmatrix} = \begin{bmatrix}a \\ 2b \\ 3b\\\end{bmatrix}$$
		   abs x와 [0,2,3]을 포함하는 **Plane**
		3. All space
2. ![[LA_diagrams.pdf]]
3. u=(1,2,3) , v=(-3,1,-2), w=(2,-3,-1)
	1. u+v+w = (0,0,0)
	2. 2u+2v+w=(-2,3,1)
	3. u,v,w는 같은 plane위에 있음. 왜냐하면 w=cu+dv 이기 때문에 이때 c,d는?
		1. c,d = -1
4. $$
   c
   \begin{bmatrix}
   2\\1
   \end{bmatrix}
   +
   d
   \begin{bmatrix}
   0\\1
   \end{bmatrix}
   \text{with c=0,1,2 and d = 0,1,2}
   
   $$
   위 9개의 linear combination 그리기
   
   ![[linear combinations.pdf]]

5. $\text{(1,1),(4,2) and (1,3) are three corners of parallelogram. What are three of the possible fourth corners. Draw two of them}$![[paralleogram.pdf]]
# 2 Length and dot product

닷 프로덕트를 하게 되면 다음과 같은 속성을 가짐
1. $v=\begin{bmatrix}1\\2\end{bmatrix},w=\begin{bmatrix}4\\5\end{bmatrix}$의 $v \cdot w=(1)(4)+(2)(5)=14$임
2. $v=\begin{bmatrix}1\\3\\2\end{bmatrix},w=\begin{bmatrix}4\\-4\\4\end{bmatrix}$이 두 벡터는 직교함. 왜냐하면 둘의 dot product = 0이기 때문임. $(1)(4)+(3)(-4)+(2)(4)=0$
3. $v=\begin{bmatrix}1\\3\\2\end{bmatrix}$의 길이의 제곱은 $v \cdot v = 14$임. 따라서 $\lvert\lvert v \rvert\rvert = \sqrt{14}$(여기서 $\lvert\lvert v \rvert\rvert$는 ==벡터의 길이를 뜻함==)
4. 그렇다면 $u=\frac{v}{\lvert\lvert v \rvert\rvert}=\frac{v}{\sqrt{14}}=\frac{1}{\sqrt{14}}\begin{bmatrix}1\\3\\2\end{bmatrix}$가 되며 이때 $\lvert\lvert u \rvert\rvert=1$이 됨
5. $\cos\theta$를 이용해 두 벡터간 각도를 구할 수 있음. $\cos\theta = \frac{v \cdot w}{\lvert\lvert v \rvert\rvert \lvert\lvert w \rvert\rvert}$
6. $\begin{bmatrix}1\\0\end{bmatrix}와\begin{bmatrix}1\\1\end{bmatrix}$사이 각도는 $\cos\theta = \frac{1}{(1)(\sqrt{2})}$를 통해 $\theta=45\degree$
7. $\lvert\cos\theta\rvert\le1$이기 떄문에 $\lvert v \cdot w \rvert \le \lvert\lvert v \rvert\rvert    \;\lvert\lvert w \rvert\rvert$

두 백터의 dot prouct 또는 inner product는 다음과 같이 정의함
$$
\begin{equation}
v \cdot w = v_1w_1 + v_2w_2\tag{1}
\end{equation}
$$
**예시 1**
> [!example] v=(4,2)와 w=(-1,2)의 dot product 는 zero 
> $$
> \begin{bmatrix}
> 4 \\ 2
> \end{bmatrix}
> \cdot
> \begin{bmatrix}
> -1 \\ 2
> \end{bmatrix}
> = -4 +4 = 0
> $$

dot product에서 값이 0 이라는 뜻은 두 벡터가 직교한다는 것임. 여기서 주목할 점은 ==dot product의 순서를 바꿔도==($v \cdot w, w \cdot v$) ==결과는 변하지 않는다는 것==임. 이를 식으로 풀어 설명해보면 아래와 같음
$$
\begin{align*}
v \cdot w &= v_1w_1+v_2w_2 && \\\nonumber
&= w_1v_1+w_2v_2<- \text{swap v,w}&& \\\nonumber
&= w\cdot v
\end{align*}
$$

**예시2**
> [!example] 엔지니어링에서 Linear Algebra
> x=-1 에 weight 4만큼 부여하고, x=2에 weight 2만큼 부여해도 균형점은 x=0가 됨. 이를 formulation하면 아래와 같이 됨
> (4)(-1)+(2)(2)=0

예시3
> [!example] 비즈니스 또는 경제에서 Linear Algebra
> 가격과 수량을 vector로 표현해서 Income을 구할 수 있음
> Price = $(p_1,p_2,p_3)$, quantity = $(q_1,q_2,q_3)$라 하면 Income은 둘의 dot product로 구할 수 있음
> $Income=(p_1,p_2,p_3)\cdot(q_1,q_2,q_3)$

**중점**
$v \cdot w = v_1w_1+\cdots + v_nw_n$

## 2.1 Length and Unit vectors
vector 자기 자신과 dot product경우가 중요한 케이스임. 예를 들어 $v=(1,2,3)$이라 하면 
$v \cdot v = \lvert\lvert v \rvert\rvert^2=\begin{bmatrix} 1\\2\\3 \end{bmatrix} \cdot \begin{bmatrix}1\\2\\3\end{bmatrix} = 1+4+9=14$
==자기 자신의 dot product는 length의 제곱이 됨==. 그렇다면 여기에 루트를 씌우면 해당 vector의 길이를 알 수 있음



> [!NOTE] 정의 : 벡터의 길이
> $length = \lvert\lvert v \rvert\rvert = \sqrt{v \cdot v} = (v_1^2+v_2^2+\cdots+v_n^2)^{1/2}$

그래

#LinearAlgebra #dotproduct

