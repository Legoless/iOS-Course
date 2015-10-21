// DN2:

func fibonacci(number: UInt) -> UInt {
    var f1 : UInt = 0
    var f2 : UInt = 1
    var num : UInt = 0
    
    for var i : UInt = 1; i <= number; i++ {
        num = f1 + f2
        f2 = f1
        f1 = num
    }
    
    return num
}

func fibonacciRecursive(number: UInt) -> UInt {
    if number == 1 || number == 2 {
        return 1
    }
    
    return fibonacciRecursive(number - 2) + fibonacciRecursive(number - 1)
}

print("Fibonacci: \(fibonacci(12))")
print("Fibonacci recursive: \(fibonacciRecursive(12))")