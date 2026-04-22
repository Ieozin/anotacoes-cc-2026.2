# Tema 03: Fases do Desenvolvimento de Software
**Data:** 22/04/2026 | **Status:** Concluído

## Engenharia de Requisitos
É a fase de descobrir "O QUE" o sistema vai ser. 
**Técnicas principais:** Etnografia (observar o usuário), JAD (reuniões em grupo), Brainstorming e Entrevistas.
**O contrato:** A etapa de levantamento gera o **Documento de Requisitos**, q define o escopo.

## Projeto (Design)
É o "COMO" vou fazer. Aqui a gente diminui a abstração (sai do desenho e vai pra técnica).
- **Arquitetura MVC:** Model (dados), View (tela), Controller (meio de campo).
- **ORM:** Traduzir as classes do código pra tabelas do banco de dados.

## Qualidade e Testes
Teste serve pra achar erro, não pra provar q o código tá perfeito.
- **Unitário:** Testa a função isolada.
- **Integração:** Testa se os módulos conversam.
- **Validação:** Alpha (no dev) e Beta (no cliente).
- **Regressão:** Testar de novo o que já funcionava pra garantir q a alteração nova não quebrou nada.

## Manutenção vs Reengenharia
- **Manutenção:** Corrigir bugs ou pequenas melhorias. É a fase mais longa do ciclo de vida.
- **Reengenharia:** Quando o código tá tão ruim/antigo q compensa mais reconstruir do q consertar.

---

## Exercícios de Fixação (Lista 2)
- **Defeito em produção:** A melhor saída é o *hotfix* (corrigir a versão atual e depois levar a correção pra versão em desenvolvimento).
- **Manutenibilidade:** É o principal motivo pra seguir todas as etapas do processo. Garante q outro dev entenda seu código depois.
- **Segurança vs Usabilidade:** O login ideal é o equilíbrio (tipo biometria + senha).
- **Fatoração:** Significa decompor um problema grande em partes menores.