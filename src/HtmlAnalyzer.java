import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.Stack;

/**
 * HtmlAnalyzer - Axur Internship Challenge
 * Analyzes HTML structure from a URL and finds the deepest text content.
 *
 * @author Rafael Sanoli
 * @version 1.0
 */
public class HtmlAnalyzer {

    private final Stack<String> tagStack;
    private int currentDepth;
    private int maxDepth;
    private String deepestText;
    private boolean isMalformed;

    public HtmlAnalyzer() {
        this.tagStack = new Stack<>();
        this.currentDepth = 0;
        this.maxDepth = 0;
        this.deepestText = null;
        this.isMalformed = false;
    }

    /**
     * Analyzes HTML content from a given URL.
     *
     * @param urlString The URL to fetch HTML from
     */
    public void analyze(String urlString) {
        try {
            URL url = new URL(urlString);

            try (BufferedReader reader = new BufferedReader(
                    new InputStreamReader(url.openStream()))) {

                String line;
                while ((line = reader.readLine()) != null) {
                    processLine(line);

                    // Se detectou HTML mal-formado, para o processamento
                    if (isMalformed) {
                        break;
                    }
                }

                // Verifica se há tags não fechadas ao final
                if (!isMalformed && !tagStack.isEmpty()) {
                    isMalformed = true;
                }

            }

        } catch (Exception e) {
            // Qualquer exceção de IO ou conexão
            System.out.println("URL connection error");
            return;
        }

        // Imprime o resultado
        printResult();
    }

    /**
     * Processes a single line of HTML.
     *
     * @param line The line to process
     */
    private void processLine(String line) {
        if (isMalformed) {
            return;
        }

        // Remove espaços em branco iniciais e finais
        line = line.trim();

        // Ignora linhas vazias
        if (line.isEmpty()) {
            return;
        }

        // Verifica se é tag de fechamento
        if (line.startsWith("</") && line.endsWith(">")) {
            processClosingTag(line);
        }
        // Verifica se é tag de abertura
        else if (line.startsWith("<") && line.endsWith(">")) {
            processOpeningTag(line);
        }
        // Caso contrário, é texto
        else {
            processText(line);
        }
    }

    /**
     * Processes an opening tag.
     *
     * @param line The opening tag line
     */
    private void processOpeningTag(String line) {
        // Extrai o nome da tag (remove < e >)
        String tagName = line.substring(1, line.length() - 1);

        // Empilha a tag
        tagStack.push(tagName);

        // Incrementa a profundidade
        currentDepth++;
    }

    /**
     * Processes a closing tag.
     *
     * @param line The closing tag line
     */
    private void processClosingTag(String line) {
        // Extrai o nome da tag (remove </ e >)
        String tagName = line.substring(2, line.length() - 1);

        // Verifica se a pilha está vazia
        if (tagStack.isEmpty()) {
            isMalformed = true;
            return;
        }

        // Verifica se a tag corresponde ao topo da pilha
        String topTag = tagStack.pop();
        if (!topTag.equals(tagName)) {
            isMalformed = true;
            return;
        }

        // Decrementa a profundidade
        currentDepth--;
    }

    /**
     * Processes a text line.
     *
     * @param line The text line
     */
    private void processText(String line) {
        // Se a profundidade atual é maior que a máxima registrada
        if (currentDepth > maxDepth) {
            maxDepth = currentDepth;
            deepestText = line;
        }
        // Se for igual, NÃO atualiza (mantém o primeiro encontrado)
    }

    /**
     * Prints the final result.
     */
    private void printResult() {
        if (isMalformed) {
            System.out.println("malformed HTML");
        } else if (deepestText != null) {
            System.out.println(deepestText);
        }
        // Se não houver texto, não imprime nada
    }

    /**
     * Main method - entry point of the program.
     *
     * @param args Command line arguments (expects URL as first argument)
     */
    public static void main(String[] args) {
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
