function display_token(token)

    kind = "";

    switch (token.kind)
        case TokenType.NUMBER
            kind = "NUM    ";
        case TokenType.PLUS
            kind = "PLUS   ";
        case TokenType.MINUS
            kind = "MINUS  ";
        case TokenType.TIMES
            kind = "TIMES  ";
        case TokenType.DIVIDE
            kind = "DIVIDE";
        case TokenType.LPAREN
            kind = "LPAREN ";
        case TokenType.RPAREN
            kind = "RPAREN ";
        case TokenType.EOF
            kind = "EOF    ";
        case TokenType.WORD
            kind = "WORD   ";
        otherwise
            kind = "UNKN  ";
    end

    if token.kind == TokenType.WORD
        printf("TOKEN TYPE: %s; VALUE %s\n", kind, token.value);
    end
 
    if token.kind != TokenType.WORD
        printf("TOKEN TYPE: %s; VALUE %d\n", kind, token.value);
    end
end
