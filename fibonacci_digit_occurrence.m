function fibonacci_digit_occurrence(n)
    if n <= 0
        error('error');
    end

    fibonacci_series = zeros(1, n);
    fibonacci_series(1) = 1;
    if n > 1
        fibonacci_series(2) = 1;
    end

    for i = 3:n
        fibonacci_series(i) = fibonacci_series(i-1) + fibonacci_series(i-2);
    end

    fib_string = num2str(fibonacci_series);
    fib_string = fib_string(fib_string ~= ' ');

    digit_occurrences = zeros(1, 10);
    for digit = 0:9
        digit_occurrences(digit+1) = sum(fib_string == num2str(digit));
    end

    figure;
    bar(0:9, digit_occurrences);
    xlabel('Digits');
    ylabel('Occurrences');
    title(['Digit Occurrence', num2str(n)]);
end
