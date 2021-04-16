# TreeOne
A powerfully all-purpose hierarchical tree data structure desgin model as a best practice in development. 

## Table Data Structure

```

CREATE TABLE `catlog` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL, 
  `level` mediumint(4) NOT NULL DEFAULT '1', // Level number in its barnch
  `branch` mediumint(4) NOT NULL DEFAULT '0', // Means ancestry flag
  `path` varchar(50) NOT NULL DEFAULT '0' // Route to forefather
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
```

## Features
- Very nifty structure
- Strong flexibility
- High Performance
- Convenient for query
- Almost cover all development circumstances


##  Sample Rows
id | name | level | branch | path 
--- | --- | --- | --- | --- 
1 | ----cate-1 | 1 | 0 | 0 
3 | --------cate-1-1 | 2 | 0 | 1.1 
4 | ------------cate-1-1-1 | 3 | 0 | 1.1.1 
5 | --------cate-1-2 | 2 | 0 | 1.2 
6 | ------------cate-1-2-1 | 3 | 0 | 1.2.1 
2 | ----cate-2 | 1 | 1 | 0 
7 | --------cate-2-1 | 2 | 1 | 2.1 
9 | ------------cate-2-1-1 | 3 | 1 | 2.1.1 
10 | ------------cate-2-1-2 | 3 | 1 | 2.1.2 
8 | --------cate-2-2 | 2 | 1 | 2.2
