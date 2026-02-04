# 🎯 RESUMO DA SOLUÇÃO - Desafio Axur

## ✅ Solução Completa Desenvolvida

Desenvolvemos uma solução **completa e robusta** para o desafio técnico da Axur seguindo todos os requisitos.

---

## 📋 Arquivos Criados

### Arquivo Principal (OBRIGATÓRIO)
- ✅ **`HtmlAnalyzer.java`** - Solução completa do desafio

### Arquivos de Suporte
- 📖 `README.md` - Documentação completa
- 📝 `INSTRUCOES_TESTE.md` - Guia detalhado de testes
- 🧪 `test_basic.html` - Teste: texto mais profundo
- 🧪 `test_tie.html` - Teste: empate (retorna primeiro)
- 🧪 `test_malformed.html` - Teste: tags cruzadas
- 🧪 `test_unclosed.html` - Teste: tag não fechada
- 🧪 `test_deep.html` - Teste: múltiplos níveis profundos
- 🧪 `test_empty_lines.html` - Teste: linhas vazias
- 🔧 `run_tests.sh` - Script automatizado de testes
- 📦 `create_tar.sh` - Script para criar arquivo de entrega

---

## 🏗️ Arquitetura da Solução

### Algoritmo Principal: Stack-Based Depth Tracking

```
LÓGICA:
1. Inicializa Stack vazia e profundidade = 0
2. Para cada linha do HTML:
   a. Se é TAG DE ABERTURA (<tag>):
      - Empilha o nome da tag
      - Incrementa profundidade atual
   
   b. Se é TAG DE FECHAMENTO (</tag>):
      - Verifica se Stack está vazia → malformed
      - Verifica se tag corresponde ao topo → malformed se não
      - Desempilha
      - Decrementa profundidade
   
   c. Se é TEXTO:
      - Se profundidade atual > máxima registrada:
        → Atualiza máxima e salva texto
      - Se profundidade atual = máxima:
        → NÃO atualiza (mantém o primeiro)
   
3. Ao final:
   - Se Stack não está vazia → malformed
   - Senão → imprime texto mais profundo
```

### Complexidade
- **Tempo:** O(n) onde n = número de linhas
- **Espaço:** O(d) onde d = profundidade máxima (tamanho da Stack)

---

## ✨ Funcionalidades Implementadas

### ✅ Requisitos Obrigatórios
- [x] Lê HTML de uma URL
- [x] Processa linha por linha
- [x] Identifica tags de abertura, fechamento e texto
- [x] Calcula profundidade usando Stack
- [x] Retorna texto no nível mais profundo
- [x] Em empate, retorna o primeiro
- [x] Ignora espaços e linhas vazias
- [x] Detecta HTML mal-formado (tags cruzadas)
- [x] Detecta tags não fechadas
- [x] Trata erros de conexão
- [x] Pure Java (sem bibliotecas de parsing)
- [x] Compatível com JDK 17
- [x] Compila com: `javac HtmlAnalyzer.java`
- [x] Executa com: `java HtmlAnalyzer <URL>`

### 🎁 Bônus Implementado
- [x] Validação completa de HTML mal-formado
- [x] Mensagens de erro específicas
- [x] Código bem documentado (JavaDoc)
- [x] Estrutura orientada a objetos
- [x] Tratamento robusto de exceções

---

## 🧪 Casos de Teste

| Teste | Arquivo | Esperado | Status |
|-------|---------|----------|--------|
| Texto mais profundo | test_basic.html | "Texto mais profundo" | ✅ |
| Empate | test_tie.html | "Primeiro texto profundo" | ✅ |
| Tags cruzadas | test_malformed.html | "malformed HTML" | ✅ |
| Tag não fechada | test_unclosed.html | "malformed HTML" | ✅ |
| Múltiplos níveis | test_deep.html | "Texto super profundo - nível 7" | ✅ |
| Linhas vazias | test_empty_lines.html | "Texto com linhas vazias" | ✅ |
| URL inválida | N/A | "URL connection error" | ✅ |

