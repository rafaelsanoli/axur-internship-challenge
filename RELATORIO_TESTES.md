# 📊 RELATÓRIO DE TESTES - HtmlAnalyzer

**Data:** 06 de fevereiro de 2026  
**Autor:** Rafael Sanoli  
**JDK:** 17 (ms-17.0.18)

---

## ✅ RESUMO EXECUTIVO

**Total de Testes:** 7  
**Sucessos:** 7 (100%)  
**Falhas:** 0  

Todos os testes passaram conforme esperado! O programa implementa corretamente:
- ✓ Identificação do texto no nível mais profundo
- ✓ Regra de desempate (primeiro texto encontrado)
- ✓ Detecção de HTML mal-formado (tags cruzadas)
- ✓ Detecção de tags não fechadas
- ✓ Tratamento de erros de conexão
- ✓ Ignorar linhas vazias e DOCTYPE
- ✓ Tratamento de profundidades variadas

---

## 📝 DETALHAMENTO DOS TESTES

### ✅ TESTE 1: Texto mais Profundo
**Arquivo:** `test_basic.html`  
**Objetivo:** Verificar se o programa identifica corretamente o texto no nível mais profundo da estrutura HTML.

**Estrutura:**
```
html (nível 1)
  └─ head (nível 2)
       └─ title (nível 3)
            └─ "Teste Básico"
  └─ body (nível 2)
       ├─ div (nível 3)
       │    └─ div (nível 4)
       │         └─ p (nível 5)
       │              └─ span (nível 6) ← MAIS PROFUNDO
       │                   └─ "Texto mais profundo"
       └─ div (nível 3)
            └─ "Texto raso"
```

**Esperado:** `Texto mais profundo`  
**Resultado:** ✅ `Texto mais profundo`

---

### ✅ TESTE 2: Empate (Retorna Primeiro)
**Arquivo:** `test_tie.html`  
**Objetivo:** Verificar a regra de desempate - quando há dois textos no mesmo nível máximo de profundidade, deve retornar o primeiro que aparece.

**Estrutura:**
```
html (nível 1)
  └─ body (nível 2)
       ├─ div (nível 3)
       │    └─ p (nível 4) ← PRIMEIRO
       │         └─ "Primeiro texto profundo"
       └─ div (nível 3)
            └─ p (nível 4) ← SEGUNDO (mesmo nível)
                 └─ "Segundo texto profundo"
```

**Esperado:** `Primeiro texto profundo`  
**Resultado:** ✅ `Primeiro texto profundo`

---

### ✅ TESTE 3: HTML Mal-formado (Tags Cruzadas)
**Arquivo:** `test_malformed.html`  
**Objetivo:** Detectar HTML mal-formado quando as tags são fechadas em ordem incorreta (tags cruzadas).

**Estrutura:**
```
<html>
<body>
<div>
<p>
Texto no nível 3
</div>  ← ERRO: deveria fechar </p> antes!
</p>    ← ERRO: tags cruzadas
</body>
</html>
```

**Esperado:** `malformed HTML`  
**Resultado:** ✅ `malformed HTML`

---

### ✅ TESTE 4: Tag Não Fechada
**Arquivo:** `test_unclosed.html`  
**Objetivo:** Detectar HTML mal-formado quando uma tag de abertura nunca é fechada.

**Estrutura:**
```
<html>
<body>
<div>  ← Tag nunca fechada!
</body>
</html>
```

**Esperado:** `malformed HTML`  
**Resultado:** ✅ `malformed HTML`

---

### ✅ TESTE 5: Profundidade Extra
**Arquivo:** `test_deep.html`  
**Objetivo:** Testar o programa com uma estrutura HTML mais profunda (7 níveis).

**Resultado:** ✅ `Texto super profundo - nvel 7`

---

### ✅ TESTE 6: Linhas Vazias
**Arquivo:** `test_empty_lines.html`  
**Objetivo:** Verificar se o programa ignora corretamente linhas vazias e espaços em branco.

**Resultado:** ✅ `Texto com linhas vazias`

---

### ✅ TESTE 7: URL Inválida
**Objetivo:** Verificar o tratamento de exceções quando a URL não existe ou não pode ser acessada.

**Comando:**
```bash
java HtmlAnalyzer https://url-invalida-que-nao-existe-123456789.com
```

**Esperado:** `URL connection error`  
**Resultado:** ✅ `URL connection error`

---

## 🔧 COMANDOS DE COMPILAÇÃO E EXECUÇÃO

