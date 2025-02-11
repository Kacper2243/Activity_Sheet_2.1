// Load R0 into D
@R0
D=M

// Load R1 into A and compute OR
@R1
D=D|M
@temp
M=D  // Store OR result in temp

// Compute AND of R0 and R1
@R0
D=M
@R1
D=D&M

// Compute NOT of AND
D=!D

// Compute (R0 | R1) & !(R0 & R1)
@temp
D=M&D

// Store the result in R2
@R2
M=D
