# 🔍 EXEMPLO VISUAL DO ALGORITMO

## Como o HtmlAnalyzer Processa o HTML

Vamos acompanhar passo a passo como o algoritmo processa o arquivo `test_basic.html`:

---

## 📄 HTML de Entrada

```html
<html>
<head>
<title>
Teste Básico
</title>
</head>
<body>
<div>
<div>
<p>
<span>
Texto mais profundo
</span>
</p>
</div>
</div>
<div>
Texto raso
</div>
</body>
</html>
```

---

## 🔄 Processamento Linha a Linha

| # | Linha | Tipo | Ação | Stack | Profundidade | Max | Texto Salvo |
|---|-------|------|------|-------|--------------|-----|-------------|
| 1 | `<html>` | Tag Abertura | Push "html" | [html] | 1 | 0 | - |
| 2 | `<head>` | Tag Abertura | Push "head" | [html, head] | 2 | 0 | - |
| 3 | `<title>` | Tag Abertura | Push "title" | [html, head, title] | 3 | 0 | - |
| 4 | `Teste Básico` | Texto | 3 > 0? SIM → Salva | [html, head, title] | 3 | **3** | **"Teste Básico"** |
| 5 | `</title>` | Tag Fechamento | Pop "title" | [html, head] | 2 | 3 | "Teste Básico" |
| 6 | `</head>` | Tag Fechamento | Pop "head" | [html] | 1 | 3 | "Teste Básico" |
| 7 | `<body>` | Tag Abertura | Push "body" | [html, body] | 2 | 3 | "Teste Básico" |
| 8 | `<div>` | Tag Abertura | Push "div" | [html, body, div] | 3 | 3 | "Teste Básico" |
| 9 | `<div>` | Tag Abertura | Push "div" | [html, body, div, div] | 4 | 3 | "Teste Básico" |
| 10 | `<p>` | Tag Abertura | Push "p" | [html, body, div, div, p] | 5 | 3 | "Teste Básico" |
| 11 | `<span>` | Tag Abertura | Push "span" | [html, body, div, div, p, span] | 6 | 3 | "Teste Básico" |
| 12 | `Texto mais profundo` | Texto | 6 > 3? SIM → Salva | [html, body, div, div, p, span] | 6 | **6** | **"Texto mais profundo"** |
| 13 | `</span>` | Tag Fechamento | Pop "span" | [html, body, div, div, p] | 5 | 6 | "Texto mais profundo" |
| 14 | `</p>` | Tag Fechamento | Pop "p" | [html, body, div, div] | 4 | 6 | "Texto mais profundo" |
| 15 | `</div>` | Tag Fechamento | Pop "div" | [html, body, div] | 3 | 6 | "Texto mais profundo" |
| 16 | `</div>` | Tag Fechamento | Pop "div" | [html, body] | 2 | 6 | "Texto mais profundo" |
| 17 | `<div>` | Tag Abertura | Push "div" | [html, body, div] | 3 | 6 | "Texto mais profundo" |
| 18 | `Texto raso` | Texto | 3 > 6? NÃO → Ignora | [html, body, div] | 3 | 6 | "Texto mais profundo" |
| 19 | `</div>` | Tag Fechamento | Pop "div" | [html, body] | 2 | 6 | "Texto mais profundo" |
| 20 | `</body>` | Tag Fechamento | Pop "body" | [html] | 1 | 6 | "Texto mais profundo" |
| 21 | `</html>` | Tag Fechamento | Pop "html" | [] | 0 | 6 | "Texto mais profundo" |

### ✅ Resultado Final
- Stack vazia? **SIM** → HTML válido
- Texto mais profundo: **"Texto mais profundo"** (profundidade 6)

---

## 🚨 Exemplo de HTML Mal-Formado

### Tags Cruzadas (`test_malformed.html`)

```html
<html>
<body>
<div>
<p>
Texto no nível 3
</div>    ← ERRO: deveria ser </p>
</p>      ← Tag cruzada
</body>
</html>
```