### Compilação
```bash
cd /home/rafaelsanoli/IdeaProjects/axur-internship-challenge/src
javac HtmlAnalyzer.java
```

### Execução (Exemplo)
```bash
java HtmlAnalyzer file:///caminho/completo/test_basic.html
```

---

## 📦 CARACTERÍSTICAS IMPLEMENTADAS

### Algoritmo Baseado em Pilha (Stack)
- **Abertura de Tag:** Empilha o nome da tag e incrementa a profundidade
- **Fechamento de Tag:** 
  - Verifica se a pilha está vazia (erro)
  - Verifica se a tag corresponde ao topo da pilha (erro se não corresponder)
  - Desempilha e decrementa a profundidade
- **Texto:** 
  - Compara profundidade atual com profundidade máxima
  - Se maior: atualiza profundidade máxima e armazena o texto
  - Se igual: mantém o primeiro texto encontrado (regra de desempate)

### Validações Implementadas
1. ✓ Tags não fechadas (pilha não vazia ao final)
2. ✓ Tags cruzadas (fechamento não corresponde à abertura)
3. ✓ Pilha vazia ao tentar fechar tag
4. ✓ Tratamento de exceções de IO/conexão
5. ✓ Ignorar linhas vazias e espaços em branco
6. ✓ Ignorar declarações DOCTYPE e comentários HTML

### Premissas Atendidas
- ✓ Uma linha contém APENAS uma tag de abertura, fechamento ou texto
- ✓ Tags de abertura sem atributos
- ✓ Apenas pares de abertura e fechamento (sem self-closing tags)
- ✓ Espaços em branco e linhas vazias são ignorados

---

## 🎯 CONFORMIDADE COM OS REQUISITOS

### Requisitos Funcionais
- [x] Acessar HTML de uma URL
- [x] Identificar texto no nível mais profundo
- [x] Retornar primeiro texto em caso de empate
- [x] Detectar HTML mal-formado
- [x] Mensagens de erro apropriadas

### Requisitos Técnicos
- [x] Java JDK 17
- [x] Pure Java (sem bibliotecas de parsing)
- [x] Compilação: `javac HtmlAnalyzer.java`
- [x] Execução: `java HtmlAnalyzer <URL>`
- [x] Arquivo único: `HtmlAnalyzer.java`

### Outputs Implementados
- [x] Texto encontrado no nível mais profundo
- [x] `malformed HTML` (estrutura inválida)
- [x] `URL connection error` (falha de conexão)

---

## 💡 MELHORIAS IMPLEMENTADAS

1. **Comentários Bilíngues:** Código documentado em português e inglês
2. **JavaDoc Completo:** Documentação profissional de todas as classes e métodos
3. **Tratamento de DOCTYPE:** Ignora declarações `<!DOCTYPE>` e comentários `<!--`
4. **Script de Testes:** Script automatizado para executar todos os testes
5. **Arquivos de Teste Completos:** 6 cenários de teste diferentes

---

## 📁 ESTRUTURA DE ARQUIVOS

```
axur-internship-challenge/
├── src/
│   ├── HtmlAnalyzer.java       ← Código principal
│   └── HtmlAnalyzer.class      ← Arquivo compilado
├── test/
│   ├── test_basic.html         ← Teste de profundidade
│   ├── test_tie.html           ← Teste de empate
│   ├── test_malformed.html     ← Teste de tags cruzadas
│   ├── test_unclosed.html      ← Teste de tag não fechada
│   ├── test_deep.html          ← Teste de profundidade extra
│   └── test_empty_lines.html   ← Teste de linhas vazias
├── run_all_tests.sh            ← Script de testes automatizado
├── test_results.txt            ← Resultados dos testes
├── INSTRUCOES_TESTE.md         ← Instruções de teste
└── RELATORIO_TESTES.md         ← Este relatório

```

---

## 🚀 CONCLUSÃO

O programa **HtmlAnalyzer** foi implementado com sucesso e passou em todos os testes. A solução:

- ✅ Atende 100% dos requisitos funcionais
- ✅ Segue todas as restrições técnicas
- ✅ Implementa corretamente o algoritmo de pilha
- ✅ Detecta todos os tipos de HTML mal-formado
- ✅ Trata adequadamente exceções de IO
- ✅ Código bem documentado e profissional

**Status:** ✅ **PRONTO PARA ENTREGA**

---

## 📧 CONTATO

**Rafael Sanoli**  
Candidato à vaga de Estágio em Engenharia de Software - Axur

---

*Relatório gerado automaticamente após execução dos testes*
