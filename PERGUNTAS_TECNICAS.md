# 🎤 PERGUNTAS TÉCNICAS - Preparação para Entrevista

## Possíveis Perguntas sobre a Solução HtmlAnalyzer

---

## 📚 Estruturas de Dados

### P1: Por que você escolheu usar uma Stack?

**R:** Escolhi Stack porque:
1. **LIFO (Last In, First Out)** é perfeito para validar pareamento de tags HTML - a tag mais recente aberta deve ser a primeira a fechar
2. Operações Push, Pop e Peek são **O(1)**, garantindo eficiência
3. A Stack naturalmente mantém a hierarquia de aninhamento de tags
4. Simplifica a validação: Stack vazia ao final = HTML válido

**Alternativas consideradas:**
- Lista/ArrayList: Mais complexo, precisaria acessar último elemento manualmente
- Recursão: Menos eficiente em memória, risco de StackOverflow em HTML muito profundo

---

### P2: Qual a complexidade de tempo e espaço da sua solução?

**R:**
- **Tempo: O(n)** onde n = número de linhas
  - Uma única passagem pelo arquivo
  - Cada linha processada uma vez
  - Operações de Stack são O(1)

- **Espaço: O(d)** onde d = profundidade máxima
  - Stack armazena apenas tags abertas no caminho atual
  - No pior caso (todas as tags aninhadas): O(n)
  - Memória adicional: algumas variáveis (O(1))

---

## 🐛 Tratamento de Erros

### P3: Como você detecta HTML mal-formado?

**R:** Implementei 3 verificações:

1. **Tag de fechamento sem abertura:**
   ```java
   if (tagStack.isEmpty()) {
       isMalformed = true;
   }
   ```

2. **Tags cruzadas:**
   ```java
   String topTag = tagStack.pop();
   if (!topTag.equals(tagName)) {
       isMalformed = true;
   }
   ```

3. **Tags não fechadas (ao final):**
   ```java
   if (!tagStack.isEmpty()) {
       isMalformed = true;
   }
   ```

---

### P4: Como você trata erros de conexão?

**R:**
```java
try {
    URL url = new URL(urlString);
    try (BufferedReader reader = ...) {
        // processamento
    }
} catch (Exception e) {
    System.out.println("URL connection error");
    return;
}
```

Uso try-with-resources para garantir fechamento automático do BufferedReader e capturo todas as exceções (MalformedURLException, IOException, etc.) em um único catch.

---

## 🔍 Lógica de Negócio

### P5: Como você garante que retorna o PRIMEIRO texto em caso de empate?

**R:** Uso apenas comparação **maior que (>)**, nunca maior ou igual (>=):

```java
if (currentDepth > maxDepth) {  // NÃO >=
    maxDepth = currentDepth;
    deepestText = line;
}
```

Assim, só atualizo quando encontro uma profundidade **estritamente maior**, mantendo o primeiro texto encontrado no nível máximo.

---

### P6: Por que você ignora linhas vazias e espaços?

**R:** O desafio especifica que "espaços em branco iniciais (indentação) e linhas em branco devem ser ignorados". Implementei:

```java
line = line.trim();  // Remove espaços iniciais/finais
if (line.isEmpty()) {
    return;  // Ignora linha vazia
}
```

Isso torna a solução robusta a diferentes formatações de HTML.

---

## 💻 Decisões de Design

### P7: Por que encapsular a lógica em métodos privados?

**R:** Segui princípios de **Clean Code**:
1. **Single Responsibility:** Cada método tem uma responsabilidade única
   - `processLine()` - determina tipo da linha
   - `processOpeningTag()` - lida apenas com tags de abertura
   - `processClosingTag()` - lida apenas com tags de fechamento
   - `processText()` - lida apenas com texto

2. **Legibilidade:** Código auto-documentado
3. **Manutenibilidade:** Fácil adicionar validações ou modificar comportamento
4. **Testabilidade:** Cada método pode ser testado isoladamente (se fosse necessário unit tests)

