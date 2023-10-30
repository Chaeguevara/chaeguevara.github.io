---
modified: 2023-10-30
---
# 1 Numpy
- Python list보다 훨씬 빠르며 편리함
- numpy안에서 array를 `ndarray`라 하며 뜻은 **==N-차원의 배열==** 임
```python
one_dimensional_arr = np.array([10, 12])
print(one_dimensional_arr)
> [10 12]
```
## 1.1 1-D array
- `np.array()`는 list of values를 넣는다
- `np.arange()`
```python
# Create and print a NumPy array 'a' containing the elements 1, 2, 3.
a = np.array([1, 2, 3])
print(a)
> [1 2 3]

# Create an array with 3 integers, starting from the default integer 0.
b = np.arange(3)
print(b)
> [0 1 2]

# Create an array that starts from the integer 1, ends at 20, incremented by 3.
c = np.arange(1, 20, 3)
print(c)
> [ 1  4  7 10 13 16 19]

# 주어진 범위를 n 등분한 값
lin_spaced_arr = np.linspace(0, 100, 5)
print(lin_spaced_arr)
> [  0.  25.  50.  75. 100.] #float

# 위 데이터의 Type을 바꾸고 싶은 경우
lin_spaced_arr_int = np.linspace(0, 100, 5, dtype=int)
print(lin_spaced_arr_int)
> [  0  25  50  75 100]

c_int = np.arange(1, 20, 3, dtype=int)
print(c_int)
> [ 1  4  7 10 13 16 19]

b_float = np.arange(3, dtype=float)
print(b_float)
> [0. 1. 2.]

char_arr = np.array(['Welcome to Math for ML!'])
print(char_arr)
print(char_arr.dtype) # Prints the data type of the array
> ['Welcome to Math for ML!']
> <U23
```
- `U23` = unicode string이며 23 length
## 1.2 More on Numpy arrays
- `np.ones()` - Returns a new array setting values to one.
- `np.zeros()` - Returns a new array setting values to zero.
- `np.empty()` - Returns a new uninitialized array.
- `np.random.rand()` - Returns a new array with values chosen at random.

```python
# Return a new array of shape 3, filled with ones. 
ones_arr = np.ones(3)
print(ones_arr)
> [1. 1. 1.]

# Return a new array of shape 3, filled with zeroes.
zeros_arr = np.zeros(3)
print(zeros_arr)
> [0. 0. 0.]

# Return a new array of shape 3, without initializing entries.
empt_arr = np.empty(3)
print(empt_arr)
> [0. 0. 0.]

# Return a new array of shape 3 with random numbers between 0 and 1.
rand_arr = np.random.rand(3)
print(rand_arr)
> [0.94668249 0.35501222 0.77872198]
```
# 2 Multidimensional Arrays
```python
# Create a 2 dimensional array (2-D)
two_dim_arr = np.array([[1,2,3], [4,5,6]])
print(two_dim_arr)
> [[1 2 3]
 [4 5 6]]
 
# 1-D array 
one_dim_arr = np.array([1, 2, 3, 4, 5, 6])

# Multidimensional array using reshape()
multi_dim_arr = np.reshape(
                one_dim_arr, # the array to be reshaped
               (2,3) # dimensions of the new array
              )
# Print the new 2-D array with two rows and three columns
print(multi_dim_arr)
> [[1 2 3]
 [4 5 6]]
```
## 2.1 Finding size, shape and dimension
- `ndarray.ndim` - Stores the number dimensions of the array.
- `ndarray.shape` - Stores the shape of the array. Each number in the tuple denotes the lengths of each corresponding dimension.
- `ndarray.size` - Stores the number of elements in the array.
```python
# Dimension of the 2-D array multi_dim_arr
multi_dim_arr.ndim
> 2
```

```python
# Shape of the 2-D array multi_dim_arr
# Returns shape of 2 rows and 3 columns
multi_dim_arr.shape
> (2,3)
```

```python
# Size of the array multi_dim_arr
# Returns total number of elements
multi_dim_arr.size
> 6
```

