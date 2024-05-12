debug_dt = false;
debug_da = false;
debug_json = false;
eval = false;

while true
    
    input_string = input(">>> ", "s");

    if strcmp(input_string, "quit")
        break;
        continue;
    end

    if strcmp(input_string, "eval")
        eval = !eval;
        continue;
    end

    if strcmp(input_string, "tokens")
        debug_dt = !debug_dt;
        continue;
    end

    if strcmp(input_string, "ast")
        debug_da = !debug_da;
        continue;
    end

    if strcmp(input_string, "json")
        debug_json = !debug_json;
        continue;
    end

    parser = Parser(ll1_tokenizer(input_string));

    if debug_dt
        printf("%d tokes:\n", length(parser.tokens));
        for i = 1:length(parser.tokens)
            display_token(parser.tokens{i});
        end
    end

    ast = parser.parse();

    if debug_da
        display(ast);
    end

    if debug_json
        display(exp2json(ast));
    end

    if eval
        printf("%s = %d\n", exp2str(ast), evaluate(ast));
    end

end

