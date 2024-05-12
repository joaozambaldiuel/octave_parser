function s = exp2str(expr)

    s = "";

    if expr.type == ExprType.BINARY_OPERATION
        lhs = exp2str(expr.lhs);
        opr = expr.opr;
        rhs = exp2str(expr.rhs);
        s = strcat("(", lhs, " ", opr, " ", rhs, ")");
    end

    if expr.type == ExprType.UNARY_OPERATION
        s = sprintf("(%s %s)", expr.opr, exp2str(expr.arg));
    end

    if expr.type == ExprType.NUMERIC_LITERAL
        s = num2str(expr.value);
    end

    if expr.type == ExprType.PEXPRESSION
        s = sprintf("(%s)", exp2str(expr.inner_expr));
    end

end
