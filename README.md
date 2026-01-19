# KoggeStoneAdder

It is a high speed 4 bit adder. Its fastest as it do some levels of parallel computation. Unlike RCA, next bits dont wait for whole time to get carry. First level of computation happen at the moment input is applied. The delay here is based on the number of levels (not bit length). And those stages are in logarithmic order, which is a significant speed gain compared to RCA. So, the speed is very distinct from RCA. But, its true worth will be clearly seen with higher number of bits. For just four bit, speed gain is not that noteworthy.

**Issue:** It require more logic gates compared to other adders. So, more area is needed.

## Future Plan:
Make this adder parametrised!
