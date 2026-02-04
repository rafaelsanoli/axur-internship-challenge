# 🎯 RESUMO DA SOLUÇÃO - Desafio Axur

[Leia este documento para entender toda a solução desenvolvida]

---

## Visão Geral

Esta solução foi desenvolvida para o desafio técnico de Estágio em Engenharia de Software na Axur. O programa analisa estruturas HTML simplificadas e identifica o texto localizado no nível mais profundo de aninhamento.

---

## Arquitetura da Solução

### Algoritmo Principal: Stack-Based Depth Tracking

O núcleo da solução utiliza um algoritmo baseado em Pilha (Stack) para rastrear a profundidade:

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
- **Espaço:** O(d) onde d = profundidade máxima

---

## Funcionalidades Implementadas

### Requisitos Obrigatórios
- ✅ Lê HTML de uma URL
- ✅ Processa linha por linha
- ✅ Identifica tags de abertura, fechamento e texto
- ✅ Calcula profundidade usando Stack
- ✅ Retorna texto no nível mais profundo
- ✅ Em empate, retorna o primeiro
- ✅ Ignora espaços e linhas vazias
- ✅ Detecta HTML mal-formado (tags cruzadas e não fechadas)
- ✅ Trata erros de conexão
- ✅ Pure Java (sem bibliotecas de parsing)
- ✅ Compatível com JDK 17

### Bônus Implementado
- ✅ Validação completa de HTML mal-formado
- ✅ Código bem documentado com comentários bilíngues (PT-BR/EN)
- ✅ Estrutura orientada a objetos
- ✅ Tratamento robusto de exceções

---

## Casos de Teste

| Teste | Arquivo | Esperado | Status |
|-------|---------|----------|--------|
| Texto mais profundo | test_basic.html | "Texto mais profundo" | ✅ |
| Empate | test_tie.html | "Primeiro texto profundo" | ✅ |
| Tags cruzadas | test_malformed.html | "malformed HTML" | ✅ |
| Tag não fechada | test_unclosed.html | "malformed HTML" | ✅ |
| Múltiplos níveis | test_deep.html | "Texto super profundo - nível 7" | ✅ |
| Linhas vazias | test_empty_lines.html | "Texto com linhas vazias" | ✅ |

---

## Decisões de Design

### Por Que Stack?

Escolhi Stack como estrutura de dados principal porque:

1. **Encaixe Natural**: Tags HTML seguem um padrão LIFO (Last In, First Out) - a última tag aberta deve ser a primeira a fechar
2. **Eficiência**: Operações push, pop e peek são O(1)
3. **Simplicidade**: Código limpo e intuitivo
4. **Validação Integrada**: A Stack naturalmente valida o pareamento de tags

### Desafios Enfrentados

**1. Regra de Desempate**
- **Problema**: Como garantir que o primeiro texto seja retornado quando há múltiplos textos na mesma profundidade?
- **Solução**: Usar comparação estrita `>` (não `>=`), atualizando apenas quando encontrar profundidade estritamente maior

**2. Detecção Abrangente de HTML Mal-Formado**
- **Problema**: HTML pode estar mal-formado de várias formas (tags cruzadas, não fechadas, extras)
- **Solução**: Validação em três pontos:
  - Verificar se stack está vazia antes de desempilhar
  - Validar correspondência de tags
  - Verificar se stack está vazia ao final do processamento

**3. Processamento Eficiente**
- **Problema**: Processar arquivos grandes sem carregar tudo na memória
- **Solução**: Streaming linha por linha com BufferedReader, mantendo apenas estado essencial

---

## Diferenciais da Solução

1. **Código Profissional**
   - JavaDoc completo
   - Comentários bilíngues (PT-BR e EN)
   - Nomenclatura clara
   - Estrutura orientada a objetos

2. **Validação Robusta**
   - Detecta todos os tipos de HTML mal-formado
   - Tratamento completo de exceções
   - Mensagens de erro específicas

3. **Eficiência**
   - Algoritmo O(n) de única passagem
   - Uso inteligente de Stack
   - Sem reprocessamento desnecessário

4. **Documentação Completa**
   - README bilíngue e profissional
   - Exemplo visual do algoritmo
   - Casos de teste abrangentes

---

## Como Executar

### Compilação
```bash
cd src
javac HtmlAnalyzer.java
```

### Execução
```bash
java HtmlAnalyzer <URL>
```

### Exemplo com arquivo local
```bash
java HtmlAnalyzer file:///caminho/absoluto/test/test_basic.html
```

---

## Estrutura do Projeto

```
axur-internship-challenge/
├── src/
│   └── HtmlAnalyzer.java      # Código-fonte principal
├── test/
│   ├── test_basic.html         # Teste: texto mais profundo
│   ├── test_tie.html           # Teste: empate
│   ├── test_malformed.html     # Teste: tags cruzadas
│   ├── test_unclosed.html      # Teste: tag não fechada
│   ├── test_deep.html          # Teste: aninhamento profundo
│   └── test_empty_lines.html   # Teste: linhas vazias
├── docs/
│   ├── RESUMO_SOLUCAO.md      # Este arquivo
│   └── EXEMPLO_VISUAL.md      # Visualização do algoritmo
└── README.md                   # Documentação principal
```

---

## Conceitos Aplicados

- **Estruturas de Dados**: Stack (Pilha), LIFO
- **Algoritmos**: Processamento em streaming, rastreamento de estado
- **Orientação a Objetos**: Encapsulamento, métodos privados
- **Tratamento de Exceções**: Try-catch, try-with-resources
- **I/O**: BufferedReader, URL, Streams
- **Boas Práticas**: Clean Code, JavaDoc, validação robusta

---

## Autor

**Rafael Sanoli**
- Desafio: Axur - Estágio em Engenharia de Software
- Data: Fevereiro 2026

**Nota**: Esta solução foi desenvolvida seguindo rigorosamente todos os requisitos do desafio, sem uso de bibliotecas externas de parsing, utilizando apenas Java puro (JDK 17).
