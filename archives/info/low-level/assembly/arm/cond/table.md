# Table of conditions

[Go back](../index.md#conditions)

This is a table summarizing the operators that you can use to add a condition on an operation.

|NZCV bits|Operator| NZCV   |        Detail         |
|----|------|---------------|-------------------------|
|    |  al  |               | Always                  |
|0000|  eq  |      Z        | Last result is 0        |
|0001|  ne  |     !Z        | Last result isn't 0     |
|0100|  mi  |      N        | Last result is negative |
|0101|  pl  |     !N        | Last result is positive |
|1010|  ge  |    N==V       | Greater or equals       |
|1011|  lt  |   N != V      | Lesser than             |
|1100|  gt  | !Z AND (N==V) | Greater than            |
|1101|  le  | Z or (N != V) | Lesser or equals        |
|    |CS, CC|    C, !C      | With/Without carry      |
|    |VS, VC|    V, !V      | With/Without overflow   |