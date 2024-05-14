function s = expr2json(expr)

    s = "";

    if expr.type == ExprType.BINARY_OPERATION
        s = sprintf('{ "type": "bop", "lhs": %s, "rhs": %s, "opr": "%s"}', 
                expr2json(expr.lhs), expr2json(expr.rhs), expr.opr);
    end

    if expr.type == ExprType.UNARY_OPERATION
        s = sprintf('{ "type": "uop", "opr": "%s", "inner": %s }', expr.opr, expr2json(expr.arg));
    end

    if expr.type == ExprType.NUMERIC_LITERAL
        s = num2str(expr.value);
    end

end
