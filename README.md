# 8086 Assembly Programming Assignment

## Project Overview

This repository contains a collection of 8086 assembly language programs designed as educational assignments for computer architecture and assembly programming courses. The project demonstrates fundamental concepts in 8086 assembly programming including character classification, sorting algorithms, mathematical computations, and recursive procedures.

## Project Structure

The repository consists of four assembly source files organized into two main categories:

```
8086_assembly_assignment_3-1/
├── Task1.asm              # Character classification program
├── Task2.asm              # Three-character sorting program
├── TASK_1_Offline_2.asm   # Chocolate distribution calculator
└── TASK_2_Offline_2.asm   # Sum of digits calculator
```

## File Descriptions

### Task1.asm - Character Classification Program

**Purpose**: Classifies a single ASCII character input into one of four categories: uppercase letter, lowercase letter, number, or non-alphanumeric character.

**Key Features**:
- Interactive character input with user prompt
- ASCII value comparison using conditional jumps
- Comprehensive character range validation
- Clear categorized output messages

**Functionality**:
- Prompts user for a single ASCII character
- Performs range checks:
  - Numbers: ASCII 48-57 (0-9)
  - Uppercase letters: ASCII 65-90 (A-Z)
  - Lowercase letters: ASCII 97-122 (a-z)
  - Non-alphanumeric: all other characters
- Displays appropriate classification message

### Task2.asm - Three-Character Sorting Program

**Purpose**: Accepts three lowercase letters as input, validates them, sorts them in ascending order, and determines the smallest character or if all are equal.

**Key Features**:
- Input validation for lowercase letters (ASCII 97-122)
- Bubble sort implementation using conditional exchanges
- Equal character detection
- Error handling for invalid inputs

**Functionality**:
- Prompts for three lowercase letters sequentially
- Validates each input is within lowercase range
- Implements sorting algorithm with three comparison phases
- Outputs either the smallest character or "All letters are equal" message
- Graceful error handling with program termination for invalid inputs

### TASK_1_Offline_2.asm - Chocolate Distribution Calculator

**Purpose**: Calculates the total number of chocolates a person can obtain given an initial amount and an exchange rate for wrappers.

**Key Features**:
- Multi-digit number input parsing
- Mathematical division and remainder operations
- Iterative calculation loop
- Custom number display functionality

**Functionality**:
- Accepts two space-separated integers: initial chocolates (n) and exchange rate (k)
- Implements algorithm to calculate total chocolates:
  - Starts with n chocolates
  - Exchanges k wrappers for 1 additional chocolate
  - Continues until insufficient wrappers remain
- Displays final total chocolate count

**Algorithm Logic**:
```
total_chocolates = n
current_wrappers = n
while current_wrappers >= k:
    new_chocolates = current_wrappers / k
    total_chocolates += new_chocolates
    current_wrappers = (current_wrappers % k) + new_chocolates
```

### TASK_2_Offline_2.asm - Sum of Digits Calculator

**Purpose**: Calculates the sum of all digits in a given positive integer using recursive procedures.

**Key Features**:
- Multi-digit integer input processing
- Recursive digit summation algorithm
- Custom recursive printing procedure
- Modular procedure design

**Functionality**:
- Accepts a space-terminated positive integer
- Implements recursive `DIGITSUM` procedure:
  - Base case: returns accumulated sum when number reaches 0
  - Recursive case: extracts last digit and calls itself with remaining number
- Uses recursive `PRINT` procedure for output formatting
- Displays the calculated sum of digits

**Recursive Algorithm**:
```
DIGITSUM(number, accumulator):
    if number == 0:
        return accumulator
    else:
        last_digit = number % 10
        return DIGITSUM(number / 10, accumulator + last_digit)
```

## Technical Implementation Details

### Assembly Language Features Utilized

1. **Memory Models**: All programs use the SMALL memory model
2. **Stack Management**: 100H bytes allocated for stack operations
3. **Data Segment Variables**: Character storage, temporary variables, and message strings
4. **DOS Interrupts**:
   - `INT 21H` with `AH=1`: Character input
   - `INT 21H` with `AH=2`: Character output
   - `INT 21H` with `AH=9`: String output
   - `INT 21H` with `AH=4CH`: Program termination

### Programming Constructs

1. **Conditional Logic**: Extensive use of `CMP` and conditional jumps (`JL`, `JG`, `JE`)
2. **Loops**: Implemented using labels and conditional jumps
3. **Procedures**: Modular programming with `PROC` and `ENDP`
4. **Stack Operations**: `PUSH` and `POP` for parameter passing and local storage
5. **Arithmetic Operations**: Division (`DIV`), multiplication (`IMUL`), and modular arithmetic

