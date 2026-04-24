# Tema 01 e 02: Fundamentos e Gerenciamento
**Data:** 20/04/2026 | **Status:** Concluído

## 1. O Roadmap da Matéria
A Estácio dividiu a disciplina em 5 blocos principais pra gente entender o ciclo todo:
1. **Fundamentos e Gestão:** O básico de software e como gerenciar o projeto (PMBOK, riscos).
2. **Fases do PDS:** O passo a passo (requisitos, projeto, teste, manutenção).
3. **Modelos de Processo:** Metodologias (Scrum, XP, Processo Unificado).
4. **Qualidade:** Métricas e testes pra garantir q o sistema não exploda.
5. **Gerência de Configuração:** Controle de versão e mudanças (o q a gente faz com o Git).

## 2. O Combo: Software e Engenharia
Software não é só o código rodando. Pra Engenharia de Software (ES), é o pacote: **Instruções (código) + Estruturas de Dados + Documentação**.
A ES surgiu pra resolver a "Crise do Software" lá atrás, quando o hardware evoluiu e o código virou uma bagunça impossível de manter.

### As 4 Camadas da ES
| Camada | O q é? |
| :--- | :--- |
| **Qualidade** | O foco de tudo. Se não tiver qualidade, o resto não importa. |
| **Processo** | O "mapa" com as etapas e atividades (o framework). |
| **Métodos** | O "como fazer" técnico (modelagem, análise, UML). |
| **Ferramentas** | O apoio (Ferramentas CASE, IDEs, Git). |

## 3. O Fluxo de Trabalho (PDS)
As 5 atividades básicas de qualquer processo de desenvolvimento:
- **Comunicação:** Entender o problema (falar com o cliente/usuário).
- **Planejamento:** Definir cronograma, recursos e riscos.
- **Modelagem:** Desenhar a solução (criar o esqueleto).
- **Construção:** Onde a mágica acontece (Codar + Testar).
- **Entrega:** Botar pra rodar e ver se o cliente curtiu.

## 4. Requisitos: O que o sistema faz?
- **Funcionais:** O serviço q o sistema presta (ex: "gerar boleto", "cadastrar usuário").
- **Não Funcionais:** Restrições ou critérios de qualidade (ex: "o sistema deve ser em Python", "o login deve ser seguro", "tempo de resposta < 1s").
- **De Domínio:** Regras do negócio ou leis específicas (ex: "cálculo de imposto conforme a legislação atual").

## 5. Gerenciamento de Projetos (PMBOK)
Projeto é algo **temporário** (tem data pra acabar) pra criar um produto/serviço **único**.
O PMBOK divide isso em 5 grupos: Iniciação, Planejamento, Execução, Monitoramento/Controle e Encerramento.

### Gestão de Riscos
Risco é incerteza. Pode ser **bom (Oportunidade)** ou **ruim (Ameaça)**.

## Pontos de Atenção
> **⚠️ Pegadinha de Prova:** Quem prioriza os riscos é a análise **Qualitativa** (Probabilidade x Impacto). A análise **Quantitativa** serve pra dar valor numérico ou financeiro e é bem mais complexa.
> **⚠️ Conceito Chave:** A **Integração** é a única área de conhecimento q está em todas as fases da gestão do projeto.
> **⚠️ Fluxos de Processo:**
> - **Linear:** Uma etapa depois da outra (Cascata).
> - **Iterativo:** Repete as etapas pra refinar.
> - **Evolucionário:** Cada volta gera uma versão funcional nova (Incremental).