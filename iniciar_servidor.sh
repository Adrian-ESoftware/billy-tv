#!/usr/bin/env bash
# ========================================================
# JIGSAW TV - Inicializador de Servidor Local
# Permite salvar permanentemente a permissão de microfone
# ========================================================

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR"

PORT=8080
# Verifica se a porta 8080 está em uso e busca outra se necessário
while lsof -i :$PORT >/dev/null 2>&1; do
  PORT=$((PORT + 1))
done

echo "=================================================="
echo "🩸 INICIANDO SERVIDOR JIGSAW TV NA PORTA $PORT"
echo "=================================================="
echo "Abra no navegador:"
echo "👉 Mestre:  http://localhost:$PORT/mestre.html"
echo "👉 Players: http://localhost:$PORT/player.html#SESSAO1"
echo "=================================================="

# Abre automaticamente o navegador padrão
if command -v xdg-open >/dev/null 2>&1; then
  xdg-open "http://localhost:$PORT/mestre.html" &
elif command -v google-chrome >/dev/null 2>&1; then
  google-chrome "http://localhost:$PORT/mestre.html" &
fi

python3 -m http.server $PORT
