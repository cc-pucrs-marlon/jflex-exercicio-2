# Analisador Léxico e Sintático
## Alunos: Marlon Baptista de Quadros

Tokens Reconhecidos:
G = ({data, prova, ident, matr, num, '(', ')', ','}, {ARQ, CAB, DADOS}, P, ARQ)

Linguagem reconhecida:
P : { ARQ -> ARQ data CAB DADOS
          | data CAB DADOS
      CAB -> prova ident
          | ident ident
      DADOS -> ( matr, num ) DADOS
          | ( matr, num )
    }
