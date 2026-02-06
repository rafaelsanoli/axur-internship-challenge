# GUIA DE TESTES - HtmlAnalyzer

## Instruções para Testar o Programa

Como você está usando IntelliJ IDEA, siga estas instruções para testar a solução:

---

## Método 1: Usando o Terminal do IntelliJ IDEA

1. **Abra o Terminal integrado do IntelliJ** (Alt+F12 ou View > Tool Windows > Terminal)

2. **Navegue até a pasta src:**
   ```bash
   cd src
   ```

3. **Compile o programa:**
   ```bash
   javac HtmlAnalyzer.java
   ```

4. **Execute os testes:**

   **Teste 1 - Texto mais profundo:**
   ```bash
   java HtmlAnalyzer file:///home/rafaelsanoli/IdeaProjects/axur-internship-challenge/test_basic.html
   ```
   ✓ Esperado: `Texto mais profundo`

   **Teste 2 - Empate (retorna primeiro):**
   ```bash
   java HtmlAnalyzer file:///home/rafaelsanoli/IdeaProjects/axur-internship-challenge/test_tie.html
   ```
   ✓ Esperado: `Primeiro texto profundo`

   **Teste 3 - HTML mal-formado (tags cruzadas):**
   ```bash
   java HtmlAnalyzer file:///home/rafaelsanoli/IdeaProjects/axur-internship-challenge/test_malformed.html
   ```
   ✓ Esperado: `malformed HTML`

   **Teste 4 - Tag não fechada:**
   ```bash
   java HtmlAnalyzer file:///home/rafaelsanoli/IdeaProjects/axur-internship-challenge/test_unclosed.html
   ```
   ✓ Esperado: `malformed HTML`

5. **Teste com URL inválida:**
   ```bash
   java HtmlAnalyzer https://url-invalida-que-nao-existe-123456789.com
   ```
   ✓ Esperado: `URL connection error`

---

## Método 2: Criar Run Configuration no IntelliJ

1. Clique com botão direito em `HtmlAnalyzer.java`
2. Selecione "Modify Run Configuration..."
3. Em "Program arguments", adicione um dos caminhos de teste:
   ```
   file:///home/rafaelsanoli/IdeaProjects/axur-internship-challenge/test_basic.html
   ```
4. Clique em "Run"

---

## Método 3: Testar com URL Real Online

Você pode testar com URLs reais que tenham HTML simples:

```bash
java HtmlAnalyzer https://example.com
```

**Nota:** O example.com tem HTML complexo em uma linha, mas você pode criar um servidor local simples ou usar um serviço como pastebin/gist com HTML simples.

---

## Verificação Manual dos Testes

### Teste 1: test_basic.html
**Estrutura:**
```
html (nível 1)
  └─ body (nível 2)
       ├─ div (nível 3)
       │    └─ div (nível 4)
       │         └─ p (nível 5)
       │              └─ span (nível 6)
       │                   └─ "Texto mais profundo" ← ESTE
       └─ div (nível 3)
            └─ "Texto raso"
```
**Resultado esperado:** `Texto mais profundo`

### Teste 2: test_tie.html
**Estrutura:**
```
html (nível 1)
  └─ body (nível 2)
       ├─ div (nível 3)
       │    └─ p (nível 4)
       │         └─ "Primeiro texto profundo" ← ESTE (primeiro)
       └─ div (nível 3)
            └─ p (nível 4)
                 └─ "Segundo texto profundo" (mesmo nível, ignorado)
```
**Resultado esperado:** `Primeiro texto profundo`

### Teste 3: test_malformed.html
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
**Resultado esperado:** `malformed HTML`

### Teste 4: test_unclosed.html
**Estrutura:**
```
<html>
<body>
<div>  ← Tag nunca fechada!
</body>
</html>
```
**Resultado esperado:** `malformed HTML`

---

## Empacotamento para Entrega

Quando estiver pronto para entregar, execute:

```bash
cd /home/rafaelsanoli/IdeaProjects/axur-internship-challenge/src
tar -cvf rafael_sanoli.tar HtmlAnalyzer.java
```

**OU** incluindo o README (opcional):

```bash
cd /home/rafaelsanoli/IdeaProjects/axur-internship-challenge
tar -cvf rafael_sanoli.tar -C src HtmlAnalyzer.java README.md
```

**Importante:** Substitua "sanoli" pelo seu sobrenome real!

---

## Checklist Final

Antes de entregar, verifique:

- [ ] ✓ Código compila com `javac HtmlAnalyzer.java`
- [ ] ✓ Executa com `java HtmlAnalyzer <URL>`
- [ ] ✓ Retorna texto mais profundo corretamente
- [ ] ✓ Retorna primeiro texto em caso de empate
- [ ] ✓ Detecta HTML mal-formado (tags cruzadas)
- [ ] ✓ Detecta tags não fechadas
- [ ] ✓ Retorna "URL connection error" para URLs inválidas
- [ ] ✓ Não usa bibliotecas externas de parsing
- [ ] ✓ Usa apenas Java puro (JDK 17)
- [ ] ✓ Arquivo único: HtmlAnalyzer.java
- [ ] ✓ Arquivo empacotado em .tar

---

## Dúvidas Comuns

**Q: Por que usar file:// para arquivos locais?**
A: A classe `java.net.URL` requer o protocolo. Para arquivos locais, use `file://` seguido do caminho absoluto.

**Q: O programa funciona com HTML "normal" (tudo em uma linha)?**
A: Não. O desafio especifica que cada linha contém APENAS uma tag de abertura, fechamento ou texto. O HTML deve estar formatado dessa forma.

**Q: Posso adicionar comentários no código?**
A: Sim! O código já inclui JavaDoc e comentários explicativos.

**Q: E se a URL retornar 404 ou outro erro HTTP?**
A: O programa irá capturar a exceção e imprimir "URL connection error".

---

Boa sorte no desafio da Axur! 🚀