## Prerequisites and Setup

### System Requirements

- **Operating System**: MS-DOS or DOS-compatible environment
- **Assembler**: MASM (Microsoft Macro Assembler) or compatible assembler
- **Linker**: LINK.EXE or equivalent linking utility
- **Environment**: 16-bit x86 processor or emulator

### Development Environment Setup

1. **Install MASM**: Ensure Microsoft Macro Assembler is installed and accessible
2. **DOS Environment**: Set up DOS environment or use DOSBox emulator
3. **PATH Configuration**: Add assembler and linker to system PATH

## Compilation and Execution Instructions

### Compilation Process

For each `.asm` file, follow these steps:

```bash
# Assembly phase
MASM filename.asm;

# Linking phase  
LINK filename.obj;

# Execution
filename.exe
```

### Specific Compilation Commands

```bash
# Task 1 - Character Classification
MASM Task1.asm;
LINK Task1.obj;
Task1.exe

# Task 2 - Character Sorting
MASM Task2.asm;
LINK Task2.obj;
Task2.exe

# Offline Task 1 - Chocolate Calculator
MASM TASK_1_Offline_2.asm;
LINK TASK_1_Offline_2.obj;
TASK_1_Offline_2.exe

# Offline Task 2 - Sum of Digits
MASM TASK_2_Offline_2.asm;
LINK TASK_2_Offline_2.obj;
TASK_2_Offline_2.exe
```

## Usage Examples

### Task1.asm Usage
```
INPUT A SINGLE ASCII CHARACTER: A
Uppercase letter

INPUT A SINGLE ASCII CHARACTER: 5
Number

INPUT A SINGLE ASCII CHARACTER: @
Not an alphanumeric value
```

### Task2.asm Usage
```
ENTER 1ST LOWERCASE LETTER: c
ENTER 2ND LOWERCASE LETTER: a
ENTER 3RD LOWERCASE LETTER: b
a

ENTER 1ST LOWERCASE LETTER: x
ENTER 2ND LOWERCASE LETTER: x
ENTER 3RD LOWERCASE LETTER: x
All letters are equal
```

### TASK_1_Offline_2.asm Usage
```
Enter n and k: 10 3
TOTAL CHOCOLATES HE CAN HAVE: 14
```

### TASK_2_Offline_2.asm Usage
```
ENTER THE NUMBER: 1234 
SUM OF DIGITS: 10
```

## Error Handling

Each program includes appropriate error handling mechanisms:

- **Input Validation**: Character range checking in Task2.asm
- **Graceful Termination**: Programs exit cleanly with appropriate error messages
- **Invalid Input Messages**: Clear error notifications for user guidance

## Educational Objectives

This assignment collection demonstrates proficiency in:

1. **Basic Assembly Programming**: Variable declaration, memory management, and program structure
2. **Control Flow**: Conditional statements, loops, and program branching
3. **Input/Output Operations**: DOS interrupt handling and user interaction
4. **Algorithm Implementation**: Sorting, mathematical calculations, and recursive procedures
5. **Code Organization**: Modular programming with procedures and proper documentation

## Development Guidelines

### Code Style Conventions

- **Consistent Indentation**: Four-space indentation for code blocks
- **Clear Labels**: Descriptive label names for program flow control
- **Comment Documentation**: Inline comments explaining complex operations
- **Variable Naming**: Meaningful variable names in DATA segment

### Best Practices Demonstrated

1. **Memory Efficiency**: Optimal use of registers and memory locations
2. **Code Reusability**: Modular procedures for common operations
3. **Error Prevention**: Input validation and boundary checking
4. **Clear Program Flow**: Logical organization with well-defined entry and exit points

## Technical Notes

### Register Usage Patterns

- **AX Register**: Primary accumulator for arithmetic operations and DOS function calls
- **BX Register**: Base register for addressing and temporary storage
- **CX Register**: Counter register for loop operations
- **DX Register**: Data register for I/O operations and division remainder

### Memory Management

- **Stack Segment**: Configured with 100H bytes for procedure calls and temporary storage
- **Data Segment**: Efficiently organized with variables, constants, and message strings
- **Code Segment**: Contains program logic with proper procedure definitions

## Conclusion

This repository serves as a comprehensive introduction to 8086 assembly language programming, covering essential concepts from basic character manipulation to advanced recursive algorithms. Each program is designed to be educational, demonstrating specific assembly language features while solving practical computational problems.

The code demonstrates professional assembly programming practices including proper error handling, modular design, efficient algorithm implementation, and clear documentation standards suitable for academic and professional development environments.