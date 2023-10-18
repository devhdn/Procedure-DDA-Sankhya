CREATE OR REPLACE PROCEDURE "STP_PROCESSARDDA_HDN"(P_CODUSU    NUMBER, -- Código do usuário logado
                                                   P_IDSESSAO  VARCHAR2, -- Identificador da execução. Serve para buscar informações dos parâmetros/campos da execução.
                                                   P_QTDLINHAS NUMBER, -- Informa a quantidade de registros selecionados no momento da execução.
                                                   P_MENSAGEM  OUT VARCHAR2 -- Caso seja passada uma mensagem aqui, ela será exibida como uma informação ao usuário.
                                                   ) AS
  FIELD_CODBARRA VARCHAR2(4000);

  -- PARÂMETROS BUSCA
  P_CODPARC    NUMBER;
  P_NUDOC      VARCHAR2(100);
  P_DTVNC      DATE;
  P_VLRDESB    FLOAT;
  P_CODPARCRAZ NUMBER;

BEGIN

  -- Os valores informados pelo formulário de parâmetros, podem ser obtidos com as funções:
  --     ACT_INT_PARAM
  --     ACT_DEC_PARAM
  --     ACT_TXT_PARAM
  --     ACT_DTA_PARAM
  -- Estas funções recebem 2 argumentos:
  --     ID DA SESSÃO - Identificador da execução (Obtido através de P_IDSESSAO))
  --     NOME DO PARAMETRO - Determina qual parametro deve se deseja obter.

  FOR I IN 1 .. P_QTDLINHAS -- Este loop permite obter o valor de campos dos registros envolvidos na execução.
   LOOP
    -- A variável "I" representa o registro corrente.
    -- Para obter o valor dos campos utilize uma das seguintes funções:
    --     ACT_INT_FIELD (Retorna o valor de um campo tipo NUMÉRICO INTEIRO))
    --     ACT_DEC_FIELD (Retorna o valor de um campo tipo NUMÉRICO DECIMAL))
    --     ACT_TXT_FIELD (Retorna o valor de um campo tipo TEXTO),
    --     ACT_DTA_FIELD (Retorna o valor de um campo tipo DATA)
    -- Estas funções recebem 3 argumentos:
    --     ID DA SESSÃO - Identificador da execução (Obtido através do parâmetro P_IDSESSAO))
    --     NÚMERO DA LINHA - Relativo a qual linha selecionada.
    --     NOME DO CAMPO - Determina qual campo deve ser obtido.
    FIELD_CODBARRA := ACT_TXT_FIELD(P_IDSESSAO, I, 'CODBARRA');
  
    -- < O TRECHO ABAIXO BUSCA OS PARÂMETROS>
    BEGIN
      SELECT DDA.CODPARC, DDA.NUMDOCTO, DDA.DTVENC, DDA.VALOR, DDA.CODPARC
        INTO P_CODPARC, P_NUDOC, P_DTVNC, P_VLRDESB, P_CODPARCRAZ
        FROM AD_INTDDA DDA;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('Caralho mesmo viu...');
    END;
  
    -- <CÓDIGO ABAIXO IRÁ REALIZAR A ASSOCIAÇÃO ENTRE O ARQUIVO E A MOVIMENTAÇÃO FINANCEIRA>       
  
    BEGIN
    
    END;
  
  END LOOP;

  -- <ESCREVA SEU CÓDIGO DE FINALIZAÇÃO AQUI> --

END;
/