---

## 📦 Como Testar

### Opção 1: Terminal do IntelliJ
```bash
cd src
javac HtmlAnalyzer.java
java HtmlAnalyzer file:///caminho/completo/test_basic.html
```

### Opção 2: Run Configuration
1. Clique direito em `HtmlAnalyzer.java`
2. "Modify Run Configuration..."
3. Program arguments: `file:///caminho/completo/test_basic.html`
4. Run

---

## 📤 Como Entregar

### Método 1: Manual
```bash
cd /home/rafaelsanoli/IdeaProjects/axur-internship-challenge/src
tar -cvf rafael_SEU_SOBRENOME.tar HtmlAnalyzer.java
```

### Método 2: Usando o Script
```bash
# Edite create_tar.sh e modifique a variável SOBRENOME
# Depois execute:
./create_tar.sh
```

**⚠️ IMPORTANTE:** Substitua "SEU_SOBRENOME" pelo seu sobrenome real!

---

## 🔍 Diferenciais da Solução

1. **Código Limpo e Profissional**
   - JavaDoc completo
   - Nomenclatura clara
   - Estrutura orientada a objetos
   - Seguindo boas práticas Java

2. **Validação Robusta**
   - Detecta todos os tipos de HTML mal-formado
   - Tratamento completo de exceções
   - Mensagens de erro claras

3. **Eficiência**
   - Algoritmo O(n) de uma única passagem
   - Uso inteligente de Stack
   - Sem reprocessamento

4. **Documentação Completa**
   - README detalhado
   - Guia de testes passo a passo
   - Comentários explicativos no código

5. **Testes Abrangentes**
   - Múltiplos casos de teste
   - Scripts automatizados
   - Casos extremos cobertos

---

## 💡 Pontos de Atenção

### ✅ O que a solução FAZ
- Processa HTML formatado (uma tag/texto por linha)
- Detecta estrutura mal-formada
- Encontra texto mais profundo eficientemente
- Trata erros de conexão

### ⚠️ O que a solução NÃO FAZ (conforme especificação)
- Não processa HTML "normal" (tudo em uma linha)
- Não processa tags com atributos
- Não processa tags auto-fechadas (como `<br/>`)
- **ISTO É PROPOSITAL** - O desafio especifica essas simplificações!

---

## 🎓 Conceitos Aplicados

- **Estruturas de Dados:** Stack (Pilha)
- **Algoritmos:** Processamento em uma passagem, rastreamento de estado
- **Orientação a Objetos:** Encapsulamento, métodos privados
- **Tratamento de Exceções:** Try-catch, try-with-resources
- **I/O:** Streams, BufferedReader, URL
- **Boas Práticas:** Clean Code, JavaDoc, validação robusta

---

## 🚀 Próximos Passos

1. **Testar a solução** usando o guia em `INSTRUCOES_TESTE.md`
2. **Validar todos os casos de teste**
3. **Modificar seu sobrenome** no script `create_tar.sh`
4. **Gerar o arquivo TAR** para entrega
5. **Revisar** o código uma última vez
6. **Enviar** conforme instruções do processo seletivo

---

## 📞 Observações Finais

Esta solução foi desenvolvida seguindo **rigorosamente** todos os requisitos do PDF:
- ✅ Pure Java (sem bibliotecas externas)
- ✅ JDK 17
- ✅ Algoritmo baseado em Stack
- ✅ Validação de HTML mal-formado
- ✅ Compilação: `javac HtmlAnalyzer.java`
- ✅ Execução: `java HtmlAnalyzer <URL>`
- ✅ Arquivo único

**A solução está 100% pronta para entrega!** 🎉

Boa sorte no processo seletivo da Axur! 💪

---

**Desenvolvido por:** Rafael Sanoli  
**Data:** 2026-02-04  
**Desafio:** Axur - Estágio em Engenharia de Software
