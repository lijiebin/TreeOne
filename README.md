
# TreeOne
A powerfully all-purpose hierarchical tree data structure desgin model as a best practice in development. 

![image](https://user-images.githubusercontent.com/11038908/115105931-6d243e00-9f94-11eb-9ff8-dd10f99061ef.png)


## Table Data Structure

```sql

CREATE TABLE `tree` (
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

## Usage Query Examples

- Render whole tree in one query
```sql
SELECT * FROM `tree` ORDER BY `rank`, `path`;
```

- Get all specific
```sql
SELECT * FROM `tree` WHERE `level` =2;
```

- Get branch root node
```sql
SELECT * FROM `tree` WHERE `branch` = 0 ORDER BY `path` ASC LIMIT 1;
```

- Get branch leaf node
```sql
SELECT * FROM `tree` WHERE `branch` = 0 ORDER BY `path` DESC LIMIT 1;
```

- Get one's parent
```sql
SELECT * FROM `tree` WHERE `branch` = 0 AND `path` = '1.1';
```

- Get one's all children
```sql
SELECT * FROM `tree` WHERE `level` = 3 AND `branch` = '1' AND 'path' < '2.2';
```

- Get one's all descendant
```sql
SELECT * FROM `tree` WHERE `level` > 1 AND `branch` = 1 AND `path` > '0';
```

- Get one's all ascendant
```sql
SELECT * FROM `tree` WHERE `level` < 3 AND `branch` = 1 AND `path` < '2.1.2';
```

- Get one's all slibings
```sql
SELECT * FROM `tree` WHERE `level` = 3 AND `branch` = 1 AND `path` > '1.1';
```

- Get one's immediately preceding slibing
```sql
SELECT * FROM `tree` WHERE `level` = 2 AND `branch` = 1 AND `path` < '2.2' ORDER BY `path` DESC LIMIT 1;
```

- Get one's immediately succeeding slibing
```sql
SELECT * FROM `tree` WHERE `level` = 2 AND `branch` = 1 AND `path` > '2.2' ORDER BY `path` ASC LIMIT 1;
```

