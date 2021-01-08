# minmax scale operator

##### Description

`minmax_scale` operator performs a scaling of the data between 0 and 1.

##### Usage

Input projection|.
---|---
`row`   | represents the variables (e.g. channels, markers, genes)
`col`   | represents the observations (e.g. cells, samples, indviduals) 
`y-axis`| measurement value

Output relations|.
---|---
`scale` | numeric, per cell

##### Details

The operator is based on a custom R function computing `(y - min(y)) / (max(y) - min(y))`.
