# HtmlAnalyzer

**English** | [Português](#português)

---

## Overview

HtmlAnalyzer is a Java-based solution designed to parse simplified HTML structures and identify the text content located at the deepest nesting level. This project was developed as part of the technical challenge for the Software Engineering Internship at Axur.

## Problem Statement

Given a URL containing HTML content, the program must:
1. Access and read the HTML structure
2. Identify the deepest nesting level in the document
3. Return the text found at that deepest level
4. Handle malformed HTML by detecting and reporting structural errors
5. Handle connection errors gracefully

### Challenge Constraints

The HTML structure follows specific simplification rules:
- Each line contains **only one** of the following: an opening tag, a closing tag, or text content
- Tags never appear with attributes (e.g., `<a href="...">` will not occur)
- Self-closing tags (like `<br/>`) are not used
- Leading/trailing whitespace and empty lines should be ignored
- In case of a tie (multiple texts at the same depth), return the **first** occurrence

## Solution Approach

### Algorithm Design

The core of the solution uses a **Stack-based depth tracking algorithm**:

1. **Data Structure Choice**: I chose a Stack because its LIFO (Last In, First Out) property perfectly models HTML tag pairing. The most recently opened tag must be the first to close, which aligns naturally with stack operations.

2. **Depth Tracking**: The current depth in the HTML structure is represented by the size of the stack. When an opening tag is encountered, it's pushed onto the stack (depth increases). When a closing tag is found, the top is popped (depth decreases).

3. **Text Discovery**: Every time text content is encountered, I compare the current depth with the maximum depth recorded so far:
   - If `currentDepth > maxDepth`: Update both the maximum depth and store this text
   - If `currentDepth == maxDepth`: Do nothing (this preserves the first occurrence in case of ties)

4. **Validation Logic**: HTML validation happens in real-time during processing:
   - **Empty stack on closing**: If we encounter a closing tag but the stack is empty, the HTML is malformed
   - **Tag mismatch**: If a closing tag doesn't match the tag at the top of the stack, the HTML is malformed
   - **Unclosed tags**: After processing all lines, if the stack is not empty, there are unclosed tags

### Implementation Details

**Key Classes and Methods:**

- `Stack<String> tagStack`: Maintains the hierarchy of currently open tags
- `int currentDepth`: Tracks the current nesting level
- `int maxDepth`: Records the deepest level found
- `String deepestText`: Stores the text at the deepest level
- `boolean isMalformed`: Flags if malformed HTML is detected

**Processing Flow:**

```
analyze(URL) → Read line by line → processLine()
                                      ↓
                    ┌─────────────────┼─────────────────┐
                    ↓                 ↓                 ↓
            processOpeningTag()  processClosingTag()  processText()
                    ↓                 ↓                 ↓
                Push to stack    Validate & Pop    Update if deeper
                Increment depth  Decrement depth
```

### Complexity Analysis

- **Time Complexity**: O(n), where n is the number of lines
  - Single pass through the file
  - Each line processed once
  - All stack operations (push, pop, peek) are O(1)

- **Space Complexity**: O(d), where d is the maximum depth
  - Stack stores only currently open tags
  - Worst case: O(n) if all tags are nested

## Technical Specifications

### Requirements
- Java JDK 17 or higher
- No external libraries (Pure Java implementation)

### Compilation
```bash
javac HtmlAnalyzer.java
```

### Execution
```bash
java HtmlAnalyzer <URL>
```

**Example with remote URL:**
```bash
java HtmlAnalyzer https://example.com
```

**Example with local file:**
```bash
java HtmlAnalyzer file:///absolute/path/to/file.html
```

### Output Scenarios

1. **Success**: Prints the text found at the deepest level
2. **Malformed HTML**: Prints `malformed HTML`
3. **Connection Error**: Prints `URL connection error`

## Testing

The project includes comprehensive test cases located in the `test/` directory:

| Test Case | File | Purpose | Expected Output |
|-----------|------|---------|-----------------|
| Basic depth | test_basic.html | Multiple nesting levels | "Texto mais profundo" |
| Tie scenario | test_tie.html | Same depth, different texts | First occurrence |
| Crossed tags | test_malformed.html | `<p><div></p></div>` | "malformed HTML" |
| Unclosed tag | test_unclosed.html | Missing closing tag | "malformed HTML" |
| Deep nesting | test_deep.html | 7 levels deep | Deepest text |
| Empty lines | test_empty_lines.html | Whitespace handling | Correct text |

### Running Tests

```bash
cd src
javac HtmlAnalyzer.java

# Run each test
java HtmlAnalyzer file:///path/to/test/test_basic.html
java HtmlAnalyzer file:///path/to/test/test_tie.html
java HtmlAnalyzer file:///path/to/test/test_malformed.html
# ... and so on
```

## Project Structure

```
axur-internship-challenge/
├── src/
│   └── HtmlAnalyzer.java      # Main source code
├── test/
│   ├── test_basic.html         # Test: deepest text
│   ├── test_tie.html           # Test: tie scenario
│   ├── test_malformed.html     # Test: crossed tags
│   ├── test_unclosed.html      # Test: unclosed tag
│   ├── test_deep.html          # Test: deep nesting
│   └── test_empty_lines.html   # Test: whitespace handling
├── docs/
│   ├── RESUMO_SOLUCAO.md      # Solution summary (PT-BR)
│   └── EXEMPLO_VISUAL.md      # Visual algorithm walkthrough
└── README.md                   # This file
```

## Design Decisions

### Why Stack?

I chose Stack as the core data structure for several reasons:

1. **Natural fit**: HTML tags follow a LIFO pattern - the last opened tag must close first
2. **Efficiency**: O(1) operations for push, pop, and peek
3. **Simplicity**: Clean, intuitive code that's easy to understand and maintain
4. **Built-in validation**: Stack naturally validates tag pairing

### Why Not Use XML/HTML Parsers?

The challenge explicitly prohibits external parsing libraries to evaluate:
- Understanding of data structures (Stack)
- Algorithm design skills
- Problem-solving without library dependencies

In production code, I would absolutely use established libraries like Jsoup for real-world HTML parsing.

### Key Implementation Choices

1. **Try-with-resources**: Ensures `BufferedReader` is properly closed
2. **Strict comparison (`>` not `>=`)**: Guarantees first occurrence in tie scenarios
3. **Early termination**: Stops processing once malformed HTML is detected
4. **Trim and empty check**: Robust handling of whitespace variations

## Challenges and Solutions

### Challenge 1: Tie-breaking Rule
**Problem**: How to ensure the first text is returned when multiple texts exist at the same depth?

**Solution**: Use strict greater-than (`>`) comparison instead of greater-or-equal (`>=`). This way, the deepest text is only updated when a strictly deeper level is found.

### Challenge 2: Comprehensive Malformed Detection
**Problem**: Multiple ways HTML can be malformed (crossed tags, unclosed tags, extra closing tags).

**Solution**: Three-point validation:
- Check stack emptiness before popping
- Validate tag correspondence after popping
- Verify stack is empty after processing all lines

### Challenge 3: Real-time Processing
**Problem**: Need to process large files efficiently without loading everything into memory.

**Solution**: Line-by-line streaming with BufferedReader, maintaining only essential state (stack, depth counters, single text string).

## Author

**Rafael Sanoli**
- Developed for: Axur Software Engineering Internship Challenge
- Date: February 2026

## License

This project is part of a technical assessment and is intended for educational purposes.

---

# Português

**[English](#overview)** | Português

---

## Visão Geral

HtmlAnalyzer é uma solução em Java projetada para analisar estruturas HTML simplificadas e identificar o conteúdo de texto localizado no nível mais profundo de aninhamento. Este projeto foi desenvolvido como parte do desafio técnico para o Estágio em Engenharia de Software na Axur.

## Descrição do Problema

Dada uma URL contendo conteúdo HTML, o programa deve:
1. Acessar e ler a estrutura HTML
2. Identificar o nível mais profundo de aninhamento no documento
3. Retornar o texto encontrado naquele nível mais profundo
4. Tratar HTML mal-formado detectando e reportando erros estruturais
5. Tratar erros de conexão adequadamente

### Restrições do Desafio

A estrutura HTML segue regras específicas de simplificação:
- Cada linha contém **apenas um** dos seguintes: tag de abertura, tag de fechamento ou conteúdo de texto
- Tags nunca aparecem com atributos (ex: `<a href="...">` não ocorrerá)
- Tags auto-fechadas (como `<br/>`) não são utilizadas
- Espaços iniciais/finais e linhas vazias devem ser ignorados
- Em caso de empate (múltiplos textos na mesma profundidade), retornar a **primeira** ocorrência

## Abordagem da Solução

### Design do Algoritmo

O núcleo da solução usa um **algoritmo de rastreamento de profundidade baseado em Pilha**:

1. **Escolha da Estrutura de Dados**: Escolhi uma Pilha (Stack) porque sua propriedade LIFO (Last In, First Out) modela perfeitamente o pareamento de tags HTML. A tag aberta mais recentemente deve ser a primeira a fechar, o que se alinha naturalmente com as operações de pilha.

2. **Rastreamento de Profundidade**: A profundidade atual na estrutura HTML é representada pelo tamanho da pilha. Quando uma tag de abertura é encontrada, ela é empilhada (profundidade aumenta). Quando uma tag de fechamento é encontrada, o topo é desempilhado (profundidade diminui).

3. **Descoberta de Texto**: Toda vez que conteúdo de texto é encontrado, comparo a profundidade atual com a profundidade máxima registrada até agora:
   - Se `profundidadeAtual > profundidadeMaxima`: Atualizo ambas a profundidade máxima e armazeno este texto
   - Se `profundidadeAtual == profundidadeMaxima`: Não faço nada (isso preserva a primeira ocorrência em caso de empate)

4. **Lógica de Validação**: A validação do HTML acontece em tempo real durante o processamento:
   - **Pilha vazia no fechamento**: Se encontramos uma tag de fechamento mas a pilha está vazia, o HTML está mal-formado
   - **Tags não correspondem**: Se uma tag de fechamento não corresponde à tag no topo da pilha, o HTML está mal-formado
   - **Tags não fechadas**: Após processar todas as linhas, se a pilha não está vazia, há tags não fechadas

### Detalhes de Implementação

**Classes e Métodos Principais:**

- `Stack<String> tagStack`: Mantém a hierarquia de tags atualmente abertas
- `int currentDepth`: Rastreia o nível de aninhamento atual
- `int maxDepth`: Registra o nível mais profundo encontrado
- `String deepestText`: Armazena o texto no nível mais profundo
- `boolean isMalformed`: Sinaliza se HTML mal-formado foi detectado

**Fluxo de Processamento:**

```
analyze(URL) → Lê linha por linha → processLine()
                                      ↓
                    ┌─────────────────┼─────────────────┐
                    ↓                 ↓                 ↓
            processOpeningTag()  processClosingTag()  processText()
                    ↓                 ↓                 ↓
                Empilha          Valida & Desempilha  Atualiza se mais profundo
                Incrementa prof. Decrementa prof.
```

### Análise de Complexidade

- **Complexidade de Tempo**: O(n), onde n é o número de linhas
  - Passagem única pelo arquivo
  - Cada linha processada uma vez
  - Todas as operações de pilha (push, pop, peek) são O(1)

- **Complexidade de Espaço**: O(d), onde d é a profundidade máxima
  - Pilha armazena apenas tags atualmente abertas
  - Pior caso: O(n) se todas as tags estiverem aninhadas

## Especificações Técnicas

### Requisitos
- Java JDK 17 ou superior
- Sem bibliotecas externas (implementação Pure Java)

### Compilação
```bash
javac HtmlAnalyzer.java
```

### Execução
```bash
java HtmlAnalyzer <URL>
```

**Exemplo com URL remota:**
```bash
java HtmlAnalyzer https://example.com
```

**Exemplo com arquivo local:**
```bash
java HtmlAnalyzer file:///caminho/absoluto/para/arquivo.html
```

### Cenários de Saída

1. **Sucesso**: Imprime o texto encontrado no nível mais profundo
2. **HTML Mal-formado**: Imprime `malformed HTML`
3. **Erro de Conexão**: Imprime `URL connection error`

## Testes

O projeto inclui casos de teste abrangentes localizados no diretório `test/`:

| Caso de Teste | Arquivo | Propósito | Saída Esperada |
|---------------|---------|-----------|----------------|
| Profundidade básica | test_basic.html | Múltiplos níveis | "Texto mais profundo" |
| Cenário de empate | test_tie.html | Mesma profundidade, textos diferentes | Primeira ocorrência |
| Tags cruzadas | test_malformed.html | `<p><div></p></div>` | "malformed HTML" |
| Tag não fechada | test_unclosed.html | Falta tag de fechamento | "malformed HTML" |
| Aninhamento profundo | test_deep.html | 7 níveis de profundidade | Texto mais profundo |
| Linhas vazias | test_empty_lines.html | Tratamento de espaços | Texto correto |

### Executando os Testes

```bash
cd src
javac HtmlAnalyzer.java

# Execute cada teste
java HtmlAnalyzer file:///caminho/para/test/test_basic.html
java HtmlAnalyzer file:///caminho/para/test/test_tie.html
java HtmlAnalyzer file:///caminho/para/test/test_malformed.html
# ... e assim por diante
```

## Estrutura do Projeto

```
axur-internship-challenge/
├── src/
│   └── HtmlAnalyzer.java      # Código-fonte principal
├── test/
│   ├── test_basic.html         # Teste: texto mais profundo
│   ├── test_tie.html           # Teste: cenário de empate
│   ├── test_malformed.html     # Teste: tags cruzadas
│   ├── test_unclosed.html      # Teste: tag não fechada
│   ├── test_deep.html          # Teste: aninhamento profundo
│   └── test_empty_lines.html   # Teste: tratamento de espaços
├── docs/
│   ├── RESUMO_SOLUCAO.md      # Resumo da solução
│   └── EXEMPLO_VISUAL.md      # Passo a passo visual do algoritmo
└── README.md                   # Este arquivo
```

## Decisões de Design

### Por Que Pilha?

Escolhi Pilha como estrutura de dados principal por várias razões:

1. **Encaixe natural**: Tags HTML seguem um padrão LIFO - a última tag aberta deve fechar primeiro
2. **Eficiência**: Operações O(1) para push, pop e peek
3. **Simplicidade**: Código limpo e intuitivo, fácil de entender e manter
4. **Validação integrada**: Pilha naturalmente valida o pareamento de tags

### Por Que Não Usar Parsers XML/HTML?

O desafio explicitamente proíbe bibliotecas externas de parsing para avaliar:
- Compreensão de estruturas de dados (Pilha)
- Habilidades de design de algoritmos
- Resolução de problemas sem dependências de bibliotecas

Em código de produção, eu absolutamente usaria bibliotecas estabelecidas como Jsoup para parsing de HTML real.

### Escolhas de Implementação Principais

1. **Try-with-resources**: Garante que `BufferedReader` seja fechado adequadamente
2. **Comparação estrita (`>` não `>=`)**: Garante primeira ocorrência em cenários de empate
3. **Terminação antecipada**: Para o processamento assim que HTML mal-formado é detectado
4. **Trim e verificação de vazio**: Tratamento robusto de variações de espaço em branco

## Desafios e Soluções

### Desafio 1: Regra de Desempate
**Problema**: Como garantir que o primeiro texto seja retornado quando múltiplos textos existem na mesma profundidade?

**Solução**: Usar comparação estritamente maior-que (`>`) ao invés de maior-ou-igual (`>=`). Assim, o texto mais profundo só é atualizado quando um nível estritamente mais profundo é encontrado.

### Desafio 2: Detecção Abrangente de Mal-formado
**Problema**: Múltiplas formas do HTML estar mal-formado (tags cruzadas, tags não fechadas, tags de fechamento extras).

**Solução**: Validação em três pontos:
- Verificar vazio da pilha antes de desempilhar
- Validar correspondência de tag após desempilhar
- Verificar se pilha está vazia após processar todas as linhas

### Desafio 3: Processamento em Tempo Real
**Problema**: Necessidade de processar arquivos grandes eficientemente sem carregar tudo na memória.

**Solução**: Streaming linha por linha com BufferedReader, mantendo apenas estado essencial (pilha, contadores de profundidade, uma única string de texto).

## Autor

**Rafael Sanoli**
- Desenvolvido para: Desafio Técnico de Estágio em Engenharia de Software na Axur
- Data: Fevereiro de 2026

## Licença

Este projeto faz parte de uma avaliação técnica e é destinado para fins educacionais.
