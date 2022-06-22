---
title: '11'
author: "Package Build"
date: '2022-06-22'
slug: '11'
categories: R
tags: []
---

# Similarity and distance computation between documents or features

# 计算文档和文档特征之间的相似度和距离

> These functions compute matrixes of distances and similarities between documents or features from a dfm() and return a matrix of similarities or distances in a sparse format. These methods are fast and robust because they operate directly on the sparse dfm objects. The output can easily be coerced to an ordinary matrix, a data.frame of pairwise comparisons, or a dist format.

> 此函数从dfm（）计算文档或特征之间的距离和相似矩阵，并以稀疏格式返回相似性或距离矩阵。这些方法是快速和有效的，因为它们直接在稀疏的dfm对象上工作。可以很容易地强制输出为普通矩阵、成对比较的数据帧或dist格式。


```{r message=FALSE}
# similarities for documents
dfmat <- dfm(corpus_subset(data_corpus_inaugural, Year > 2000),
             remove_punct = TRUE, remove = stopwords("english"))
```

## 将一个corpus变为dfm矩阵
(tstat1 <- textstat_simil(dfmat, method = "cosine", margin = "documents"))
```


```{r message=FALSE}
(tstat2 <- textstat_simil(dfmat, method = "cosine", margin = "documents", min_simil = 0.6))
```

# similarities for for specific documents

```{r}
textstat_simil(dfmat, dfmat["2017-Trump", ], margin = "documents")

##查看特定文档和其他文档的相似度,1表示一模一样
```

# compute some term similarities 词相似
```{r}
tstat3 <- textstat_simil(dfmat, dfmat[, c("fair", "health", "terror")], method = "cosine",margin = "features")

head(as.matrix(tstat3), 10)
```


# distances for documents 文档间聚类
```{r}
(tstat4 <- textstat_dist(dfmat, margin = "documents"))
```

# distances for specific documents
```{r}
textstat_dist(dfmat, dfmat["2017-Trump", ], margin = "documents")
```