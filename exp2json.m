function s = exp2json(expr)

    s = "";

    if expr.type == ExprType.BINARY_OPERATION
        lhs = exp2json(expr.lhs);
        opr = expr.opr;
        rhs = exp2json(expr.rhs);
        s = sprintf('{ "type": "bop", "lhs": %s, "rhs": %s, "opr": "%s"}', lhs, rhs, opr);
    end

    if expr.type == ExprType.UNARY_OPERATION
        s = sprintf('{ "type": "uop", "opr": "%s", "inner": %s }', expr.opr, exp2json(expr.arg));
    end

    if expr.type == ExprType.NUMERIC_LITERAL
        s = num2str(expr.value);
    end

    if expr.type == ExprType.PEXPRESSION
        s = sprintf('{ "type": "pexp", "value": %s }', exp2json(expr.inner_expr));
    end

end
