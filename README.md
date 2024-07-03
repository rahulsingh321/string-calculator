# String Calculator

## Overview
The String Calculator is a Ruby utility that performs addition on a string of numbers. This project demonstrates the principles of Test-Driven Development (TDD) by implementing and refining the calculator through various test cases.

## Features
### Empty String Handling

```
Input: ""
Output: 0
Description: Returns 0 for an empty string.
```
### Single Number
```
Input: "1"
Output: 1
Description: Returns the single number itself.
```
### Two Numbers
```
Input: "1,5"
Output: 6
Description: Returns the sum of the two numbers.
```
### Handling New Lines

```
Input: "1\n2,3"
Output: 6
Description: Handles new lines as well as commas for separating numbers.
```
### Custom Delimiters

```
Input: "//;\n1;2"
Output: 3
Description: Allows custom delimiters specified at the beginning of the string.
```
### Negative Numbers
```
Input: "1,-2"
Output: Throws an exception: negative numbers not allowed -2
Description: Throws an exception if negative numbers are present, listing all negatives.
```
### Ignoring Large Numbers
```
Input: "2,1001"
Output: 2
Description: Ignores numbers greater than 1000.
```
### Get Call Count
```
Method: get_call_count()
Description: Returns the number of times the add method was invoked.
```
