# KoggeStoneAdder

It is a high speed parametrised adder. Its fastest as it works as levels of parallel computation. Unlike RCA, next bits don't wait to get carry. First level of computation happen at the moment input is applied. The delay here is based on the number of levels (related Logarithmically to bit length instead of linear relation). As those stages are in logarithmic order, which is a significant speed gain compared to RCA. For lower lengths (like for just four bit), speed gain is not that noteworthy. Its true worth will be clearly seen with higher number of bits. This is a **powerful adder** to be used in GPUs **where speed is the ultimate goal**.

## Features
* Fully Parameterized: Generate blocks are used. So layout will be laid based on bit length.
* High Performance: Achieves $O(\log_2 N)$ gate delay through parallel prefix computation.

  ![Image](https://raw.githubusercontent.com/uma899/KoggeStoneAdder/refs/heads/main/8_bit.jpg)
RTL Schematic

  

### Testing:
It is tested with around 10,000 test cases along with consideration of corner cases. 

### Trade-offs:
It require more logic gates compared to other adders. So, much area is consumed.

### Future Plan:
* Timing & Performance Benchmarking
* Physical Implementation & Verification on FPGA.
* Optimize for area, like using Brent-Kung architecture.


**Prev. release**
Initially, four bit adder is made with manual wiring. That release can be found at [4-bit-KSA](https://github.com/uma899/KoggeStoneAdder/commit/093d526a6435a282f6afb98fb1d4dc210718cdbe). Exhaustive Testing is done for it.
