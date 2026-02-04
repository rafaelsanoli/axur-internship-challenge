# HtmlAnalyzer - Desafio Técnico Axur

## Autor
Rafael Sanoli

## Descrição
Programa em Java que analisa a estrutura HTML de uma URL e retorna o texto contido no nível mais profundo da estrutura.

## Requisitos
- Java JDK 17

## Compilação
```bash
javac HtmlAnalyzer.java
```

## Execução
```bash
java HtmlAnalyzer <URL>
```

### Exemplo com URL remota:
```bash
java HtmlAnalyzer https://example.com
```

### Exemplo com arquivo local:
```bash
java HtmlAnalyzer file:///caminho/absoluto/para/arquivo.html
```

## Outputs Possíveis
1. **Texto mais profundo**: Imprime o texto encontrado no nível mais profundo da estrutura HTML
2. **malformed HTML**: Quando detecta HTML mal-formado (tags cruzadas ou não fechadas)
3. **URL connection error**: Quando há falha na conexão ou leitura da URL

## Regras Implementadas
- HTML dividido em linhas (uma tag ou texto por linha)
- Tags sem atributos
- Ignora espaços em branco e linhas vazias
- Em caso de empate (múltiplos textos na mesma profundidade máxima), retorna o primeiro
- Detecta HTML mal-formado (tags não fechadas ou cruzadas)

## Algoritmo
Utiliza uma **Stack (Pilha)** para rastrear as tags abertas e calcular a profundidade:
- Tag de abertura: empilha e incrementa profundidade
- Tag de fechamento: verifica correspondência, desempilha e decrementa
- Texto: se profundidade atual > máxima, atualiza o texto mais profundo
- Ao final: verifica se pilha está vazia (senão, HTML mal-formado)

## Estrutura do Código
- `Stack<String> tagStack`: Pilha para controlar tags abertas
- `currentDepth`: Profundidade atual na estrutura
- `maxDepth`: Maior profundidade encontrada
- `deepestText`: Texto armazenado na maior profundidade
- `isMalformed`: Flag para indicar HTML mal-formado

## Testes
O projeto inclui arquivos HTML de teste:
1. `test_basic.html`: Teste básico com múltiplos níveis
2. `test_tie.html`: Teste de empate (retorna o primeiro)
3. `test_malformed.html`: Tags cruzadas (deve retornar "malformed HTML")
4. `test_unclosed.html`: Tag não fechada (deve retornar "malformed HTML")

### Executar testes locais:
```bash
# Teste 1: Texto mais profundo
java HtmlAnalyzer file:///home/rafaelsanoli/IdeaProjects/axur-internship-challenge/test_basic.html

# Teste 2: Empate (primeiro texto)
java HtmlAnalyzer file:///home/rafaelsanoli/IdeaProjects/axur-internship-challenge/test_tie.html

# Teste 3: HTML mal-formado (tags cruzadas)
java HtmlAnalyzer file:///home/rafaelsanoli/IdeaProjects/axur-internship-challenge/test_malformed.html

# Teste 4: Tag não fechada
java HtmlAnalyzer file:///home/rafaelsanoli/IdeaProjects/axur-internship-challenge/test_unclosed.html
```

## Empacotamento para Entrega
```bash
tar -cvf rafael_sanoli.tar HtmlAnalyzer.java README.md
```

## Notas de Implementação
- **Pure Java**: Sem uso de bibliotecas externas de parsing (javax.xml, etc)
- **JDK 17**: Compatível com Java 17
- **Tratamento de Exceções**: Captura IOException e outras exceções de conexão
- **Validação Robusta**: Verifica estrutura HTML em tempo real
