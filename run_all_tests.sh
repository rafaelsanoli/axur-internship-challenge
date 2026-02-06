#!/bin/sh

JAVA=/home/rafaelsanoli/.jdks/ms-17.0.18/bin/java
SRC_DIR=/home/rafaelsanoli/IdeaProjects/axur-internship-challenge/src
TEST_DIR=/home/rafaelsanoli/IdeaProjects/axur-internship-challenge/test

cd $SRC_DIR

echo "=========================================="
echo "TESTE 1: Texto mais profundo"
echo "Esperado: Texto mais profundo"
echo -n "Resultado: "
$JAVA HtmlAnalyzer file://$TEST_DIR/test_basic.html
echo ""

echo "=========================================="
echo "TESTE 2: Empate (retorna primeiro)"
echo "Esperado: Primeiro texto profundo"
echo -n "Resultado: "
$JAVA HtmlAnalyzer file://$TEST_DIR/test_tie.html
echo ""

echo "=========================================="
echo "TESTE 3: HTML mal-formado (tags cruzadas)"
echo "Esperado: malformed HTML"
echo -n "Resultado: "
$JAVA HtmlAnalyzer file://$TEST_DIR/test_malformed.html
echo ""

echo "=========================================="
echo "TESTE 4: Tag não fechada"
echo "Esperado: malformed HTML"
echo -n "Resultado: "
$JAVA HtmlAnalyzer file://$TEST_DIR/test_unclosed.html
echo ""

echo "=========================================="
echo "TESTE 5: Profundidade extra"
echo -n "Resultado: "
$JAVA HtmlAnalyzer file://$TEST_DIR/test_deep.html
echo ""

echo "=========================================="
echo "TESTE 6: Linhas vazias"
echo -n "Resultado: "
$JAVA HtmlAnalyzer file://$TEST_DIR/test_empty_lines.html
echo ""

echo "=========================================="
echo "TESTE 7: URL inválida"
echo "Esperado: URL connection error"
echo -n "Resultado: "
$JAVA HtmlAnalyzer https://url-invalida-que-nao-existe-123456789.com
echo ""

echo "=========================================="
echo "✓ TESTES CONCLUÍDOS"
echo "=========================================="
