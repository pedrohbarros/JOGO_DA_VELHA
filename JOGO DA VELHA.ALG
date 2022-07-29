Algoritmo "jogo da velha"
// Disciplina   : Construção de Algoritimos
// Professor   : Eugenio da Silva
// Descrição   : Jogo da velha com JXJ ou JXM
// Autor(a)    : Evandro Luiz Linhares Guimarães de Oliveira e Pedro Henrique Barros Nascimento
procedimento tabela()
inicio
   para i de 1 ate 3 faca
      para j de 1 ate 3 faca
         cont <- cont + 1
         jogo[i,j] <- numpcarac(cont)
      fimpara
   fimpara
fimprocedimento

procedimento montarjogo()
inicio
   escreval("===================")
   escreval("  Jogo da Velha")
   escreval("+-----+-----+-----+")
   para i de 1 ate 3 faca
      para j de 1 ate 3 faca
         escreva("| ")
         escreva(jogo[i,j]:4)
      fimpara
      escreva("|")
      escreval()
      escreval("+-----+-----+-----+")
   fimpara
   escreval("===================")
fimprocedimento

procedimento Jogar()
inicio
   x <- "X"
   vencedor <- falso
   vez <- 0
   par <- 1
   repita
      escreval("Digite um numero para ", x ,": ")
      leia(op)
      se (op >0) e (op <10) entao
         se (op >0) e (op <4) entao
            L <- 1
            se ((jogo[L,op] = "X") ou (jogo[L,op] = "O")) entao
               escreval("Essa posição ja etsá preenchida")
               escreval("Aperte enter para continuar")
               leia(a)
            senao
               jogo[L,op] <- x
               codrep()
            fimse

         senao
            se (op >3) e (op <7) entao
               L <- 2
               se ((jogo[L,op - 3] = "X") ou (jogo[L,op - 3] = "O")) entao
                  escreval("Essa posição ja etsá preenchida")
                  escreval("Aperte enter para continuar")
                  leia(a)
               senao
                  jogo[L,op - 3] <- x
                  codrep()
               fimse
            senao
               L <-3
               se ((jogo[L,op - 6] = "X") ou (jogo[L,op - 6] = "O")) entao
                  escreval("Essa posição ja etsá preenchida")
                  escreval("Aperte enter para finalizar")
                  leia(a)g
               senao
                  jogo[L,op - 6] <- x
                  codrep()
               fimse
            fimse
         fimse
      senao
         escreval("Opção inválida")
         escreval("Aperte enter para continuar")
         leia(a)
      fimse
      limpatela
      montarjogo()
   ate((vencedor = verdadeiro) ou (vez = 9))
   se(vencedor = verdadeiro)entao
      escreval()
      escreval()
      escreval("         \      / |¯¯¯ |\   | |¯¯¯¯| |¯¯¯ |    |")
      escreval("\0/       \    /  |    | \  | |      |    |    |      \0/ ")
      escreval(" |         \  /   |¯¯¯ |  \ | |      |¯¯¯ |    |       | ")
      escreval("/ \         \/    |___ |   \| |____| |___ |____|      / \")
      escreval("O jogador que estava com '",x,"' venceu")
   senao
      escreval("Deu velha!!!")
      escreval()
      escreval()
      escreval("\      / |¯¯¯ |    |   | |¯¯¯¯|")
      escreval(" \    /  |    |    |___| |____|")
      escreval("  \  /   |¯¯¯ |    |   | |    |")
      escreval("   \/    |___ |___ |   | |    |")
   fimse
fimprocedimento

procedimento codrep()
inicio
   vencedor <- verificarVencedor()
   vez <- vez + 1
   se (vencedor = falso) entao
      se (vez % 2 <> 0) entao
         x <- "O"
      senao
         x <- "X"
      fimse
   fimse
fimprocedimento

funcao verificarVencedor() : logico
var
   vence : logico
inicio
   vence <- falso
   para i de 1 ate 3 faca
      se ((jogo[i,1] = jogo[i,2]) e (jogo[i,2] = jogo[i,3])) entao
         vence <- verdadeiro
      fimse
   fimpara
   para i de 1 ate 3 faca
      se ((jogo[1,i] = jogo[2,i]) e (jogo[2,i] = jogo[3,i])) entao
         vence <- verdadeiro
      fimse
   fimpara

   se ((jogo[1,1] = jogo[2,2]) e (jogo[2,2] = jogo[3,3])) entao
      vence <- verdadeiro
   fimse
   se ((jogo[1,3] = jogo[2,2]) e (jogo[2,2] = jogo[3,1])) entao
      vence <- verdadeiro
   fimse

   retorne vence
fimfuncao

procedimento Jogar1()
inicio
   x <- "X"
   vencedor <- falso
   vez <- 0
   par <- 1
   repita
      se ( x = "O")entao
         op <- randi(9) + 1
      senao
         escreval("Digite um numero para ", x ,": ")
         leia(op)
      fimse
      se (op >0) e (op <10) entao
         se (op >0) e (op <4) entao
            L <- 1
            se ((jogo[L,op] = "X") ou (jogo[L,op] = "O")) entao
               escreval("Essa posição ja etsá preenchida")
               escreval("Aperte enter para continuar")
            senao
               jogo[L,op] <- x
               codrep()
            fimse
         senao
            se (op >3) e (op <7) entao
               L <- 2
               se ((jogo[L,op - 3] = "X") ou (jogo[L,op - 3] = "O")) entao
                  escreval("Essa posição ja etsá preenchida")
                  escreval("Aperte enter para continuar")
               senao
                  jogo[L,op - 3] <- x
                  codrep()
               fimse
            senao
               L <-3
               se ((jogo[L,op - 6] = "X") ou (jogo[L,op - 6] = "O")) entao
                  escreval("Essa posição ja etsá preenchida")
                  escreval("Aperte enter para continuar")

               senao
                  jogo[L,op - 6] <- x
                  codrep()
               fimse
            fimse
         fimse
      senao
         escreval("Opção inválida")
         escreval("Aperte enter para continuar")
         leia(a)
      fimse
      limpatela
      montarjogo()
   ate((vencedor = verdadeiro) ou (vez = 9))
   se(vencedor = verdadeiro)entao
      escreval()
      escreval()
      escreval("         \      / |¯¯¯ |\   | |¯¯¯¯| |¯¯¯ |    |")
      escreval("\0/       \    /  |    | \  | |      |    |    |      \0/ ")
      escreval(" |         \  /   |¯¯¯ |  \ | |      |¯¯¯ |    |       | ")
      escreval("/ \         \/    |___ |   \| |____| |___ |____|      / \")
      escreval("O jogador que estava com '",x,"' venceu")

   senao

      escreval("Deu velha!!!")
      escreval()
      escreval()
      escreval("\      / |¯¯¯ |    |   | |¯¯¯¯|")
      escreval(" \    /  |    |    |___| |____|")
      escreval("  \  /   |¯¯¯ |    |   | |    |")
      escreval("   \/    |___ |___ |   | |    |")
      fimse
fimprocedimento

Var
   es, par,vez, L, op, i, j, cont : inteiro
   jogo : vetor[1..3,1..3] de caractere
   x, a : caracter
   vencedor : logico


Inicio
   cont <- 0
   escreval("                              JOGO DA")
   escreval()
   escreval("                 \      / |¯¯¯ |    |   | |¯¯¯¯|")
   escreval("                  \    /  |    |    |___| |____|")
   escreval("                   \  /   |¯¯¯ |    |   | |    |")
   escreval("                    \/    |___ |___ |   | |    |")
   escreval()
   escreval("                    Selecione como deseja jogar")
   escreval("                   Jogar contra MAQUINA Digite 1")
   escreval("                    Jogar contra HUMANO Digite 2")
   escreval("                           SAIR Digite 3")
   escreval()
   escreva("                                  ")
   leia(es)
   se (es = 2) entao
      limpatela
      tabela()
      montarjogo()
      Jogar()
   senao
      se(es = 1)entao
         limpatela
         tabela()
         montarjogo()
         Jogar1()
      senao
         se(es = 3)entao
         senao
            escreval("Opção invalida")
            escreval("Aperte enter para encerrar!")
            leia(a)
         fimse
      fimse
   fimse
Fimalgoritmo