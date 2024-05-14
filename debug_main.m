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


    if debug_dt
        tokens = tokenize(input_string);
        printf("%d tokes:\n", length(tokens));
        for i = 1:length(tokens)
            display_token(tokens{i});
        end
    end


    if debug_da
        recognizer = Recognizer(tokenize(input_string));
        ast = recognizer.parse();
        display(ast);
    end

    if debug_json
        recognizer = Recognizer(tokenize(input_string));
        ast = recognizer.parse();
        display(exp2json(ast));
    end

    if eval
        recognizer = Recognizer(tokenize(input_string));
        ast = recognizer.parse();
        printf("%s = %d\n", exp2str(ast), evaluate(ast));
    end

end

