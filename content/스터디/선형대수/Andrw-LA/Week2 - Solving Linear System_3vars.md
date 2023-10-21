
numpy를 이용해 문제를 푸는 연습을 함

# Linear equation을 Matrix로 표현하기
$$
\begin{cases} 
4x_1-3x_2+x_3=-10, \\ 
2x_1+x_2+3x_3=0, \\ 
-x_1+2x_2-5x_3=17, 
\end{cases}\tag{1}
$$

```python
A = np.array([
        [4, -3, 1],
        [2, 1, 3],
        [-1, 2, -5]
    ], dtype=np.dtype(float))

b = np.array([-10, 0, 17], dtype=np.dtype(float))

print("Matrix A:")
print(A)
print("\nArray b:")
print(b)
```
```python
Matrix A:
[[ 4. -3.  1.]
 [ 2.  1.  3.]
 [-1.  2. -5.]]

Array b:
[-10.   0.  17.]
```

```python
print(f"Shape of A: {np.shape(A)}")
print(f"Shape of b: {np.shape(b)}")
```
```python
Shape of A: (3, 3)
Shape of b: (3,)
```

이 문제를 쉽게 푸는 방법은 아래와 같음
```python
x = np.linalg.solve(A, b)

print(f"Solution: {x}")
```
```python
Solution: [ 1.  4. -2.]
```


## Determinant 계산
```python
d = np.linalg.det(A)

print(f"Determinant of matrix A: {d:.2f}")
```
```python
Determinant of matrix A: -60.00
```

# Row reduction을 이용해 풀기

## Row reduction 준비하기
`hstack`을 이용해 3\*4 메트릭스 형태를 만듬
```python
A_system = np.hstack((A, b.reshape((3, 1))))

print(A_system)
```
```python
[[  4.  -3.   1. -10.]
 [  2.   1.   3.   0.]
 [ -1.   2.  -5.  17.]]
```

## Elementary Operation
```python
# multiply row_num_1 by row_num_1_multiple and add it to the row_num_2, 
# exchanging row_num_2 of the matrix M in the result
def AddRows(M, row_num_1, row_num_2, row_num_1_multiple):
    M_new = M.copy()
    M_new[row_num_2] = row_num_1_multiple * M_new[row_num_1] + M_new[row_num_2]
    return M_new

print("Original matrix:")
print(A_system)
print("\nMatrix after exchange of the third row with the sum of itself and second row multiplied by 1/2:")
print(AddRows(A_system,1,2,1/2))
```
```python
Original matrix:
[[  4.  -3.   1. -10.]
 [  2.   1.   3.   0.]
 [ -1.   2.  -5.  17.]]

Matrix after exchange of the third row with the sum of itself and second row multiplied by 1/2:
[[  4.   -3.    1.  -10. ]
 [  2.    1.    3.    0. ]
 [  0.    2.5  -3.5  17. ]]
```

```python
# exchange row_num_1 and row_num_2 of the matrix M
def SwapRows(M, row_num_1, row_num_2):
    M_new = M.copy()
    M_new[[row_num_1, row_num_2]] = M_new[[row_num_2, row_num_1]]
    return M_new

print("Original matrix:")
print(A_system)
print("\nMatrix after exchange its first and third rows:")
print(SwapRows(A_system,0,2))
```
```python
Original matrix:
[[  4.  -3.   1. -10.]
 [  2.   1.   3.   0.]
 [ -1.   2.  -5.  17.]]

Matrix after exchange its first and third rows:
[[ -1.   2.  -5.  17.]
 [  2.   1.   3.   0.]
 [  4.  -3.   1. -10.]]
```