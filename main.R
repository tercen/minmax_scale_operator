library(tercen)
library(dplyr)

range01 <- function(x, ...){(x - min(x, ...)) / (max(x, ...) - min(x, ...))}

do.scale = function(df, ...){
  
  scale.m = try(range01(as.matrix(df$.y), na.rm = TRUE), silent = TRUE)
  
  if(inherits(scale.m, 'try-error')) {
    return (data.frame(.ri = integer(),
                       .ci = integer(),
                       scale = double()))
  }  
  
  result = as_tibble(scale.m) %>% 
    rename_all(.funs = function(x) 'scale') %>% 
    mutate(.ri = df$.ri, .ci = df$.ci)
  
  return (result)
}

(ctx = tercenCtx()) %>% 
  select(.ci, .ri, .y) %>% 
  group_by(.ci, .ri) %>% 
  summarise(.y = mean(.y)) %>%
  group_by(.ri) %>%
  do(do.scale(.)) %>%
  ctx$addNamespace() %>%
  ctx$save()
