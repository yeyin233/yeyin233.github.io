---
layout: post
title: C++自定义比较器
author: Liu Shi
tags:
    - 编程
---

[[C++] 自定义C++比较器比较大小](https://blog.csdn.net/whutshiliu/article/details/108927694)

# 1.容器分类
编程过程中，我们经常有这样的需求，
1) 改变容器默认的排序，或者
2) 让排序函数`sort`按照自定义的方式进行排序。

STL的容器主要有：
1) 线性容器，vector, list, queue, deque, priority_queue
2) 映射容器，set, unordered_set, map, unordered_map

其中有排序需求的是vector，priority_queue, set, map, 对于vector我们经常用sort函数进行排序，对于priority_queue, set, map内部会按照自定义的比较器在插入新值时自动排序。

# 2.自定义比较器
下面我们分析两种自定义顺序：
## 2.1 vector
我们既可以用比较函数来定义比较器，也可以用lamda表达式在定义比较器。
```cpp
bool cmp1(int a, int b) {
	return a > b;
}
auto cmp2 = [](int a, int b) {	
	return a > b;
};
...
sort(v.begin(), v.end(), cmp1);
sort(v.begin(), v.end(), cmp2);
```
## 2.2 priority_queue
priority_queue默认是大顶堆，我们可以采取两种方式自定义堆，即lamba表达式和重载（）运算符，对pq的lamba表达式写法可参考[这里](https://en.cppreference.com/w/cpp/container/priority_queue)。

1. lamda表达式

```cpp
std::priority_queue<int, std::vector<int>, std::greater<int>> q2;

auto cmp = [](int left, int right) { return (left ^ 1) < (right ^ 1); };
std::priority_queue<int, std::vector<int>, decltype(cmp)> q3(cmp);
```

```cpp
auto cmp2 = [](int a, int b) {	
	return a > b;
};
priority_queue<int, vector<int>, decltype(cmp2)> pq(cmp2);
```

2. 重载（）

```cpp
struct cmp {
    bool operator()(int a, int b) {
        return a > b;
    }
};
priority_queue<int, vector<int>, cmp> pq;
```

## 2.3 set, map
这些容器底层是rb-tree，因此在添加新元素时会自动排序，排序也可以自定义。
```cpp
struct cmp {
    bool operator()(int a, int b) const {
        return a > b;
    }
};
set<int, cmp> st;
map<int, int, cmp> mp;
```
# 3.重载小于运算符
sort函数，set、map容器都是默认升序排序的，因此如果我们的元素是结构体或者类实例，此时我们可以通过重载小于运算符来实现自定义排序。

```cpp
struct node {
    int a, b;
    const bool operator < (const struct node n) const {
        return a + b < n.a + n.b;
    }
};

vector<node> v = {{1,2}, {-1,2}, {0, 10}};
sort(v.begin(), v.end());
set<node> st;
st.insert({1,2});
st.insert({-1,2});
st.insert({0,10});
```
——————————

https://blog.csdn.net/AAMahone/article/details/82787184

