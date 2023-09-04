# PaVa: A novel Path-based Valley-seeking clustering algorithm

Submited to Information Sciencea. Paper created by Lin Ma, Conan Liu, Tiefeng Ma, Shuangzhe Liu from School of Statistics, Southwestern University of Finance and Economics, China; UNSW Business School, University of New South Wales, Australia; Faculty of Science and Technology, University of Canberra, Australia. Our preprint paper is avaliable on (https://arxiv.org/abs/2306.07503)

## Introduction
  Clustering methods are being applied to a wider range of scenarios involving more complex datasets, where the shapes of clusters tend to be arbitrary. In this paper, we propose a novel Path-based Valley-seeking clustering algorithm for arbitrarily shaped clusters. This work aims to seek the valleys among clusters and then individually extract clusters. 
  
  Three vital techniques are used in this algorithm. First, path distance (minmax distance) is employed to transform the irregular boundaries among clusters, that is density valleys, into perfect spherical shells.
Second, a suitable density measurement, $k$-distance, is employed to make adjustment on Minimum Spanning Tree, by which a robust minmax distance is calculated.
Third, we seek the transformed density valleys by determining their centers and radius. 

  Based on the vital techniques, the main contributions of the proposed algorithm can be summarized as follows.
First, the clusters are wrapped in spherical shells after the distance transformation, making the extraction process efficient even with clusters of arbitrary shape.
Second, adjusted Minimum Spanning Tree enhances the robustness of minmax distance under different kinds of noise.
Last, the number of clusters does not need to be inputted or decided manually due to the individual extraction process.

  After applying the proposed algorithm to several commonly used synthetic datasets, the results indicate that the Path-based Valley-seeking algorithm is accurate and efficient. The algorithm is based on the dissimilarity of objects, so it can be applied to a wide range of fields. Its performance on real-world datasets illustrates its versatility.


## Getting Started

### Installation
```
MATLAB r2019a
```


### Data Preparation 

    1. Pava_code_data/data/spherical_dataset  for the generation of data sets composed of spherical clusters
	2. Pava_code_dat/data/arbitrary_shaped_dataset for the loading and generation of datasets composed of arbitrary-shaped clusters
     

### Run mian function
- Pava: the input of pava is the original data $D$ and parameter $k$
- pava_DistM: the input of pava is the adjacent matrix $DistM$ and parameter $k$
- the rest of *.m are subfunctions




