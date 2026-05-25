# Tema 01 e 02: Introdução e Metodologia RAD
**Data:** 25/05/2026 | **Status:** Concluído

## 1. O Roadmap da Disciplina
O mercado atual não tem tempo para esperar anos por um software. O foco desta matéria é juntar a **Metodologia RAD (Rapid Application Development)** com o **Python** para criar sistemas rápidos, iterativos e com interface gráfica. 
Vamos passar por: manipulação de arquivos, integração com Banco de Dados e criação de Interfaces Gráficas (GUI).

## 2. O que é RAD (Rapid Application Development)?
Criada por James Martin em 1991, o RAD é uma abordagem de desenvolvimento de software que **prioriza a prototipagem rápida e o feedback contínuo do usuário** em vez de um planejamento rígido e engessado (como o antigo modelo Cascata/Waterfall).

- **O foco:** Entregar partes funcionais do sistema em ciclos curtos (geralmente entre 60 e 90 dias).
- **O segredo:** O usuário participa ativamente do processo, testando e validando as telas e funções o tempo todo.

## 3. As 4 Fases do RAD
Diferente dos modelos tradicionais que têm dezenas de etapas, o RAD resume o ciclo em 4 fases dinâmicas:

1. **Planejamento de Requisitos:** TI, gestores e usuários se reúnem para definir o escopo geral, as restrições e os requisitos do sistema. É um planejamento "grosso", sem perder meses documentando detalhes irrelevantes.
2. **Design do Usuário:** A fase mais importante. Ocorre em um ciclo contínuo onde os desenvolvedores criam **protótipos** e os usuários testam e dão feedback na hora. O modelo é refinado até o usuário aprovar.
3. **Construção:** Como grande parte dos problemas já foi resolvida na prototipagem, a construção do código final é rápida. Usa-se muita automação, frameworks e geradores de código.
4. **Transição (Implementação):** Testes finais, conversão de dados, treinamento dos usuários e a virada de chave para o sistema novo entrar em produção.

## 4. Quando USAR e quando NÃO USAR o RAD

| Cenário | Usar o RAD? | Por quê? |
| :--- | :--- | :--- |
| **Sistemas Modulares** | ✅ SIM | Permite dividir o projeto em pedaços e entregar rápido. |
| **Prazos Curtos** | ✅ SIM | É feito exatamente para entregas rápidas (ex: e-commerce, automação interna). |
| **Usuário Engajado** | ✅ SIM | Sem o feedback constante do cliente, a fase de *Design do Usuário* não funciona. |
| **Sistemas Críticos** | ❌ NÃO | Softwares de aviação, controle médico ou usinas nucleares exigem zero margem de erro e testes exaustivos. O RAD foca na velocidade. |
| **Sistemas Monolíticos** | ❌ NÃO | Se o sistema não pode ser quebrado em módulos independentes, o ciclo rápido do RAD falha. |

## 5. Por que o Python é o rei do RAD?
O RAD exige ferramentas que não atrapalhem a velocidade do desenvolvedor. O Python brilha nesse cenário por vários motivos:
- **Sintaxe Limpa e Simples:** Escreve-se menos código para fazer a mesma coisa que em Java ou C++.
- **Tipagem Dinâmica e Linguagem Interpretada:** Não precisa compilar o código inteiro a cada mudança, agilizando os testes.
- **Ecossistema Gigante (Baterias Inclusas):** Tem framework pronto pra tudo. Precisa de Web? *Django, Flask*. Precisa de Interface Gráfica? *Tkinter, PyQt*. Precisa de manipulação de dados pesada? *Pandas, NumPy*.

## Pontos de Atenção
> **⚠️ Pegadinha de Prova (RAD vs Cascata):** No modelo Cascata, o usuário só vê o sistema pronto no final do projeto. No RAD, o usuário interage com o sistema desde a fase 2 (Design) através de protótipos funcionais.
> **⚠️ Custo e Equipe:** O RAD exige desenvolvedores experientes e ferramentas avançadas (frameworks, geradores de código). Não é uma metodologia barata e não funciona com equipes desmotivadas ou clientes ausentes.