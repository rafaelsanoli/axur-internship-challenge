# 📚 ÍNDICE - Desafio Técnico Axur

## Bem-vindo ao Projeto HtmlAnalyzer!

Este é um guia completo para sua solução do desafio técnico de Estágio em Engenharia de Software na Axur.

---

## 🎯 COMECE AQUI

**Primeira vez?** Leia nesta ordem:

1. **RESUMO_SOLUCAO.md** - Visão geral da solução completa
2. **HtmlAnalyzer.java** - O código-fonte principal
3. **INSTRUCOES_TESTE.md** - Como testar a solução
4. **CHECKLIST_FINAL.md** - Verificações antes de entregar

---

## 📂 ESTRUTURA DO PROJETO

```
axur-internship-challenge/
│
├── src/
│   ├── HtmlAnalyzer.java          ⭐ ARQUIVO PRINCIPAL
│
├── test_basic.html                 🧪 Teste: texto mais profundo
├── test_tie.html                   🧪 Teste: empate
├── test_malformed.html             🧪 Teste: tags cruzadas
├── test_unclosed.html              🧪 Teste: tag não fechada
├── test_deep.html                  🧪 Teste: múltiplos níveis
├── test_empty_lines.html           🧪 Teste: linhas vazias
│
├── README.md                       📖 Documentação básica
├── RESUMO_SOLUCAO.md              📋 Visão geral completa
├── INSTRUCOES_TESTE.md            🔧 Como testar
├── EXEMPLO_VISUAL.md              👁️ Visualização do algoritmo
├── PERGUNTAS_TECNICAS.md          🎤 Preparação para entrevista
├── CHECKLIST_FINAL.md             ✅ Lista de verificação
├── INDEX.md                        📚 Este arquivo
│
├── run_tests.sh                    🤖 Script de testes automático
└── create_tar.sh                   📦 Script para criar entrega
```

---

## 📖 GUIA DE DOCUMENTAÇÃO

### Para Implementação
| Arquivo | Descrição | Quando Usar |
|---------|-----------|-------------|
| **HtmlAnalyzer.java** | Código-fonte completo | Sempre - é o arquivo principal! |
| **README.md** | Documentação básica | Referência rápida de comandos |

### Para Testes
| Arquivo | Descrição | Quando Usar |
|---------|-----------|-------------|
| **INSTRUCOES_TESTE.md** | Guia detalhado de testes | Primeiro teste da solução |
| **run_tests.sh** | Automação de testes | Testes rápidos |
| **test_*.html** | Casos de teste | Validação de funcionalidades |

### Para Entender a Solução
| Arquivo | Descrição | Quando Usar |
|---------|-----------|-------------|
| **RESUMO_SOLUCAO.md** | Visão geral completa | Entender toda a solução |
| **EXEMPLO_VISUAL.md** | Passo a passo visual | Entender o algoritmo |

### Para Entrevista
| Arquivo | Descrição | Quando Usar |
|---------|-----------|-------------|
| **PERGUNTAS_TECNICAS.md** | Q&A técnico | Preparação para entrevista |

### Para Entrega
| Arquivo | Descrição | Quando Usar |
|---------|-----------|-------------|
| **CHECKLIST_FINAL.md** | Lista de verificação | Antes de enviar! |
| **create_tar.sh** | Criar arquivo .tar | Empacotamento final |

---

## 🚀 FLUXO DE TRABALHO RECOMENDADO

### 1️⃣ Entender a Solução (30 min)
```
1. Leia RESUMO_SOLUCAO.md
2. Abra HtmlAnalyzer.java no IntelliJ
3. Leia os comentários do código
4. Veja EXEMPLO_VISUAL.md para entender o algoritmo
```

### 2️⃣ Testar a Solução (15 min)
```
1. Abra INSTRUCOES_TESTE.md
2. Compile: javac HtmlAnalyzer.java
3. Execute os 6 testes
4. Valide os outputs
```

### 3️⃣ Preparar para Entrevista (1 hora)
```
1. Leia PERGUNTAS_TECNICAS.md
2. Pratique explicar o algoritmo
3. Desenhe a Stack em papel
4. Revise complexidade O(n)
```

### 4️⃣ Preparar Entrega (10 min)
```
1. Abra CHECKLIST_FINAL.md
2. Marque todos os itens
3. Execute create_tar.sh (edite seu sobrenome!)
4. Envie!
```

---

## 🎯 OBJETIVOS DO DESAFIO

### O que você precisa entregar:
- ✅ Arquivo `rafael_SEU_SOBRENOME.tar` contendo `HtmlAnalyzer.java`

### O que será avaliado:
- ✅ Corretude da solução
- ✅ Qualidade do código
- ✅ Tratamento de erros
- ✅ Seguimento dos requisitos

