classdef Parser < handle

    properties
        tokens;
        cursor;
    end

    methods
        function obj = Parser(tokens)
            obj.tokens = tokens;
            obj.cursor = 1;
        end

        function tok = at(obj)
           tok = obj.tokens{obj.cursor};
        end

        function tok = peak(obj)
            tok = obj.tokens{obj.cursor + 1};
        end

        function eat(obj, kind)
            if obj.at().kind == kind
                obj.cursor += 1;
            else    
                printf("ERROR! Expected %d, instead recieved: %d\n", 
                       kind, obj.at().kind);
                quit();
            end
        end

        function expr = parse(obj)
            expr = parse_expression(obj);
        end

        # parse + & -
        function expr = parse_expression(obj)
            lhs = obj.parse_term();

            while obj.at().kind == TokenType.PLUS || obj.at().kind == TokenType.MINUS

                operator = obj.at().value;
                obj.eat(obj.at().kind);
                rhs = obj.parse_expression();

                nlhs.type = ExprType.BINARY_OPERATION;
                nlhs.lhs = lhs;
                nlhs.opr = operator;
                nlhs.rhs = rhs;

                lhs = nlhs;

            end

           expr = lhs;
        end

        # parse * & / 
        function term = parse_term(obj)

            term = obj.parse_factor();

            while obj.at().kind == TokenType.TIMES || obj.at().kind == TokenType.DIVIDE
                operator = obj.at().value;
                obj.eat(obj.at().kind);
                rhs = obj.parse_term();

                aux.type = ExprType.BINARY_OPERATION;
                aux.opr = operator;
                aux.lhs = term;
                aux.rhs = rhs;

                term = aux;
            end
        end

        function factor = parse_factor(obj)

            if obj.at().kind == TokenType.WORD || obj.at().kind == TokenType.PLUS || obj.at().kind == TokenType.MINUS

                factor.type = ExprType.UNARY_OPERATION;
                factor.opr = obj.at().value;
                obj.eat(obj.at().kind);
                factor.arg = obj.parse_factor();
                return;

            end

            if obj.at().kind == TokenType.NUMBER
                factor.type = ExprType.NUMERIC_LITERAL;
                factor.value = obj.at().value;
                obj.eat(TokenType.NUMBER);
                return;
            end

            if obj.at().kind == TokenType.LPAREN
                obj.eat(TokenType.LPAREN);
                factor.type = ExprType.PEXPRESSION;
                factor.inner_expr = obj.parse_expression();
                obj.eat(TokenType.RPAREN);
                return;
            end

        end
    end
end

