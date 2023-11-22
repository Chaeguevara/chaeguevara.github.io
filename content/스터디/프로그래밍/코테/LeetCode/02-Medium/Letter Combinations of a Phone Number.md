---
lastmod: 2023-11-22
acceptance rate: 
first attempt date: 
last attempt: 
---

# 1 문제
**Example 1:**

**Input:** digits = "23"
**Output:** ["ad","ae","af","bd","be","bf","cd","ce","cf"]

**Example 2:**

**Input:** digits = ""
**Output:** []

**Example 3:**

**Input:** digits = "2"
**Output:** ["a","b","c"]

예전 핸드폰을 보면 이렇다. 2번키 아래 `a,b,c`가 쓰여있고 3번키 아래`d,e,f` 등등이 쓰여있다. 한국말은 `ㄱ,ㄴ,ㄷ,ㄹ`이었지만. 어쨋든 그런 이유로 23을 누른다는 것은 `[a,b,c]`와 `[d,e,f]`의 조합을 구하는 것과 같다.

https://leetcode.com/explore/interview/card/top-interview-questions-medium/109/backtracking/793/
# 2 아이디어
맨처음에는 크게 아이디어가 떠오르지 않았다. 일단 각 번호에 대응되는 알파벳 딕셔너리부터 만들었다. 메모리를 적게 사용하고 싶었고, 그래서 반복해서 사용할 필요가 있는 친구들은 `class field`(?)에 넣어놨다. 

tail recursion을 활용하기로 했다. 따라서 accumulator에 초기값을 넣은 후, terminate condition 되면 해당 accumulator 값이 `class field`에 append 되도록 설정했다. digit은 그대로 두고, index만 이동시켜 현재 digit을 가르키도록 했다. 이 부분은 조금 불합리하게 짯다고 생각한다. Find complexity가 `O(n)`일거니까 이부분에서 속도가 조금 느려졌으리라 생각한다. pop을 쓸껄 그랬다.다시 말하면 find 때문에 `O(n^2)`가 됬겠네?

# 3 풀이
```python
class Solution:
    def letterCombinations(self, digits: str) -> List[str]:
        self.result = []
        self.len = len(digits)
        self.d_to_let = {
            "2":["a","b","c"],
            "3":["d","e","f"],
            "4":["g","h","i"],
            "5":["j","k","l"],
            "6":["m","n","o"],
            "7":["p","q","r","s"],
            "8":["t","u","v"],
            "9":["w","x","y","z"],      
        }
        self.genLetter(digits)
        return self.result
    
    
    def genLetter(self,digits,cur="",i=0):
        if self.len == 0:
            return
        if i > self.len -1:
            self.result.append(cur)
            return
        for char in self.d_to_let[digits[i]]:
            self.genLetter(digits,cur=cur+char,i=i+1)
        
            
        
```

# 4 후기
이번 문제는 그래도 쓰면서 생각이 정리가 됬고, 비교적 간단했던것 같다. Leetcode문제들을 보면 가끔 제한조건이 뭔가 애매한데 이번엔 좀 명확했던 것 같다. 아니면 내가 너무 잘짜려고하느라 생각이 많았던 걸지도. 이론 내용을 적용할 기회가 있으니 흥미로운 부분이다

#backTracking #dfs #tailRecursion 