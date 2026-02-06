#!/bin/sh

# Script de teste para HtmlAnalyzer
# Autor: Rafael Sanoli

echo "========================================="
echo "  HtmlAnalyzer - Script de Testes"
echo "========================================="
echo ""

# Compila o programa
echo "[1/5] Compilando HtmlAnalyzer.java..."
cd src
javac HtmlAnalyzer.java

if [ $? -ne 0 ]; then
    echo "ERRO: Falha na compilação!"
    exit 1
fi
echo "✓ Compilação bem-sucedida!"
echo ""

# Obtém o diretório absoluto do projeto
PROJECT_DIR=$(cd .. && pwd)

# Teste 1: Texto mais profundo
echo "[2/5] Teste 1: Texto mais profundo"
echo "Esperado: 'Texto mais profundo'"
echo "Resultado:"
java HtmlAnalyzer "file://${PROJECT_DIR}/test_basic.html"
echo ""

# Teste 2: Empate (retorna primeiro)
echo "[3/5] Teste 2: Empate - retorna o primeiro"
echo "Esperado: 'Primeiro texto profundo'"
echo "Resultado:"
java HtmlAnalyzer "file://${PROJECT_DIR}/test_tie.html"
echo ""

# Teste 3: HTML mal-formado (tags cruzadas)
echo "[4/5] Teste 3: HTML mal-formado (tags cruzadas)"
echo "Esperado: 'malformed HTML'"
echo "Resultado:"
java HtmlAnalyzer "file://${PROJECT_DIR}/test_malformed.html"
echo ""

# Teste 4: Tag não fechada
echo "[5/5] Teste 4: Tag não fechada"
echo "Esperado: 'malformed HTML'"
echo "Resultado:"
java HtmlAnalyzer "file://${PROJECT_DIR}/test_unclosed.html"
echo ""

echo "========================================="
echo "  Testes concluídos!"
echo "========================================="
echo ""
echo "Para testar com URL real:"
echo "  java HtmlAnalyzer <URL>"
echo ""
echo "Exemplo:"
echo "  java HtmlAnalyzer https://example.com"
