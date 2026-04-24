# Tema 04: Modelos de Processos de Desenvolvimento
**Data:** 23/04/2026 | **Status:** Concluído

## 1. Modelos Prescritivos (Os "Clássicos")
São modelos mais rígidos, com regras claras de "o q" e "quando" fazer.
- **Cascata (Linear):** Uma fase só começa quando a outra termina. Bom pra projeto engessado q não muda nunca. No mundo real, quase não se usa mais sozinho.
- **Incremental:** O projeto é fatiado em entregas. A primeira já entrega o básico (core) e as outras vão somando funções.
- **Evolucionário (Espiral e Prototipagem):** Focado em refinar a ideia. 
    - **Prototipagem:** Faz uma "casca" pro cliente ver se é aquilo mesmo. 
    - **Espiral:** Criado por Boehm, é focado em **Análise de Riscos** a cada volta da espiral.

## 2. Processo Unificado (RUP)
É um framework pesado e burocrático, mas bem estruturado. É iterativo, incremental e focado na arquitetura.
Dividido em 4 fases:
1. **Concepção:** Ver se o projeto é viável.
2. **Elaboração:** Foco na **Arquitetura** e em matar os riscos técnicos.
3. **Construção:** Onde a galera coda de verdade até a versão beta.
4. **Transição:** Deploy, treinamento e ajustes finais.

## 3. Extreme Programming (XP)
Agilidade pura. O foco é qualidade de código e feedback constante.
- **Práticas:** Programação em par (*Pair Programming*), integração contínua e cliente sempre por perto.
- **Artefatos:** Usa **Histórias de Usuários** e **Cartões CRC** (Classes, Responsabilidades e Colaboradores) em vez de documentação pesada.

## 4. Scrum
Não foca no código, mas em como organizar o time. Tudo acontece em ciclos chamados **Sprints** (2 a 4 semanas).
- **PO (Product Owner):** Dono da visão do produto, prioriza o Backlog.
- **Scrum Master:** O facilitador q tira os obstáculos do caminho do time.
- **Daily Scrum:** Reunião diária de 15 min pra alinhar o q foi feito e o q falta.

## 5. AUP (Agile Unified Process)
É o RUP "fitness". Mantém as 4 fases clássicas (Concepção, Elaboração, Construção, Transição), mas usa técnicas ágeis (tipo TDD) e menos papelada pra ser mais rápido.

## Pontos de Atenção
> **⚠️ Pegadinha de Prova:** Se a questão falar em "guiado por RISCOS", a resposta é **Modelo Espiral**.
> **⚠️ Diferença Chave:** Scrum cuida da gestão do projeto; XP cuida das boas práticas de engenharia/código. Eles se completam, não competem.
> **⚠️ Artefato Específico:** Se aparecer **Cartão CRC**, é XP na veia.

```python
# No XP, o foco é o TDD (Test-Driven Development)
# 1. Escreve o teste (ele falha)
# 2. Faz o código mais simples pro teste passar
# 3. Refatora pra ficar decente~
```