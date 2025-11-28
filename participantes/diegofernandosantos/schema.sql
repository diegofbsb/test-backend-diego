CREATE INDEX IF NOT EXISTS idx_transacoes_cliente_data
    ON transacoes (cliente_id, realizada_em DESC);

CREATE INDEX IF NOT EXISTS idx_transacoes_cliente_id
    ON transacoes (cliente_id);
