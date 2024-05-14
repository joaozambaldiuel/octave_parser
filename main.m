while true

    input_string = input(">>> ", "s");
    input_string = strtrim(input_string);

    if strcmp(input_string, "quit") || strcmp(input_string, "exit")
        break;
    end

    parser = Parser(tokenize(input_string));
    ast = parser.parse();

    printf("%s = %d\n", exp2str(ast), evaluate(ast));

end

