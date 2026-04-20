**Data:** 24/05/2024 | **Status:** Concluído

## 1. O que é Engenharia de Software?
Programar é fácil; difícil é manter um sistema gigante rodando sem quebrar. A Engenharia de Software (ES) existe para resolver a "Crise do Software" (hardware evoluiu rápido demais e os códigos viraram espaguete). 

- **O que é Software?** Não é só o código. É a trindade: **Instruções (código) + Estrutura de Dados + Documentação**.
- **Por que usar ES?** Para lidar com a complexidade. Você não constrói um prédio de 50 andares sem planta e sem engenheiro. Com software é a mesma coisa.

### As 4 Camadas da Engenharia de Software
A ES é estruturada como um bolo de 4 camadas. Se a base for ruim, tudo desmorona.

| Camada | O que faz? | Exemplo Prático |
| :--- | :--- | :--- |
| **1. Qualidade (Base)** | O alicerce de tudo. Garante que o software atende ao que o cliente pediu. | Cultura de testes, métricas. |
| **2. Processo** | A cola que une tudo. Define *quem* faz *o quê* e *quando*. | Scrum, Cascata, XP. |
| **3. Métodos** | O "como fazer" técnico. As regras do jogo para cada etapa. | Como modelar um banco, como elicitar requisitos. |
| **4. Ferramentas** | Automação para não fazer trabalho braçal. (Chamadas de ferramentas CASE). | Git, Jira, VS Code, Docker. |

---

## 2. O Processo de Software e Requisitos
Todo processo de software, não importa se é ágil ou tradicional, tem 5 etapas genéricas:
1. **Comunicação:** Entender o problema (Levantamento de Requisitos).
2. **Planejamento:** Cronograma, custos e riscos.
3. **Modelagem:** Desenhar a solução (Análise e Projeto / UML).
4. **Construção:** Codar e testar (Mão na massa).
5. **Entrega (Deployment):** Colocar em produção e dar suporte.

### Tipos de Requisitos (O que o sistema tem que fazer)
- **Funcionais:** O que o sistema *faz*. (Ex: "O usuário deve poder gerar um PDF do boleto").
- **Não Funcionais:** Restrições e qualidade. Como o sistema *se comporta*. (Ex: "O sistema deve ser feito em Python", "O banco de dados deve ser PostgreSQL", "A tela deve carregar em 2 segundos").
- **De Domínio (Regra de Negócio):** Leis ou regras da empresa. (Ex: "O cálculo do imposto deve seguir a lei X").

---

## 3. Gerenciamento de Projetos (Visão PMBOK)
O engenheiro de software foca no produto. O gerente de projetos foca em fazer o produto nascer no prazo e no orçamento. 

**O que é um Projeto?** É um esforço **temporário** (tem início, meio e fim) para criar um produto **único**.

### Os 5 Grupos de Processos (O Ciclo de Vida da Gestão)
1. **Iniciação:** Nasce o projeto (Termo de Abertura).
2. **Planejamento:** Define o escopo, cronograma e custos.
3. **Execução:** Fazer o que foi planejado.
4. **Monitoramento e Controle:** "Não se controla o que não se mede". Bater o planejado com o realizado.
5. **Encerramento:** Entregar o produto e dispensar a equipe.

### As 10 Áreas de Conhecimento (Onde o Gerente atua)
O PMBOK divide a gestão em 10 áreas. As mais cobradas em provas são:
- **Integração:** A única área que atua em TODOS os 5 grupos de processos. O gerente atua como um maestro.
- **Escopo:** Define o que vai ser feito (e o que NÃO vai). Aqui nasce a **EAP (Estrutura Analítica do Projeto)**, que quebra o projeto em pacotes de trabalho menores.
- **Cronograma:** Tempo e prazos.
- **Custos:** Orçamento.
- **Riscos:** (Veja o tópico 4 abaixo).

---

## 4. Gerenciamento de Riscos
Risco é um evento **incerto**. Se acontecer, afeta o projeto. 

> **⚠️ Atenção (Pegadinha Clássica de Prova):** Risco **NÃO** é apenas negativo! Um risco pode ser uma **Ameaça** (dólar subiu e o servidor ficou caro) ou uma **Oportunidade** (dólar caiu e sobrou dinheiro no orçamento).

### Como tratar os riscos:
1. **Identificação:** Brainstorming, Checklists, Entrevistas.
2. **Análise Qualitativa:** Priorizar os riscos. Fórmula básica: `Probabilidade x Impacto`.
3. **Análise Quantitativa:** Colocar valor financeiro ($$$) no risco.
4. **Planejamento de Respostas:** O que fazer se der ruim? (Mitigar, Eliminar, Aceitar ou Transferir).

---

## Simulado Rápido

**1. A Engenharia de Software é baseada em uma tecnologia de camadas. Qual é a camada que serve de alicerce (base) para todas as outras?**
a) Ferramentas
b) Processo
c) Qualidade
d) Métodos
- **Gabarito:** C. A qualidade é a base que sustenta o processo, os métodos e as ferramentas.

**2. Durante o planejamento de um projeto, o gerente utiliza uma ferramenta gráfica para decompor o trabalho em partes menores (pacotes de trabalho). Qual é o nome dessa ferramenta e a qual área de conhecimento ela pertence?**
a) Cronograma / Gerenciamento de Tempo
b) EAP (Estrutura Analítica do Projeto) / Gerenciamento de Escopo
c) Diagrama de Classes / Gerenciamento de Integração
- **Gabarito:** B. A EAP quebra o escopo em pedaços menores para facilitar a gestão.

**3. Sobre o conceito de Risco no PMBOK, é correto afirmar que:**
a) Riscos são sempre eventos negativos que atrasam o projeto.
b) Riscos são eventos incertos que podem ter impactos positivos ou negativos.
c) A análise quantitativa deve ser feita antes da qualitativa.
- **Gabarito:** B. Risco é incerteza. Pode ser ameaça (negativo) ou oportunidade (positivo).

---

