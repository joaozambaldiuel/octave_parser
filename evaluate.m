function s = evaluate(expr)

    if expr.type == ExprType.BINARY_OPERATION

        lhs = evaluate(expr.lhs);
        rhs = evaluate(expr.rhs);
        opr = expr.opr;

        if strcmp(opr, "+")
            s = lhs + rhs;
        end

        if strcmp(opr, "-")
            s = lhs - rhs;
        end

        if strcmp(opr, "*")
            s = lhs * rhs;
        end

        if strcmp(opr, "/")
            s = lhs / rhs;
        end

    end

    if expr.type == ExprType.UNARY_OPERATION
              
        if strcmp(expr.opr, "-")
            s = -evaluate(expr.arg);
        end

        if strcmp(expr.opr, "+")
            s = evaluate(expr.arg);
        end

        if strcmp(expr.opr, "sin")
            s = sin(evaluate(expr.arg));
        end

        if strcmp(expr.opr, "cos")
            s = cos(evaluate(expr.arg));
        end

        if strcmp(expr.opr, "tan") || strcmp(expr.opr, "tg")
            s = tan(evaluate(expr.arg));
        end
        
        if strcmp(expr.opr, "exp")
            s = exp(evaluate(expr.arg));
        end
 
        if strcmp(expr.opr, "sqrt")
            s = sqrt(evaluate(expr.arg));
        end
 
        if strcmp(expr.opr, "ln") || strcmp(expr.opr, "log")
            s = log(evaluate(expr.arg));
        end

    end

    if expr.type == ExprType.NUMERIC_LITERAL
        s = expr.value;
    end

end
