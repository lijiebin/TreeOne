CREATE TABLE `tree` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `level` mediumint(4) NOT NULL DEFAULT '1',
  `branch` mediumint(4) NOT NULL DEFAULT '1',
  `path` varchar(50) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `tree` (`id`, `name`, `level`, `branch`, `path`) VALUES
(1, 'cate-1', 1, 1, '1'),
(2, 'cate-2', 1, 2, '2'),
(3, 'cate-1-1', 2, 1, '1.1'),
(4, 'cate-1-1-1', 3, 1, '1.1.1'),
(5, 'cate-1-2', 2, 1, '1.2'),
(6, 'cate-1-2-1', 3, 1, '1.2.1'),
(7, 'cate-2-1', 2, 2, '2.1'),
(8, 'cate-2-2', 2, 2, '2.2'),
(9, 'cate-2-1-1', 3, 2, '2.1.1'),
(10, 'cate-2-1-2', 3, 2, '2.1.2');


ALTER TABLE `tree`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rank` (`branch`,`path`),
  ADD KEY `level` (`level`);


ALTER TABLE `tree`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
