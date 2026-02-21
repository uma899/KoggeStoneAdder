# KoggeStoneAdder

It is a high speed parametrised adder. Its fastest as it do as levels of parallel computation. Unlike RCA, next bits dont wait to get carry. First level of computation happen at the moment input is applied. The delay here is based on the number of levels (related Logarithmically to bit length instead of linear relation). As those stages are in logarithmic order, which is a significant speed gain compared to RCA. Its true worth will be clearly seen with higher number of bits. For lower lenghts (like for just four bit), speed gain is not that noteworthy. This is a powerful adder to be used in GPUs where speed is the ultimate goal.

**Issue:** It require more logic gates compared to other adders. So, much area is consumed.



## Future Plan:
Performing Synthesis.


## Prev. release
Initially, four bit adder is made with manual wiring. That release can be foung at [4-bit-KSA](https://github.com/uma899/KoggeStoneAdder/commit/093d526a6435a282f6afb98fb1d4dc210718cdbe)
