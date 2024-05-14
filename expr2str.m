function s = expr2str(expr)

    s = "";

    if expr.type == ExprType.BINARY_OPERATION
        s = sprintf("(%s %s %s)", expr2str(expr.lhs), expr.opr, expr2str(expr.rhs));
    end

    if expr.type == ExprType.UNARY_OPERATION
        s = sprintf("(%s %s)", expr.opr, expr2str(expr.arg));
    end

    if expr.type == ExprType.NUMERIC_LITERAL
        s = num2str(expr.value);
    end

end