#### Processamento:

| # | Linha | Stack | Ação | Status |
|---|-------|-------|------|--------|
| 1 | `<html>` | [html] | Push "html" | ✅ OK |
| 2 | `<body>` | [html, body] | Push "body" | ✅ OK |
| 3 | `<div>` | [html, body, div] | Push "div" | ✅ OK |
| 4 | `<p>` | [html, body, div, p] | Push "p" | ✅ OK |
| 5 | `Texto no nível 3` | [html, body, div, p] | Texto salvo | ✅ OK |
| 6 | `</div>` | [html, body, div, p] | Topo = "p", mas recebeu "div" | ❌ **MALFORMED!** |

**Output:** `malformed HTML`

---

## 🏷️ Exemplo de Tag Não Fechada (`test_unclosed.html`)

```html
<html>
<body>
<div>     ← Nunca fecha!
</body>
</html>
```

#### Processamento:

| # | Linha | Stack | Status |
|---|-------|-------|--------|
| 1 | `<html>` | [html] | ✅ OK |
| 2 | `<body>` | [html, body] | ✅ OK |
| 3 | `<div>` | [html, body, div] | ✅ OK |
| 4 | `</body>` | [html, body, div] | Topo = "div", mas recebeu "body" | ❌ **MALFORMED!** |

**Output:** `malformed HTML`

---

## 🎯 Exemplo de Empate (`test_tie.html`)

```html
<html>
<body>
<div>
<p>
Primeiro texto profundo  ← Profundidade 4
</p>
</div>
<div>
<p>
Segundo texto profundo   ← Também profundidade 4
</p>
</div>
</body>
</html>
```

#### Processamento dos Textos:

| # | Texto | Profundidade | Max Atual | Ação | Texto Salvo |
|---|-------|--------------|-----------|------|-------------|
| 1 | "Primeiro texto profundo" | 4 | 0 | 4 > 0? SIM → Salva | **"Primeiro texto profundo"** |
| 2 | "Segundo texto profundo" | 4 | 4 | 4 > 4? NÃO → Ignora | "Primeiro texto profundo" |

**Output:** `Primeiro texto profundo` ← Mantém o primeiro!

---

## 💡 Pontos-Chave do Algoritmo

### 1. Stack para Rastreamento
A Stack mantém a hierarquia de tags abertas:
```
Push em <tag>  → Empilha
Pop em </tag>  → Desempilha e valida
```

### 2. Profundidade = Tamanho da Stack
```java
currentDepth = tagStack.size()
```

### 3. Atualização do Texto Mais Profundo
```java
if (currentDepth > maxDepth) {
    maxDepth = currentDepth;
    deepestText = line;
}
// Se currentDepth == maxDepth, NÃO atualiza (mantém o primeiro)
```

### 4. Validação de HTML Mal-Formado
```java
// Ao fechar tag:
if (tagStack.isEmpty()) → malformed
if (!tagStack.peek().equals(tagName)) → malformed

// Ao final:
if (!tagStack.isEmpty()) → malformed (tags não fechadas)
```

---

## 🧮 Complexidade

### Tempo: O(n)
- Uma única passagem pelo arquivo
- Cada linha é processada uma vez
- Operações de Stack são O(1)

### Espaço: O(d)
- d = profundidade máxima da estrutura
- Stack armazena apenas tags abertas
- No pior caso, todas as tags aninhadas: O(n)

---

## 🎓 Por Que Stack é a Estrutura Ideal?

1. **LIFO (Last In, First Out)**
   - Tag mais recente aberta deve ser a primeira a fechar
   - Perfeito para validar pareamento de tags

2. **Eficiência**
   - Push e Pop são O(1)
   - Peek (consultar topo) é O(1)

3. **Simplicidade**
   - Código limpo e fácil de entender
   - Lógica intuitiva

4. **Validação Natural**
   - Stack vazia no final = HTML válido
   - Mismatch no topo = HTML mal-formado

---

Agora você entende completamente como o algoritmo funciona! 🚀
