# ✅ CHECKLIST FINAL - Antes de Entregar

## 📋 Lista de Verificação Completa

Use este checklist para garantir que tudo está perfeito antes de enviar sua solução!

---

## 1️⃣ CÓDIGO

### Compilação
- [ ] O arquivo se chama exatamente **`HtmlAnalyzer.java`** (case-sensitive)
- [ ] Compila sem erros com: `javac HtmlAnalyzer.java`
- [ ] Não há warnings críticos
- [ ] JDK 17 compatível

### Execução
- [ ] Executa com: `java HtmlAnalyzer <URL>`
- [ ] Aceita URL como argumento de linha de comando
- [ ] Funciona com URLs remotas (http/https)
- [ ] Funciona com arquivos locais (file://)

### Funcionalidades
- [ ] ✅ Encontra texto no nível mais profundo
- [ ] ✅ Em empate, retorna o PRIMEIRO texto
- [ ] ✅ Ignora espaços em branco e linhas vazias
- [ ] ✅ Detecta tags cruzadas → "malformed HTML"
- [ ] ✅ Detecta tags não fechadas → "malformed HTML"
- [ ] ✅ Trata erros de conexão → "URL connection error"
- [ ] ✅ Não usa bibliotecas de parsing (javax.xml, Jsoup, etc)
- [ ] ✅ Usa apenas Java puro (java.net, java.io, java.util)

---

## 2️⃣ TESTES

### Teste 1: Texto Mais Profundo
```bash
cd src
javac HtmlAnalyzer.java
java HtmlAnalyzer file:///caminho/completo/test_basic.html
```
- [ ] Output: `Texto mais profundo` ✅

### Teste 2: Empate (Primeiro)
```bash
java HtmlAnalyzer file:///caminho/completo/test_tie.html
```
- [ ] Output: `Primeiro texto profundo` ✅

### Teste 3: HTML Mal-Formado (Tags Cruzadas)
```bash
java HtmlAnalyzer file:///caminho/completo/test_malformed.html
```
- [ ] Output: `malformed HTML` ✅

### Teste 4: Tag Não Fechada
```bash
java HtmlAnalyzer file:///caminho/completo/test_unclosed.html
```
- [ ] Output: `malformed HTML` ✅

### Teste 5: URL Inválida
```bash
java HtmlAnalyzer https://url-invalida-12345678901234567890.com
```
- [ ] Output: `URL connection error` ✅

### Teste 6: Sem Argumentos
```bash
java HtmlAnalyzer
```
- [ ] Output: Mensagem de uso ou trata graciosamente ✅

---

## 3️⃣ QUALIDADE DO CÓDIGO

### Estilo e Legibilidade
- [ ] Código bem indentado
- [ ] Nomes de variáveis descritivos (camelCase)
- [ ] Nomes de métodos descritivos (camelCase)
- [ ] Nome da classe PascalCase
- [ ] Sem código comentado/morto
- [ ] Sem `System.out.println` de debug esquecido

### Documentação
- [ ] Classe tem JavaDoc
- [ ] Método `main()` tem JavaDoc
- [ ] Métodos públicos têm JavaDoc
- [ ] Comentários explicam "por quê", não "o quê"
- [ ] Sem comentários óbvios (ex: `// incrementa i`)

### Boas Práticas
- [ ] Sem variáveis não utilizadas
- [ ] Sem imports não utilizados
- [ ] Try-with-resources para BufferedReader
- [ ] Variáveis final quando possível
- [ ] Sem "magic numbers" (constantes têm nomes)
- [ ] Métodos pequenos (< 20 linhas idealmente)

---

## 4️⃣ ALGORITMO

### Lógica de Profundidade
- [ ] Usa Stack<String> para rastrear tags
- [ ] Incrementa profundidade ao abrir tag
- [ ] Decrementa profundidade ao fechar tag
- [ ] Profundidade = tamanho da stack

### Validação
- [ ] Verifica se stack está vazia ao fechar tag
- [ ] Verifica se tag corresponde ao topo da stack
- [ ] Verifica se stack está vazia ao final
- [ ] Flag `isMalformed` para e interrompe processamento

### Regra de Empate
- [ ] Usa `>` (não `>=`) na comparação de profundidade
- [ ] Só atualiza `deepestText` se profundidade for MAIOR

---

## 5️⃣ EMPACOTAMENTO

### Arquivo TAR
- [ ] Nome do arquivo: `rafael_SEU_SOBRENOME.tar`
- [ ] **IMPORTANTE:** Substitua "SEU_SOBRENOME" pelo seu sobrenome real!
- [ ] Contém apenas `HtmlAnalyzer.java` (README é opcional)
- [ ] NÃO contém diretórios (arquivo solto)
- [ ] Criado com: `tar -cvf rafael_sobrenome.tar HtmlAnalyzer.java`

### Verificação do TAR
```bash
# Liste o conteúdo
tar -tvf rafael_SEU_SOBRENOME.tar

# Deve mostrar apenas:
# -rw-r--r-- ... HtmlAnalyzer.java
```
- [ ] Apenas o arquivo .java está no tar
- [ ] Sem pastas/diretórios
- [ ] Tamanho razoável (< 10KB)

---

## 6️⃣ DOCUMENTAÇÃO (OPCIONAL, MAS RECOMENDADO)

Se você decidir incluir README no tar:
- [ ] README.md explica como compilar
- [ ] README.md explica como executar
- [ ] README.md lista os outputs possíveis
- [ ] README.md menciona seu nome

---

## 7️⃣ REVISÃO FINAL DO CÓDIGO

### Linha por Linha
```java
// Verifique:

1. Import statements
   - [ ] Apenas java.* (não javax.xml, org.*, etc)
   - [ ] Sem imports não utilizados

2. Class declaration
   - [ ] public class HtmlAnalyzer

3. Variáveis de instância
   - [ ] private final Stack<String> tagStack
   - [ ] private int currentDepth, maxDepth
   - [ ] private String deepestText
   - [ ] private boolean isMalformed

4. Constructor
   - [ ] Inicializa todas as variáveis

5. Método analyze()
   - [ ] try-catch envolve tudo
   - [ ] catch imprime "URL connection error"
   - [ ] Valida stack vazia ao final

6. Método processLine()
   - [ ] trim() para remover espaços
   - [ ] isEmpty() para ignorar linhas vazias
   - [ ] Detecta tag de abertura (<tag>)
   - [ ] Detecta tag de fechamento (</tag>)
   - [ ] Texto é o else

7. Método processOpeningTag()
   - [ ] substring(1, length-1) para extrair nome
   - [ ] Push na stack
   - [ ] Incrementa currentDepth

8. Método processClosingTag()
   - [ ] substring(2, length-1) para extrair nome
   - [ ] Verifica stack vazia → malformed
   - [ ] Verifica correspondência → malformed
   - [ ] Pop da stack
   - [ ] Decrementa currentDepth

9. Método processText()
   - [ ] if (currentDepth > maxDepth) → atualiza
   - [ ] NÃO atualiza se igual (mantém primeiro)

10. Método printResult()
    - [ ] if (isMalformed) → "malformed HTML"
    - [ ] else if (deepestText != null) → imprime texto
    - [ ] Nada se não houver texto

11. Método main()
    - [ ] Verifica args.length
    - [ ] Cria HtmlAnalyzer
    - [ ] Chama analyze()
```

---

## 8️⃣ TESTE DE INTEGRIDADE

### Simule a Avaliação
```bash
# 1. Delete a classe compilada
rm HtmlAnalyzer.class

# 2. Compile do zero
javac HtmlAnalyzer.java

# 3. Execute cada teste
java HtmlAnalyzer file:///caminho/test_basic.html
java HtmlAnalyzer file:///caminho/test_tie.html
java HtmlAnalyzer file:///caminho/test_malformed.html
java HtmlAnalyzer file:///caminho/test_unclosed.html
java HtmlAnalyzer https://url-invalida.com
```
- [ ] Todos os testes passam
- [ ] Outputs corretos
- [ ] Sem erros de compilação
- [ ] Sem exceções não tratadas

---

## 9️⃣ REVISÃO DE REQUISITOS (DO PDF)

### Objetivo
- [ ] ✅ "Dada uma URL, acessar HTML e retornar texto no nível mais profundo"

### Premissas
- [ ] ✅ HTML dividido em linhas
- [ ] ✅ Cada linha: tag abertura, fechamento OU texto
- [ ] ✅ Nunca mistura tipos na mesma linha
- [ ] ✅ Tags sem atributos
- [ ] ✅ Sem tags auto-closing
- [ ] ✅ Ignora espaços e linhas vazias

### Regra de Empate
- [ ] ✅ Retorna o PRIMEIRO texto no nível máximo

### Bônus
- [ ] ✅ Identifica HTML mal-formado
- [ ] ✅ Imprime exatamente "malformed HTML"

### Outputs
- [ ] ✅ Texto encontrado
- [ ] ✅ "malformed HTML"
- [ ] ✅ "URL connection error"

### Restrições Técnicas
- [ ] ✅ Java JDK 17
- [ ] ✅ Sem frameworks/bibliotecas de parsing
- [ ] ✅ Compilação: `javac HtmlAnalyzer.java`
- [ ] ✅ Execução: `java HtmlAnalyzer <URL>`
- [ ] ✅ Arquivo único

---

## 🔟 PREPARAÇÃO PARA ENTREVISTA

- [ ] Li o arquivo `PERGUNTAS_TECNICAS.md`
- [ ] Entendo por que usei Stack
- [ ] Sei explicar a complexidade O(n)
- [ ] Sei explicar cada decisão de design
- [ ] Consigo desenhar o algoritmo no quadro
- [ ] Sei explicar casos mal-formados
- [ ] Revisei conceitos de pilha/LIFO
- [ ] Pensei em melhorias futuras

---

## ✉️ ANTES DE ENVIAR

### Email/Plataforma de Entrega
- [ ] Assunto correto (se especificado)
- [ ] Arquivo anexado: `rafael_SEU_SOBRENOME.tar`
- [ ] Nome do arquivo conferido (sobrenome correto!)
- [ ] Tamanho do arquivo razoável (< 10KB)
- [ ] Prazo de entrega respeitado

### Mensagem
- [ ] Breve e profissional
- [ ] Menciona seu nome completo
- [ ] Menciona vaga (Estágio em Engenharia de Software)
- [ ] Agradece pela oportunidade

**Exemplo:**
```
Olá,

Segue em anexo minha solução para o desafio técnico da vaga de 
Estágio em Engenharia de Software na Axur.

Arquivo: rafael_sanoli.tar

Agradeço a oportunidade e fico à disposição para quaisquer dúvidas.

Atenciosamente,
Rafael Sanoli
```

---

## 🎯 CHECKLIST RÁPIDO (Last Minute)

Use este checklist simplificado 5 minutos antes de enviar:

```
[ ] Compila? javac HtmlAnalyzer.java
[ ] Executa? java HtmlAnalyzer <URL>
[ ] Teste básico passa?
[ ] Teste mal-formado passa?
[ ] URL inválida retorna "URL connection error"?
[ ] Arquivo .tar criado?
[ ] Nome do .tar correto (com MEU sobrenome)?
[ ] Pronto para enviar!
```

---

## 🚀 VOCÊ ESTÁ PRONTO!

Se todos os itens estão marcados, **sua solução está perfeita!**

**Boa sorte no processo seletivo da Axur!** 🎉

---

**Última atualização:** 2026-02-04
**Desenvolvido por:** Rafael Sanoli

