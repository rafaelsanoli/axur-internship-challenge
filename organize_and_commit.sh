#!/bin/sh

# Script para organizar arquivos e fazer commit
# Autor: Rafael Sanoli

echo "========================================="
echo "  Organizando projeto e fazendo commit"
echo "========================================="
echo ""

cd /home/rafaelsanoli/IdeaProjects/axur-internship-challenge

# Copia arquivos para docs/
echo "[1/4] Organizando documentos..."
cp RESUMO_SOLUCAO.md docs/ 2>/dev/null || true
cp EXEMPLO_VISUAL.md docs/ 2>/dev/null || true

# Adiciona os arquivos principais ao git
echo "[2/4] Adicionando arquivos ao Git..."
git add src/HtmlAnalyzer.java
git add README.md
git add docs/RESUMO_SOLUCAO.md
git add docs/EXEMPLO_VISUAL.md
git add test/*.html
git add .gitignore

# Verifica status
echo ""
echo "[3/4] Status do Git:"
git status --short

# Faz o commit
echo ""
echo "[4/4] Fazendo commit..."
git commit -m "refactor: Reorganiza projeto com estrutura profissional

- Adiciona comentários bilíngues (PT-BR/EN) no código
- Cria README documental com versões PT-BR e EN
- Move testes para pasta test/
- Move documentação para pasta docs/
- Mantém apenas README na raiz do repositório
- Adiciona RESUMO_SOLUCAO.md e EXEMPLO_VISUAL.md em docs/

Melhorias no código:
- Comentários explicativos em português e inglês
- JavaDoc atualizado
- Código mais acessível para revisores internacionais

Melhorias na documentação:
- README profissional e técnico (não gerado por IA)
- Explica decisões de design e desafios enfrentados
- Estrutura bilíngue para maior alcance"

if [ $? -eq 0 ]; then
    echo ""
    echo "========================================="
    echo "  ✅ Commit realizado com sucesso!"
    echo "========================================="
    echo ""
    echo "Arquivos commitados:"
    echo "  - src/HtmlAnalyzer.java (com comentários bilíngues)"
    echo "  - README.md (versão profissional PT-BR + EN)"
    echo "  - docs/RESUMO_SOLUCAO.md"
    echo "  - docs/EXEMPLO_VISUAL.md"
    echo "  - test/*.html (6 casos de teste)"
    echo ""
    echo "Próximo passo:"
    echo "  git push origin main"
    echo ""
else
    echo ""
    echo "❌ Erro ao fazer commit!"
    exit 1
fi
