import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.Stack;

/**
 * HtmlAnalyzer - Axur Internship Challenge
 * Analyzes HTML structure from a URL and finds the deepest text content.
 *
 * Analisador HTML - Desafio Técnico Axur
 * Analisa a estrutura HTML de uma URL e encontra o texto no nível mais profundo.
 *
 * @author Rafael Sanoli
 * @version 1.0
 */
public class HtmlAnalyzer {

    // Stack to track opened tags | Pilha para rastrear tags abertas
    private final Stack<String> tagStack;

    // Current depth in the HTML structure | Profundidade atual na estrutura HTML
    private int currentDepth;

    // Maximum depth found so far | Profundidade máxima encontrada até agora
    private int maxDepth;

    // Text stored at the deepest level | Texto armazenado no nível mais profundo
    private String deepestText;

    // Flag indicating if HTML is malformed | Flag indicando se o HTML está mal-formado
    private boolean isMalformed;

    /**
     * Constructor - Initializes the HTML analyzer.
     * Construtor - Inicializa o analisador HTML.
     */
    public HtmlAnalyzer() {
        this.tagStack = new Stack<>();
        this.currentDepth = 0;
        this.maxDepth = 0;
        this.deepestText = null;
        this.isMalformed = false;
    }

    /**
     * Analyzes HTML content from a given URL.
     * Analisa o conteúdo HTML de uma URL fornecida.
     *
     * @param urlString The URL to fetch HTML from | A URL de onde buscar o HTML
     */
    public void analyze(String urlString) {
        try {
            URL url = new URL(urlString);

            try (BufferedReader reader = new BufferedReader(
                    new InputStreamReader(url.openStream()))) {

                String line;
                while ((line = reader.readLine()) != null) {
                    processLine(line);

                    // If malformed HTML detected, stop processing
                    // Se detectou HTML mal-formado, para o processamento
                    if (isMalformed) {
                        break;
                    }
                }

                // Check if there are unclosed tags at the end
                // Verifica se há tags não fechadas ao final
                if (!isMalformed && !tagStack.isEmpty()) {
                    isMalformed = true;
                }

            }

        } catch (Exception e) {
            // Any IO or connection exception
            // Qualquer exceção de IO ou conexão
            System.out.println("URL connection error");
            return;
        }

        // Print the result
        // Imprime o resultado
        printResult();
    }

    /**
     * Processes a single line of HTML.
     * Processa uma única linha do HTML.
     *
     * @param line The line to process | A linha a ser processada
     */
    private void processLine(String line) {
        if (isMalformed) {
            return;
        }

        // Remove leading and trailing whitespace
        // Remove espaços em branco iniciais e finais
        line = line.trim();

        // Ignore empty lines
        // Ignora linhas vazias
        if (line.isEmpty()) {
            return;
        }

        // Ignore DOCTYPE declarations and comments
        // Ignora declarações DOCTYPE e comentários
        if (line.startsWith("<!") || line.startsWith("<!--")) {
            return;
        }

        // Check if it's a closing tag
        // Verifica se é tag de fechamento
        if (line.startsWith("</") && line.endsWith(">")) {
            processClosingTag(line);
        }
        // Check if it's an opening tag
        // Verifica se é tag de abertura
        else if (line.startsWith("<") && line.endsWith(">")) {
            processOpeningTag(line);
        }
        // Otherwise, it's text
        // Caso contrário, é texto
        else {
            processText(line);
        }
    }

    /**
     * Processes an opening tag.
     * Processa uma tag de abertura.
     *
     * @param line The opening tag line | A linha com a tag de abertura
     */
    private void processOpeningTag(String line) {
        // Extract tag name (remove < and >)
        // Extrai o nome da tag (remove < e >)
        String tagName = line.substring(1, line.length() - 1);

        // Push the tag onto the stack
        // Empilha a tag
        tagStack.push(tagName);

        // Increment depth
        // Incrementa a profundidade
        currentDepth++;
    }

    /**
     * Processes a closing tag.
     * Processa uma tag de fechamento.
     *
     * @param line The closing tag line | A linha com a tag de fechamento
     */
    private void processClosingTag(String line) {
        // Extract tag name (remove </ and >)
        // Extrai o nome da tag (remove </ e >)
        String tagName = line.substring(2, line.length() - 1);

        // Check if the stack is empty
        // Verifica se a pilha está vazia
        if (tagStack.isEmpty()) {
            isMalformed = true;
            return;
        }

        // Check if the tag matches the top of the stack
        // Verifica se a tag corresponde ao topo da pilha
        String topTag = tagStack.pop();
        if (!topTag.equals(tagName)) {
            isMalformed = true;
            return;
        }

        // Decrement depth
        // Decrementa a profundidade
        currentDepth--;
    }

    /**
     * Processes a text line.
     * Processa uma linha de texto.
     *
     * @param line The text line | A linha de texto
     */
    private void processText(String line) {
        // If current depth is greater than the maximum recorded
        // Se a profundidade atual é maior que a máxima registrada
        if (currentDepth > maxDepth) {
            maxDepth = currentDepth;
            deepestText = line;
        }
        // If equal, DO NOT update (keep the first found)
        // Se for igual, NÃO atualiza (mantém o primeiro encontrado)
    }

    /**
     * Prints the final result.
     * Imprime o resultado final.
     */
    private void printResult() {
        if (isMalformed) {
            System.out.println("malformed HTML");
        } else if (deepestText != null) {
            System.out.println(deepestText);
        }
        // If there's no text, print nothing
        // Se não houver texto, não imprime nada
    }

    /**
     * Main method - entry point of the program.
     * Método principal - ponto de entrada do programa.
     *
     * @param args Command line arguments (expects URL as first argument)
     *             Argumentos de linha de comando (espera URL como primeiro argumento)
     */
    public static void main(String[] args) {
        // Check if URL was provided
        // Verifica se a URL foi fornecida
        if (args.length == 0) {
            System.out.println("Usage: java HtmlAnalyzer <URL>");
            return;
        }

        String url = args[0];
        HtmlAnalyzer analyzer = new HtmlAnalyzer();
        analyzer.analyze(url);
    }
}
