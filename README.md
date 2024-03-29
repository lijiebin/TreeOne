[简体中文](./README-CN.md)

# TreeOne
A powerfully all-purpose hierarchical tree data structure design model as a best practice in development. 
(Demo default by MySQL)

![image](https://user-images.githubusercontent.com/11038908/115105931-6d243e00-9f94-11eb-9ff8-dd10f99061ef.png)


## Table Data Structure

```sql

CREATE TABLE `tree` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL, 
  `level` mediumint(4) NOT NULL DEFAULT '1', // Level number in its barnch
  `branch` mediumint(4) NOT NULL DEFAULT '1', // Means ancestry flag
  `path` varchar(50) NOT NULL DEFAULT '1' // Route to forefather
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
1 | ----cate-1 | 1 | 1 | 1 
3 | --------cate-1-1 | 2 | 1 | 1.1 
4 | ------------cate-1-1-1 | 3 | 1 | 1.1.1 
5 | --------cate-1-2 | 2 | 1 | 1.2 
6 | ------------cate-1-2-1 | 3 | 1 | 1.2.1 
2 | ----cate-2 | 1 | 2 | 2 
7 | --------cate-2-1 | 2 | 2 | 2.1 
9 | ------------cate-2-1-1 | 3 | 2 | 2.1.1 
10 | ------------cate-2-1-2 | 3 | 2 | 2.1.2 
8 | --------cate-2-2 | 2 | 2 | 2.2

## Query Examples

- Render whole tree in one query
```sql
SELECT * FROM `tree` ORDER BY `branch`, `path`;
```

- Get max deepth of tree
```sql
SELECT MAX(`level`) FROM `tree`;
```

- Get branch root node
```sql
SELECT * FROM `tree` WHERE `branch` = 1 ORDER BY `path` ASC LIMIT 1;
```

- Get one's parent
```sql
SELECT * FROM `tree` WHERE `branch` = 1 AND `path` = '1.1';
```

- Get one's all children(same as one's all slibings)
```sql
SELECT * FROM `tree` WHERE `level` = 3 AND `branch` = 1 AND `path` > '1.1' AND `path` < '1.2';
```

- Get one's all descendant
```sql
SELECT * FROM `tree` WHERE `branch` = 1 AND `path` > '1.1' AND `path` < '1.2' ORDER BY `path` ASC;
```

- Get one's all ascendant (forms of "Bread-Crumbs")
```sql
SELECT * FROM `tree` WHERE `level` < 3 AND `path` IN ('1.2', '1') ORDER BY `path` ASC
```

- Get one's immediately preceding sibling
```sql
SELECT * FROM `tree` WHERE `level` = 2 AND `branch` = 2 AND `path` < '2.2' ORDER BY `path` DESC LIMIT 1;
```

- Get one's immediately succeeding sibling
```sql
SELECT * FROM `tree` WHERE `level` = 2 AND `branch` = 2 AND `path` > '2.2' ORDER BY `path` ASC LIMIT 1;
```