# 3 Array math operations
- element wise addtion, subtraction, multiplication, division w/ 1-d or multidimensional
	- `+`,`-`,`*`
```python
arr_1 = np.array([2, 4, 6])
arr_2 = np.array([1, 3, 5])

# Adding two 1-D arrays
addition = arr_1 + arr_2
print(addition)

# Subtracting two 1-D arrays
subtraction = arr_1 - arr_2
print(subtraction)

# Multiplying two 1-D arrays elementwise
multiplication = arr_1 * arr_2
print(multiplication)

> [ 3  7 11]
> [1 1 1]
> [ 2 12 30]
```

## 3.1 Multiplying vector with a scalar (broadcasting)
- 다른 `shape`를 가진 array간 계산을 가능하도록 하는 것
```python
vector = np.array([1, 2])
vector * 1.6
> array([1.6, 3.2])
```

# 4 Indexing and slicing
- Indexing: array 안의 특정 item을 선택

## 4.1 Indexing
```python
# Select the third element of the array. Remember the counting starts from 0.
a = ([1, 2, 3, 4, 5])
print(a[2])

# Select the first element of the array.
print(a[0])
> 3
> 1
```

```python
# Indexing on a 2-D array
two_dim = np.array(([1, 2, 3],
          [4, 5, 6], 
          [7, 8, 9]))

# Select element number 8 from the 2-D array using indices i, j.
print(two_dim[2][1])
> 8
```

## 4.2 Slicing
- sublist. Start to end(end exclusive) 
- Syntax : `array[start:end:step]`
```python
# a = ([1, 2, 3, 4, 5])
# Slice the array a to get the array [2,3,4]
sliced_arr = a[1:4]
print(sliced_arr)
> [2,3,4]

# Slice the array a to get the array [1,2,3]
sliced_arr = a[:3]
print(sliced_arr)
> [1,2,3]

# Slice the array a to get the array [3,4,5]
sliced_arr = a[2:]
print(sliced_arr)
> [3,4,5]

# Slice the array a to get the array [1,3,5]
sliced_arr = a[::2]
print(sliced_arr)
> [1,3,5]

# Note that a == a[:] == a[::]
print(a == a[:] == a[::]) # 신기한데?
> True

```

```python
# Slice the two_dim array to get the first two rows
# two_dim = np.array(([1, 2, 3],
#          [4, 5, 6], 
#          [7, 8, 9]))

sliced_arr_1 = two_dim[0:2] #row를 slicing
sliced_arr_1
> array([[1, 2, 3],
       [4, 5, 6]])

# Similarily, slice the two_dim array to get the last two rows
sliced_two_dim_rows = two_dim[1:3]
print(sliced_two_dim_rows)
> array([[4,5,6],
		[7,8,9]])

sliced_two_dim_cols = two_dim[:,1]
print(sliced_two_dim_cols) # column vector가 1-d
> array([2 5 8])
```

# 5 Stacking
- horizontally, vertically 여러 array를 합치는 방법
- `np.vstack()` - stacks vertically
- `np.hstack()` - stacks horizontally
- `np.hsplit()` - splits an array into several smaller arrays
```python
a1 = np.array([[1,1], 
               [2,2]])
a2 = np.array([[3,3],
              [4,4]])
print(f'a1:\n{a1}')
print(f'a2:\n{a2}')
> a1:
[[1 1]
 [2 2]]
a2:
[[3 3]
 [4 4]]
```

```python
# Stack the arrays vertically
vert_stack = np.vstack((a1, a2))
print(vert_stack)
> [ [1 1]
	[2 2]
	[3 3]
	[4 4] ]
```

```python
# Stack the arrays horizontally
horz_stack = np.hstack((a1, a2))
print(horz_stack)
> [ [1 1 3 3]
    [2 2 4 4] ]
```
# 6 Summary
- Index를 통해 row,column, element를 접근하는 방법은 Python 방식과 동일함


#numpy #python 