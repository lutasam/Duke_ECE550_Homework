# Checkpoint 1

* Name: Chenwei Gu
* netID: cg356
* To build the simple ALU, I use a 32-bit CSA as the basis and a 2:1 MUX to select whether the operation is ADD or SUBTRACTION (if it's ADD, keep B as is, otherwise use 32 not gates to reverse all bits in B and connect CSA's CIN to 1). In CSA, I use three 16-bit RCA to build it. One is used to calculate the lower 16 bits addition and others are used to calculate the higher 16 bits addition in both the carry case and the no-carry case. And I also use a 16-bit 2:1 MUX to choose these two cases. As for the RCAs, I use 16 full adders to build each of them.