### Diferenciais:
- ✅ Código limpo e bem documentado ✓
- ✅ Bônus de HTML mal-formado ✓
- ✅ Robustez no tratamento de exceções ✓

---

## 💡 DICAS IMPORTANTES

### ⚠️ Atenção!
- O arquivo DEVE se chamar **`HtmlAnalyzer.java`** (case-sensitive)
- O nome do .tar DEVE incluir SEU sobrenome (não deixe "sanoli"!)
- Teste TODOS os casos antes de enviar
- Compile e execute com os comandos EXATOS do desafio

### ✅ Boas Práticas
- Leia todo o código antes de modificar
- Teste cada mudança
- Use o checklist antes de entregar
- Pratique explicar sua solução em voz alta

### 🚫 Evite
- Modificar o nome da classe ou arquivo
- Adicionar bibliotecas externas
- Deixar código de debug (System.out.println desnecessários)
- Enviar sem testar

---

## 📞 PERGUNTAS FREQUENTES

### P: Posso modificar o código?
**R:** Sim! O código está correto, mas você pode melhorar comentários, renomear variáveis, etc.

### P: Preciso entregar todos os arquivos?
**R:** NÃO! Entregue APENAS `HtmlAnalyzer.java` dentro do .tar. Os outros arquivos são para seu estudo.

### P: E se eu não tiver Java no terminal?
**R:** Use o terminal integrado do IntelliJ (Alt+F12). Ele tem acesso ao JDK do projeto.

### P: Como sei se minha solução está correta?
**R:** Use o `CHECKLIST_FINAL.md`. Se todos os itens estiverem marcados, está perfeito!

### P: Posso adicionar métodos ou variáveis?
**R:** Sim, mas os requisitos já estão todos implementados. Evite complexidade desnecessária.

### P: Qual a diferença entre os arquivos .md?
**R:** Veja a tabela "GUIA DE DOCUMENTAÇÃO" acima.

---

## 🎓 RECURSOS DE APRENDIZADO

### Conceitos Cobertos
- **Estruturas de Dados:** Stack (Pilha), LIFO
- **Algoritmos:** Processamento em streaming, validação de estruturas
- **Java:** I/O, Exceptions, Collections
- **Clean Code:** Métodos pequenos, nomes descritivos, documentação

### Para Revisar
- Stack e operações (push, pop, peek)
- Try-with-resources
- Complexidade de tempo e espaço
- Diferença entre > e >=

---

## 📊 ESTATÍSTICAS DO PROJETO

- **Linhas de código:** ~160 linhas (HtmlAnalyzer.java)
- **Métodos:** 7 (incluindo main)
- **Complexidade:** O(n) tempo, O(d) espaço
- **Casos de teste:** 6 arquivos HTML
- **Documentação:** 7 arquivos .md, ~1500 linhas

---

## 🏆 VOCÊ ESTÁ PREPARADO!

✅ Código completo e funcional
✅ Testes abrangentes
✅ Documentação detalhada
✅ Preparação para entrevista
✅ Checklist de entrega

**Tudo que você precisa está neste projeto!**

---

## 📅 CRONOGRAMA SUGERIDO

### Dia 1: Entender
- [ ] 30 min: Ler RESUMO_SOLUCAO.md
- [ ] 30 min: Estudar HtmlAnalyzer.java
- [ ] 30 min: Ver EXEMPLO_VISUAL.md

### Dia 2: Testar
- [ ] 15 min: Compilar e executar
- [ ] 30 min: Rodar todos os testes
- [ ] 15 min: Validar outputs

### Dia 3: Preparar
- [ ] 1 hora: Ler PERGUNTAS_TECNICAS.md
- [ ] 30 min: Praticar explicações
- [ ] 30 min: Revisar conceitos

### Dia 4: Entregar
- [ ] 10 min: CHECKLIST_FINAL.md
- [ ] 5 min: Criar .tar
- [ ] 5 min: Enviar

**Total: ~4 horas**

---

## 🎯 PRÓXIMOS PASSOS

**Agora:**
1. Leia **RESUMO_SOLUCAO.md**
2. Abra **HtmlAnalyzer.java** no IntelliJ

**Depois:**
3. Siga **INSTRUCOES_TESTE.md** para testar

**Antes de Entregar:**
4. Use **CHECKLIST_FINAL.md**

---

## 📬 CONTATO

**Desenvolvido por:** Rafael Sanoli  
**Data:** 2026-02-04  
**Projeto:** Desafio Técnico - Axur  
**Vaga:** Estágio em Engenharia de Software

---

## 🌟 BOA SORTE!

Você tem tudo que precisa para ter sucesso neste desafio.

**Confie na sua preparação e arrase! 🚀**

---

*Última atualização: 2026-02-04*
