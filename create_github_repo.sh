#!/bin/sh

# Script para criar repositório no GitHub e fazer push
# Autor: Rafael Sanoli

echo "========================================="
echo "  CRIAR REPOSITÓRIO NO GITHUB"
echo "========================================="
echo ""

# Verifica se está no diretório correto
if [ ! -f "src/HtmlAnalyzer.java" ]; then
    echo "ERRO: Execute este script no diretório do projeto!"
    exit 1
fi

# Verifica se já tem remote
if git remote | grep -q origin; then
    echo "⚠️  Remote 'origin' já existe!"
    echo ""
    echo "Remote atual:"
    git remote -v
    echo ""
    read -p "Deseja sobrescrever? (s/N): " resposta
    if [ "$resposta" = "s" ] || [ "$resposta" = "S" ]; then
        git remote remove origin
        echo "✓ Remote removido"
    else
        echo "Abortado."
        exit 0
    fi
fi

echo "Para criar o repositório, você precisa:"
echo "1. Ir em: https://github.com/new"
echo "2. Nome do repositório: axur-internship-challenge"
echo "3. Descrição: Solução do desafio técnico Axur"
echo "4. Escolher Public ou Private"
echo "5. NÃO adicionar README, .gitignore ou licença"
echo "6. Clicar em 'Create repository'"
echo ""
read -p "Pressione ENTER quando tiver criado o repositório..."
echo ""

# Pede o username
read -p "Digite seu username do GitHub: " username

if [ -z "$username" ]; then
    echo "ERRO: Username não pode ser vazio!"
    exit 1
fi

echo ""
echo "Escolha o método de autenticação:"
echo "1. HTTPS (usa Personal Access Token)"
echo "2. SSH (mais seguro, requer chave SSH configurada)"
echo ""
read -p "Escolha (1 ou 2): " metodo

if [ "$metodo" = "1" ]; then
    # HTTPS
    REPO_URL="https://github.com/${username}/axur-internship-challenge.git"
    echo ""
    echo "ℹ️  Você precisará de um Personal Access Token"
    echo "   Crie em: https://github.com/settings/tokens"
    echo "   Permissões necessárias: repo, workflow"
    echo ""
elif [ "$metodo" = "2" ]; then
    # SSH
    REPO_URL="git@github.com:${username}/axur-internship-challenge.git"
    echo ""
    echo "ℹ️  Certifique-se que sua chave SSH está em:"
    echo "   https://github.com/settings/keys"
    echo ""
else
    echo "ERRO: Opção inválida!"
    exit 1
fi

echo "URL do repositório: $REPO_URL"
echo ""
read -p "Confirma? (s/N): " confirma

if [ "$confirma" != "s" ] && [ "$confirma" != "S" ]; then
    echo "Abortado."
    exit 0
fi

# Adiciona remote
echo ""
echo "[1/2] Adicionando remote..."
git remote add origin "$REPO_URL"

if [ $? -ne 0 ]; then
    echo "ERRO: Falha ao adicionar remote!"
    exit 1
fi
echo "✓ Remote adicionado"

# Verifica
echo ""
echo "Remote configurado:"
git remote -v
echo ""

# Push
echo "[2/2] Fazendo push..."
git push -u origin main

if [ $? -ne 0 ]; then
    echo ""
    echo "❌ ERRO no push!"
    echo ""
    echo "Possíveis causas:"
    echo "1. Repositório não foi criado no GitHub"
    echo "2. Credenciais incorretas"
    echo "3. Chave SSH não configurada (se escolheu SSH)"
    echo ""
    echo "Tente novamente com:"
    echo "  git push -u origin main"
    exit 1
fi

echo ""
echo "========================================="
echo "  ✅ SUCESSO!"
echo "========================================="
echo ""
echo "Seu repositório está em:"
echo "  https://github.com/${username}/axur-internship-challenge"
echo ""
echo "Você pode:"
echo "• Ver os arquivos online"
echo "• Compartilhar o link no seu currículo"
echo "• Adicionar ao seu portfólio"
echo ""
echo "Próximos commits:"
echo "  git add ."
echo "  git commit -m 'sua mensagem'"
echo "  git push"
echo ""
echo "========================================="
