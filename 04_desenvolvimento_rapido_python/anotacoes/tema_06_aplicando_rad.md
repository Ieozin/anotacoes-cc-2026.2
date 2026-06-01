# Tema 06: Aplicando RAD
**Data:** 01/06/2026 | **Status:** Concluído

## 1. Engenharia de Requisitos no RAD
Diferente dos modelos em cascata, onde todos os requisitos são engessados no início do projeto, o RAD assume que os requisitos irão evoluir à medida que o cliente testa o sistema. O foco muda da documentação excessiva para a validação contínua.

- **Elicitação:** Levantamento do que deve ser feito. No RAD, a técnica principal são as **oficinas JAD** (Joint Application Development), reuniões focadas onde clientes e desenvolvedores definem o escopo juntos.
- **Priorização:** Como o tempo é curto, o que é mais importante deve ser programado primeiro. Usam-se técnicas como a classificação por cartões para criar um consenso de prioridades entre os envolvidos.
- **Validação:** O cliente não aprova um documento de 50 páginas, ele avalia e valida o **protótipo funcional**. Se atender à demanda, avança para o design; se não, volta para o gerenciamento de requisitos.

## 2. Modelagem: Negócios e Dados
A modelagem formaliza e estrutura a aplicação antes da construção em código.

**Modelagem de Negócios:**
Garante que o software construído reflita a operação real da empresa. A ferramenta padrão para isso é o **Diagrama de Casos de Uso (UML)**, que mapeia como os atores (usuários) vão interagir com o sistema. Foca-se em mapear apenas os processos que estarão dentro do escopo do software, evitando complexidade inútil.

**Modelagem de Dados:**
Organiza o ciclo de vida da informação e se divide em 3 etapas sequenciais:
1. **Conceitual:** Voltada para o negócio. Define apenas as entidades e seus relacionamentos (ex: *Escola* tem *Alunos*) de forma que o cliente leigo consiga entender.
2. **Lógico:** Independente de tecnologia. Define a estrutura das tabelas, atributos e normalização (ex: Diagrama Entidade-Relacionamento).
3. **Físico:** Totalmente focado em TI. Define os tipos exatos dos dados (`VARCHAR`, `INT`), as chaves primárias/estrangeiras e como isso será implementado no SGBD escolhido (ex: PostgreSQL).

## 3. Design de Interface (UI / UX)
A interação do usuário determina o sucesso do RAD. O sistema precisa ter previsibilidade, simplicidade e fornecer feedbacks constantes de ação. A prototipagem segue níveis de maturidade:
- **Sketches:** Esboços rudimentares (muitas vezes no papel) para alinhar ideias básicas. São descartáveis.
- **Wireframes:** Mapeamento estrutural sem cores ou refinamento. Define onde fica a navegação e onde ficam os botões.
- **Mockups:** Modelos de alta fidelidade visual. Define paleta de cores, tipografia e identidade da marca, mas ainda não possui lógica estrutural de banco.
- **Protótipos:** Versão funcional e interativa. É o "esqueleto vivo" do sistema entregue ao cliente para testes de usabilidade na metodologia RAD.

## 4. Implementação Prática com Python
A combinação de RAD com Python foca em usar ferramentas diretas para construir a interface e persistir os dados rapidamente.

- **Interface Gráfica:** A biblioteca `tkinter` constrói as janelas, recebendo componentes como `Entry` para captura de dados e `Treeview` para renderizar listagens em forma de tabela.
- **Lógica e UI:** No desenvolvimento ágil, as regras de negócios (ex: cálculo de estoque e validações) devem estar encapsuladas e ser processadas isoladamente antes de alimentar a interface visual.
- **Persistência Alternativa:** Para protótipos iniciais que não demandam um banco relacional maduro imediato, o uso de bibliotecas como `pandas` e `openpyxl` permite salvar e atualizar registros diretamente em planilhas Excel (`.xlsx`), facilitando validações rápidas pelo cliente antes da modelagem física do banco.
- **Controle de Acesso Modular:** A implementação de telas de Login (com Toplevel widgets) para verificação de privilégios demonstra como controlar o acesso, escondendo os módulos centrais (`withdraw()` e `deiconify()`) de acordo com o nível da sessão do usuário.