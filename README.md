# HtmlAnalyzer - Axur Technical Challenge
A Java-based HTML parser that identifies the deepest text content in an HTML structure from a given URL.
## Author
Rafael Santos Oliveira
## Compilation
```bash
javac HtmlAnalyzer.java
```
## Execution
```bash
java HtmlAnalyzer <URL>
```
## Features
- Stack-based depth tracking algorithm
- Detects deepest text in HTML structure
- Handles tie-breaking (returns first occurrence)
- Validates HTML structure (detects malformed HTML)
- Pure Java implementation (no external libraries)
- Java 17 compatible
## Output Types
- Deepest text found in the HTML structure
- `malformed HTML` - when structure is invalid (unclosed or crossed tags)
- `URL connection error` - when connection fails
## Implementation Details
- **Algorithm**: Stack-based approach for tracking tag depth
- **Validation**: Detects unclosed tags and incorrectly nested tags
- **Compliance**: Follows all technical requirements specified in the challenge
## Test Coverage
All test cases passed successfully:
- Deepest text identification
- Tie-breaking rule validation
- Malformed HTML detection (crossed tags)
- Malformed HTML detection (unclosed tags)
- Connection error handling
- Empty lines and whitespace handling
## Delivery Package
The solution is delivered as `rafael_santos_oliveira.tar` containing:
- `HtmlAnalyzer.java` (source code)
- `README.md` (this file)
