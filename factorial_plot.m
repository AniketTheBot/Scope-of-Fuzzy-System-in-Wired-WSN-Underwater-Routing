function factorial_plot(n)
    if n < 0 
        error('error');
    end

    numbers = 0:n;
    factorials = zeros(1, n+1);
    for i = 0:n
        factorials(i+1) = factorial(i);
    end

    figure;
    plot(numbers, factorials, '-o', 'LineWidth', 2);
    xlabel('Number');
    ylabel('Factorial');
    title('Factorials');
end
