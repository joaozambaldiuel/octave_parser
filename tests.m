tests = {};

tests{end+1} = struct("input", "1", "expected", 1);
tests{end+1} = struct("input", "1 + 2", "expected", 3);
tests{end+1} = struct("input", "1 + 2 + 3", "expected", 6);
tests{end+1} = struct("input", "1 + 2 + 3 + 4", "expected", 10);
tests{end+1} = struct("input", "+1", "expected", 1);
tests{end+1} = struct("input", "-1", "expected", -1);
tests{end+1} = struct("input", "-(1 + 1)", "expected", -2);
tests{end+1} = struct("input", "-(-1)", "expected", 1);
tests{end+1} = struct("input", "-(-(-1))", "expected", -1);
tests{end+1} = struct("input", "-(-(-(-1)))", "expected", 1);
tests{end+1} = struct("input", "-(-(-(-(-1))))", "expected", -1);
tests{end+1} = struct("input", "-(-(-(-(-(-1)))))", "expected", 1);
tests{end+1} = struct("input", "-(-(-(-(-(-1))))) * 3 * cos(0)", "expected", 3);
tests{end+1} = struct("input", "sin(0)", "expected", 0);
tests{end+1} = struct("input", "tan(0)", "expected", 0);
tests{end+1} = struct("input", "tg(0)", "expected", 0);
tests{end+1} = struct("input", "cos(0)", "expected", 1);
tests{end+1} = struct("input", "cos(sin(0))", "expected", 1);
tests{end+1} = struct("input", "cos(sin(tan(0)))", "expected", 1);
tests{end+1} = struct("input", "cos(sin(tan(tg(0))))", "expected", 1);
tests{end+1} = struct("input", "cos(sin(tan(tg(3 - 2 - 1))))", "expected", 1);
tests{end+1} = struct("input", "sin(sin(tg(0)) + tg(sin(0)))", "expected", 0);
tests{end+1} = struct("input", "-1 * (-1 + 1 + cos(0))", "expected", -1);
tests{end+1} = struct("input", "sqrt(4)", "expected", 2);
tests{end+1} = struct("input", "sqrt(3 * 3)", "expected", 3);
tests{end+1} = struct("input", "sqrt((-2) * (-3) * 6)", "expected", 6);
tests{end+1} = struct("input", "1 - 2 + 3", "expected", 2);
tests{end+1} = struct("input", "1 - 2 * 3 + 6", "expected", 1);
tests{end+1} = struct("input", "1 - 1 + 2 - 2 + 3 - 3", "expected", 0);
tests{end+1} = struct("input", "1 - (1 + 3) * 2", "expected", -7);

for i = 1:length(tests)

    test = tests{i};

    tokens = tokenize(test.input);
    recognizer = Recognizer(tokens);
    ast = recognizer.parse();
    real = evaluate(ast);
   
    if real == test.expected
        printf("TEST %-3d PASSED.\t%s = %d.\n", i, test.input, real);
    else
        printf("TEST %-3d FAILLED!", i);
        printf("FOR THE EXPRESSION %s WAS EXPECTED %d AND RECEIVED %d\n",
            test.input, test.expected, real);
    end

end

