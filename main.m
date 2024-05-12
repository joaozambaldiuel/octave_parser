while true
    input_string = input(">>> ", "s");
    if strcmp(input_string, "quit")
        break;
        continue;
    end
    parser = Parser(ll1_tokenizer(input_string));
    ast = parser.parse();
    printf("%s = %d\n", exp2str(ast), evaluate(ast));
end

