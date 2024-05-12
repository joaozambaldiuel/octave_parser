function tokens = ll1_tokenizer(input_string)

    % Initialize empty token list
    tokens = {};
    
    % Iterate through input string
    index = 1;
    while index <= length(input_string)

        char = input_string(index);
 
        % Skip whitespace
        if char == ' '
            index = index + 1;
            continue;
        end

        if index > length(input_string)
            break;
        end
       
        if isalpha(char)
            word = char;
            index += 1;
            while index <= length(input_string) && isalpha(input_string(index))
                word = [word, input_string(index)];
                index += 1;
            end
            tokens{end+1} = struct('kind', TokenType.WORD, 'value', word);
            continue;
        end

        % Check if character is a digit
        if isdigit(char)
            % Tokenize number
            num_str = char;
            index = index + 1;
            while index <= length(input_string) && isdigit(input_string(index))
                num_str = [num_str, input_string(index)];
                index = index + 1;
            end
            
            if index <= length(input_string) && input_string(index) == "."
                num_str = [num_str, "."];
                index = index + 1;
            end

            while index <= length(input_string) && isdigit(input_string(index))
                num_str = [num_str, input_string(index)];
                index = index + 1;
            end

            tokens{end+1} = struct('kind', TokenType.NUMBER, 'value', str2double(num_str));
            continue;
        end
        
        if char == "+"
            tokens{end+1} = struct('kind', TokenType.PLUS, 'value', char);
            index = index + 1;
            continue;
        end
 
        if char == "-"
            tokens{end+1} = struct('kind', TokenType.MINUS, 'value', char);
            index = index + 1;
            continue;
        end

        if char == "*"
            tokens{end+1} = struct('kind', TokenType.TIMES, 'value', char);
            index = index + 1;
            continue;
        end

        if char == "/"
            tokens{end+1} = struct('kind', TokenType.DIVIDE, 'value', char);
            index = index + 1;
            continue;
        end

        if char == "("
            tokens{end+1} = struct('kind', TokenType.LPAREN, 'value', char);
            index = index + 1;
            continue;
        end

        if char == ")"
            tokens{end+1} = struct('kind', TokenType.RPAREN, 'value', char);
            index = index + 1;
            continue;
        end

        % If the character doesn't match any token type or whitespace, raise an error
        error(['Invalid character: ', char]);

    end

    tokens{end+1} = struct('kind', TokenType.EOF, 'value', 0);
end

