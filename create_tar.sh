#!/bin/sh

# Script para criar o arquivo .tar para entrega
# IMPORTANTE: Substitua "sanoli" pelo seu sobrenome real!

echo "========================================="
echo "  Criando arquivo TAR para entrega"
echo "========================================="
echo ""

SOBRENOME="sanoli"  # ← MODIFIQUE AQUI com seu sobrenome real!

cd /home/rafaelsanoli/IdeaProjects/axur-internship-challenge/src

echo "Criando arquivo: rafael_${SOBRENOME}.tar"
tar -cvf rafael_${SOBRENOME}.tar HtmlAnalyzer.java

if [ $? -eq 0 ]; then
    echo ""
    echo "✓ Arquivo criado com sucesso!"
    echo ""
    echo "Localização:"
    echo "  $(pwd)/rafael_${SOBRENOME}.tar"
    echo ""
    echo "Conteúdo do arquivo:"
    tar -tvf rafael_${SOBRENOME}.tar
    echo ""
    echo "========================================="
    echo "  Arquivo pronto para entrega!"
    echo "========================================="
else
    echo "ERRO: Falha ao criar o arquivo TAR"
    exit 1
fi
