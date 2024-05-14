while true

    input_string = input("recognizer> ", "s");
    input_string = strtrim(input_string);

    if strcmp(input_string, "quit") || strcmp(input_string, "exit")
        break;
    end

    tokens = tokenize(input_string);
    recognizer = Recognizer(tokens);
    ast = recognizer.parse();

    printf("ans: %d\n", evaluate(ast));

end