---

### P8: Por que você usou BufferedReader em vez de Scanner?

**R:**
- **BufferedReader** é mais eficiente para leitura linha a linha de grandes arquivos
- Menor overhead de memória
- Método `readLine()` retorna null no fim do arquivo (mais simples que `hasNextLine()`)
- Mais adequado para I/O de rede

---

## 🛠️ Implementação

### P9: Como você extrai o nome da tag?

**R:**
```java
// Tag de abertura: <div>
String tagName = line.substring(1, line.length() - 1);
// Remove '<' e '>', resulta em "div"

// Tag de fechamento: </div>
String tagName = line.substring(2, line.length() - 1);
// Remove '</' e '>', resulta em "div"
```

Uso `substring()` porque sei exatamente o formato (sem atributos, sem espaços extras).

---

### P10: Por que você não usou Regex?

**R:** 
1. **Simplicidade:** O formato é garantido pelo desafio, substring é suficiente
2. **Performance:** substring é mais rápido que regex
3. **Clareza:** Código mais direto e fácil de entender
4. **Requisitos:** O desafio pede "Pure Java", regex seria overkill para o problema

---

## 🧪 Testes

### P11: Como você validaria a corretude da sua solução?

**R:** Criei 6 casos de teste abrangentes:

| Caso | Objetivo | Arquivo |
|------|----------|---------|
| Básico | Texto mais profundo em estrutura aninhada | test_basic.html |
| Empate | Verifica retorno do primeiro texto | test_tie.html |
| Tags cruzadas | Detecta `<p><div></p></div>` | test_malformed.html |
| Tag não fechada | Detecta `<div>` sem `</div>` | test_unclosed.html |
| Profundidade extrema | 7 níveis aninhados | test_deep.html |
| Linhas vazias | Ignora corretamente | test_empty_lines.html |

**Além disso:**
- Teste manual com URLs reais
- Teste com URL inválida (verifica "URL connection error")

---

## 🔮 Melhorias Futuras

### P12: Como você melhoraria esta solução para produção?

**R:**
1. **Logging:** Adicionar logs com SLF4J/Log4j
2. **Unit Tests:** JUnit 5 com cobertura > 90%
3. **Configuração:** Timeout de conexão configurável
4. **Encoding:** Detecção automática de charset
5. **Performance:** Streaming para arquivos gigantes
6. **Resiliência:** Retry com backoff exponencial para falhas de rede
7. **Observabilidade:** Métricas (tempo de processamento, profundidade média)
8. **Validação de Entrada:** Validar URL antes de tentar conexão

**Exemplo:**
```java
public class HtmlAnalyzerConfig {
    private int connectionTimeout = 5000;
    private int maxDepth = 1000;
    private String charset = "UTF-8";
    // ... getters/setters
}
```

---

### P13: Como você adaptaria isso para HTML "real" (com atributos, auto-closing tags, etc)?

**R:** Para HTML real, eu **não** tentaria fazer parsing manual:

1. **Usar biblioteca especializada:**
   - Jsoup (mais popular em Java)
   - HtmlCleaner
   - JTidy

2. **Por quê?**
   - HTML real é complexo (comentários, CDATA, scripts, etc)
   - Parsing manual seria propenso a bugs
   - "Don't reinvent the wheel"

3. **Se REALMENTE precisasse fazer manual:**
   - Regex para extrair atributos
   - Whitelist de tags auto-closing
   - Parser de estados finitos (FSM)
   - Tratamento de comentários `<!-- -->`
   - Escape de caracteres HTML

**Mas no desafio:**
O PDF especifica "tags sem atributos" e "não usar bibliotecas de parsing", então minha abordagem atual é a ideal para o contexto.

---

## 🎯 Contexto do Desafio

### P14: Por que não usar bibliotecas de parsing se elas existem?

