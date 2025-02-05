@R0      // Load x into D
D=M      
@R2      
M=0      // Initialise R2 to 0 (assume x is non-negative)
@R3      
M=0      // Initialise R3 to 0 (assume |x| can be computed)

@R0      
D=M      // Load x into D
@NEGATIVE
D;JLT    // If x < 0, jump to NEGATIVE

@R1      
M=D      // Store x in R1 (x is non-negative, so |x| = x)
@END
0;JMP    // Jump to END

(NEGATIVE)
@R2      
M=1      // Set R2 to 1 (x is negative)

@R0      
D=M      // Load x into D
D=-D     // Compute -x
@OVERFLOW
D;JLT    // If -x < 0, jump to OVERFLOW

@R1      
M=D      // Store |x| = -x in R1
@END
0;JMP    // Jump to END

(OVERFLOW)
@R3      
M=1      // Set R3 to 1 (overflow occurred)
@R1      
M=@R0    // Store x in R1 (unchanged)

(END)
