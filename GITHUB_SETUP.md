# 🚀 GUIA PARA CRIAR REPOSITÓRIO NO GITHUB

## ✅ Status Atual
- ✅ Git inicializado localmente
- ✅ Arquivos adicionados ao staging
- ✅ Commit inicial realizado
- ✅ Branch principal: `main`

**Arquivos commitados:**
- `src/HtmlAnalyzer.java` - Código principal
- `README.md` - Documentação
- `RESUMO_SOLUCAO.md` - Resumo da solução
- `test_basic.html` - Teste básico
- `test_tie.html` - Teste de empate
- `test_malformed.html` - Teste de tags cruzadas
- `test_unclosed.html` - Teste de tag não fechada
- `test_deep.html` - Teste de múltiplos níveis
- `test_empty_lines.html` - Teste de linhas vazias
- `.gitignore` - Configuração Git

---

## 📋 PASSO A PASSO PARA CRIAR E SUBIR O REPOSITÓRIO

### Opção 1: Usando a Interface Web do GitHub (RECOMENDADO)

#### 1. Criar o Repositório no GitHub

1. Acesse: https://github.com/new
2. Preencha:
   - **Repository name:** `axur-internship-challenge`
   - **Description:** `Solução do desafio técnico para Estágio em Engenharia de Software na Axur`
   - **Visibility:** 
     - ✅ **Public** (se quiser mostrar no portfólio)
     - ⚪ **Private** (se preferir manter privado até finalizar o processo)
3. **NÃO** marque "Add a README file"
4. **NÃO** marque "Add .gitignore"
5. **NÃO** escolha licença (ou escolha MIT se quiser)
6. Clique em **"Create repository"**

#### 2. Conectar o Repositório Local ao GitHub

Após criar o repositório, o GitHub vai mostrar comandos. Use estes:

```bash
cd /home/rafaelsanoli/IdeaProjects/axur-internship-challenge

# Adicione o remote (SUBSTITUA 'seu-usuario' pelo seu username do GitHub!)
git remote add origin https://github.com/seu-usuario/axur-internship-challenge.git

# Faça o push
git push -u origin main
```

**Ou se você usar SSH:**
```bash
git remote add origin git@github.com:seu-usuario/axur-internship-challenge.git
git push -u origin main
```

#### 3. Verificar

Acesse: `https://github.com/seu-usuario/axur-internship-challenge`

Você deve ver todos os arquivos commitados! 🎉

---

### Opção 2: Usando GitHub CLI (se estiver instalado)

```bash
cd /home/rafaelsanoli/IdeaProjects/axur-internship-challenge

# Criar repositório e fazer push
gh repo create axur-internship-challenge --public --source=. --remote=origin --push

# Ou privado:
gh repo create axur-internship-challenge --private --source=. --remote=origin --push
```

---

## 🔐 AUTENTICAÇÃO

### Se pedir autenticação ao fazer push:

#### Opção A: Personal Access Token (HTTPS)
1. Vá em: https://github.com/settings/tokens
2. Generate new token (classic)
3. Dê permissões: `repo`, `workflow`
4. Copie o token
5. Use como senha quando pedir

#### Opção B: SSH (Recomendado)
```bash
# Gere uma chave SSH (se não tiver)
ssh-keygen -t ed25519 -C "seu-email@exemplo.com"

# Copie a chave pública
cat ~/.ssh/id_ed25519.pub

# Cole em: https://github.com/settings/keys
```

Depois use a URL SSH ao invés de HTTPS:
```bash
git remote set-url origin git@github.com:seu-usuario/axur-internship-challenge.git
git push -u origin main
```

---

## 📝 COMANDOS PRONTOS

Copie e cole (substitua `seu-usuario`):

```bash
# 1. Vá para o diretório do projeto
cd /home/rafaelsanoli/IdeaProjects/axur-internship-challenge

# 2. Adicione o remote (MUDE 'seu-usuario'!)
git remote add origin https://github.com/seu-usuario/axur-internship-challenge.git

# 3. Verifique o remote
git remote -v

# 4. Faça o push
git push -u origin main
```

---

## ✅ VERIFICAÇÃO

Depois do push, verifique:

```bash
# Ver o último commit
git log --oneline -1

# Ver status
git status

# Ver remote configurado
git remote -v
```

Deve mostrar:
```
origin  https://github.com/seu-usuario/axur-internship-challenge.git (fetch)
origin  https://github.com/seu-usuario/axur-internship-challenge.git (push)
```

---

## 🎯 PRÓXIMOS COMMITS (OPCIONAL)

Se você modificar algo depois:

```bash
# Adicionar mudanças
git add .

# Commit
git commit -m "docs: Atualiza documentação"

# Push
git push
```

---

## 📊 ESTRUTURA DO REPOSITÓRIO NO GITHUB

Após o push, seu repositório terá:

```
axur-internship-challenge/
├── .gitignore
├── README.md
├── RESUMO_SOLUCAO.md
├── src/
│   └── HtmlAnalyzer.java
├── test_basic.html
├── test_deep.html
├── test_empty_lines.html
├── test_malformed.html
├── test_tie.html
└── test_unclosed.html
```

---

## 🔗 COMPARTILHAR

Depois de subir, você pode compartilhar o link:

```
https://github.com/seu-usuario/axur-internship-challenge
```

Use esse link:
- No seu currículo
- No LinkedIn
- Na entrevista da Axur

---

## ⚠️ IMPORTANTE

### Se o repositório for PÚBLICO:
✅ Pode mostrar seu trabalho
✅ Fica no seu portfólio
❌ Outros candidatos podem ver

### Se o repositório for PRIVADO:
✅ Mantém confidencial
✅ Você pode dar acesso específico à Axur
❌ Não aparece no seu perfil público

**Recomendação:** Comece PRIVADO durante o processo seletivo, depois torne PÚBLICO.

---

## 🎓 ADICIONAR AO PORTFÓLIO

Adicione no README do seu perfil do GitHub:

```markdown
## 🚀 Projetos em Destaque

### [HTML Analyzer](https://github.com/seu-usuario/axur-internship-challenge)
Analisador de estrutura HTML que encontra texto no nível mais profundo.
- Stack-based depth tracking
- HTML validation (malformed detection)
- Pure Java implementation
- O(n) time complexity
```

---

## 📞 RESUMO RÁPIDO

1. ✅ Git já inicializado
2. ✅ Commit já feito
3. 🔄 Criar repo no GitHub: https://github.com/new
4. 🔄 Adicionar remote: `git remote add origin https://github.com/seu-usuario/axur-internship-challenge.git`
5. 🔄 Push: `git push -u origin main`

**Está quase lá!** 🎉

---

**Autor:** Rafael Sanoli  
**Data:** 2026-02-04
