
# TreeOne
一个适用性功能性极佳的多层级树型数据库存储结构设计模型最佳实践，可广泛用于项目开发任务中。

（`以下示例环境默认均为MySQL`）

![image](https://user-images.githubusercontent.com/11038908/115105931-6d243e00-9f94-11eb-9ff8-dd10f99061ef.png)


## 表的字段数据结构

```sql

CREATE TABLE `tree` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL, 
  `level` mediumint(4) NOT NULL DEFAULT '1', // 层级位置
  `branch` mediumint(4) NOT NULL DEFAULT '1', // 分支code
  `path` varchar(50) NOT NULL DEFAULT '1' // 先辈路径
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
```

## 特性
- 非常精巧的核心数据表结构
- 很强的灵活扩展性
- 高效性能
- 方便简单的SQL查询
- 几乎支持全部的树状分类结构的应用场景


##  数据记录示例
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

## 查询实例

- 一条查询渲染整颗树
```sql
SELECT * FROM `tree` ORDER BY `branch`, `path`;
```

- 获取树的最大深度/层级
```sql
SELECT MAX(`level`) FROM `tree`;
```

- 获取某个分支的根
```sql
SELECT * FROM `tree` WHERE `branch` = 1 ORDER BY `path` ASC LIMIT 1;
```

- 获取某节点的上级父节点
```sql
SELECT * FROM `tree` WHERE `branch` = 1 AND `path` = '1.1';
```

- 获取某节点的儿子节点(与 儿子节点的所有兄弟节点 等同)
```sql
SELECT * FROM `tree` WHERE `level` = 3 AND `branch` = 1 AND `path` > '1.1' AND `path` < '1.2';
```

- 获取某节点的所有后辈节点（一直到叶子节点）
```sql
SELECT * FROM `tree` WHERE `branch` = 1 AND `path` > '1.1' AND `path` < '1.2' ORDER BY `path` ASC;
```

- 获取某节点的所有先辈节点 (形式如 "面包屑" 路径的场景)
```sql
SELECT * FROM `tree` WHERE `level` < 3 AND `path` IN ('1.2', '1') ORDER BY `path` ASC
```

- 获取前一个兄弟节点
```sql
SELECT * FROM `tree` WHERE `level` = 2 AND `branch` = 2 AND `path` < '2.2' ORDER BY `path` DESC LIMIT 1;
```

- 获取后一个兄弟节点
```sql
SELECT * FROM `tree` WHERE `level` = 2 AND `branch` = 2 AND `path` > '2.2' ORDER BY `path` ASC LIMIT 1;
```


