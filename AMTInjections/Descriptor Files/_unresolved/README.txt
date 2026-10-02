Descritores que ainda nao foram reapontados para a 6.1202.4.
=============================================================

O PatchFileGenerator corre sobre "Descriptor Files\*.txt" e um tag que nao
apareca no memdump faz o PostBuild devolver erro, o que chumba o build inteiro.
Esta subpasta fica fora desse glob, por isso estes ficam de parte sem impedir
que o resto seja construido e testado.

Para cada um: o tag de 2017 nao existe nesta versao e a busca por forma (com as
derivacoes do proprio descritor a validar os candidatos) nao devolveu nenhum
candidato unico.

  ToggleIntroVideo            0 candidatos.  O tag sao 16 bytes de manobra de
                              pilha, demasiado genericos, e o pPatch fica 0CB
                              bytes a' frente -- uma distancia que nao sobrevive
                              a uma recompilacao.
  UIHideScreenNotifications   18 candidatos.  O tag e' um prologo de funcao
                              (55 8B EC 83 E4 F0 ...), que ha' aos milhares.
  UIHideECodes / ...Hook      66 candidatos.  A funcao mudou de forma: a busca
                              estreita (mov [edi+off],1 seguido do epilogo com
                              ret 000C) nao devolve nada.
  DisableECodeMapChange       0 candidatos.
  Camera*                     0 candidatos nos tres que tem tag
                              (Camera2TransOverride, CameraControlMain,
                              CameraLandingOverride).  Os outros tres nao tem
                              tag proprio e dependem desses, por isso vieram
                              atras: em particular o CameraControlMainHook
                              chamaria $code+400 sem la' estar nada escrito.

Os .asm correspondentes ficaram onde estavam.  Um simbolo exportado sem
descritor nao incomoda o gerador; o contrario e' que chumba.

O CommMain.asm continua com os "nopx 5" onde o CameraControlMainHook e o
ColorAdjustmentsHook escrevem.  Sem o hook do lado da camara ficam cinco nops,
que e' inofensivo -- o desenho ja' contava com isso.