**R:** O desafio especifica:
> "PROIBIDO usar frameworks externos ou bibliotecas nativas de HTML/XML/DOM"

**Objetivo pedagógico:**
1. Demonstrar conhecimento de estruturas de dados (Stack)
2. Mostrar habilidade de resolver problemas algorítmicos
3. Provar capacidade de implementar soluções sem depender de bibliotecas
4. Avaliar compreensão de pilhas e validação de estruturas aninhadas

**Em produção:** Eu SEMPRE usaria Jsoup ou similar para HTML real.

---

### P15: Qual foi o maior desafio ao implementar esta solução?

**R:**
1. **Garantir a regra de empate:** Tive que pensar cuidadosamente na condição (> vs >=)
2. **Cobertura completa de casos mal-formados:** Não basta detectar tags cruzadas, precisa detectar tags não fechadas também
3. **Tratamento robusto de exceções:** Capturar todos os tipos de erros de rede/IO
4. **Testes sem servidor:** Criar arquivos locais para testar, já que não tinha acesso a URLs da Axur

---

## 💡 Conceitos Avançados

### P16: Esta solução é thread-safe?

**R:** **NÃO.** A classe HtmlAnalyzer mantém estado mutável (tagStack, currentDepth, etc.).

**Para tornar thread-safe:**
```java
public class HtmlAnalyzer {
    // Variáveis de instância são imutáveis ou final
    
    public String analyze(String urlString) {
        // Todas as variáveis de processamento são locais
        Stack<String> tagStack = new Stack<>();
        // ... retorna resultado em vez de armazenar
        return deepestText;
    }
}
```

Ou usar instância nova por thread, ou sincronizar métodos.

---

### P17: Como você faria benchmarking desta solução?

**R:**
```java
public class HtmlAnalyzerBenchmark {
    @Test
    public void benchmarkLargeFile() {
        long start = System.nanoTime();
        
        for (int i = 0; i < 1000; i++) {
            analyzer.analyze(testUrl);
        }
        
        long duration = System.nanoTime() - start;
        System.out.println("Avg: " + (duration / 1000 / 1000) + "ms");
    }
}
```

**Métricas importantes:**
- Tempo médio de processamento
- Memória máxima usada (VisualVM)
- Throughput (arquivos/segundo)

---

## 🏆 Soft Skills

### P18: Como você abordaria um requisito ambíguo?

**R:** No desafio, o PDF era claro, mas se houvesse ambiguidade:

1. **Listar suposições:** Documentar o que eu assumi
2. **Implementar a solução mais simples** que atende os requisitos conhecidos
3. **Documentar decisões:** Comentários no código explicando "por quê"
4. **Deixar código flexível:** Fácil de adaptar quando requisitos forem clarificados
5. **Buscar clarificação:** Perguntar ao product owner/tech lead

---

### P19: Como você explicaria este algoritmo para um não-programador?

**R:**

> "Imagine que você está lendo um livro com capítulos, seções e subseções aninhados. Você usa post-its empilhados para lembrar onde está:
> 
> - Abre um capítulo? Cola um post-it "Capítulo 1"
> - Abre uma seção? Cola outro post-it em cima "Seção 1.1"
> - Acha texto? Conta quantos post-its você tem (profundidade)
> - Fecha a seção? Remove o post-it do topo
> 
> No final, você lembra qual texto estava na maior pilha de post-its. Se tentar remover um post-it que não está lá, ou sobrar post-its no final, o livro está mal-organizado!"

---

## 🚀 Conclusão

Esta solução demonstra:
- ✅ Compreensão profunda de estruturas de dados
- ✅ Capacidade de resolver problemas algorítmicos
- ✅ Código limpo e bem estruturado
- ✅ Tratamento robusto de erros
- ✅ Documentação completa
- ✅ Pensamento crítico sobre trade-offs
- ✅ Consciência de boas práticas de engenharia

**Pronto para a entrevista!** 💪
