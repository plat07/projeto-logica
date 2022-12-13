programa
{
// Escreva um programa para gerenciar as médias das notas de 20 estudantes. 
//O programa deve ler o número de identificação, as 3 notas obtidas por um estudante nas 3
//verificações de aprendizagem e a média dos exercícios que fazem parte da avaliação.
//Em seguida, calcular a média de aproveitamento, usando a fórmula seguinte:

//MA = (nota1 + 2 ∙ nota2 + 3 ∙ nota3 + ME)/7.

//A atribuição dos conceitos obedece a tabela abaixo:
//Média de aproveitamento Conceito
//Maior ou igual 9,0 e menor ou igual a 10,0 A
//Maior ou igual a 7,5 e menor que 9,0 B
//Maior ou igual a 6,0 e menor que 7,5 C
//Maior ou igual a 4,0 e menor que 6,0 D
//Menor que 4,0 E

//Apos a leitura dos dados, o programa deve, por meio de um menu, executar as seguintes etapas:
//a) Cadastrar as médias dos 20 estudantes.
//b) Apresentar o número de estudantes que tiveram o aproveitamento com conceitos A e B.
//c) Apresentar o número de estudantes que tiveram o aproveitamento com conceitos C e D.
//d) Apresentar o número de estudantes que tiveram o aproveitamento com conceito abaixo de D.
//e) Apresentar o número de estudantes que tiveram o aproveitamento com conceito acima de B.
//f) Sair do programa.

/* IMPLEMENTAÇÕES PENDENTES:
 	* não deixar o usuário inserir notas menores que 0 ou maiores que 10
*/

	funcao inicio()
	{
		//real vetorMedias[20] = {0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1}
		real vetorMedias[3] = {0.1, 0.1, 0.1}  // variável para testes -EXCLUIR FUTURAMENTE-
		real mediaAproveitamento, nota1, nota2, nota3, mediaExercicios
		inteiro estudantesAeB = 0, estudantesCeD = 0, estudantesE = 0, estudantesA = 0
    		inteiro id, contador, opcao
    		cadeia conceito
		
    		faca {
    			menu()
    			leia(opcao)

    			escolha(opcao) {
    				caso 1: {
    					para (contador = 1; contador <= 3; contador ++) {
    						limpa()
    						escreva("\nInsira o número de identificação do aluno: ")
    						leia(id) 
    						limpa()					
						escreva("Qual a 1º nota do aluno? ")
    						leia(nota1)
    						escreva("\nQual a 2º nota do aluno? ")
    						leia(nota2)
    						escreva("\nQual a 3º nota do aluno? ")
    						leia(nota3)
    						escreva("\nQual a média dos exercícios do aluno? ")
    						leia(mediaExercicios)
    						limpa()

    						//O laço abaixo fará o controle das notas, para que o usuário não insira notas menores que 0 ou maiores que 10
    						enquanto (nota1 < 0 ou nota2 < 0 ou nota3 <0 ou mediaExercicios < 0 ou nota1 > 10 ou nota2 > 10 ou nota3 > 10 ou mediaExercicios > 10) {	
    							escreva("O sistema só aceitará notas entre 0 e 10\n")
    							escreva("Qual a 1º nota do aluno? ")
    							leia(nota1)
    							escreva("\nQual a 2º nota do aluno? ")
    							leia(nota2)
    							escreva("\nQual a 3º nota do aluno? ")
    							leia(nota3)
    							escreva("\nQual a média dos exercícios do aluno? ")
    							leia(mediaExercicios)
    							limpa()
						}
    					
    						mediaAproveitamento = calcularMediaDeAproveitamento(nota1, nota2, nota3, mediaExercicios)
    						//o indice é [contador - 1] pois os vetores iniciam do indice 0 e não do indice 1 (como o contador)
    						vetorMedias[contador - 1] = mediaAproveitamento
    						conceito = determinarConceito(mediaAproveitamento)
    						/*As quatro linhas de código a seguir vão comparar conceito e incrementar X variável.
    					  	Para exibição nos demais itens de menu de opções.*/
    						incrementarAeB(conceito, estudantesAeB)
    						incrementarCeD(conceito, estudantesCeD)
    						contarE(conceito, estudantesE)
    						contarA(conceito, estudantesA)
					}
    					pare
    				} caso 2: {
    					limpa()
    					escreva("Número de estudantes que tiveram aproveitamento com conceitos A e B: ", estudantesAeB)
    					pare
    				} caso 3: {
    					limpa()
    					escreva("Número de estudantes que tiveram aproveitamento com conceitos C e D: ", estudantesCeD)
    					pare
    				} caso 4: {
    					limpa()
    					escreva("Número de estudantes que tiveram aproveitamento com conceitos abaixo de D: ", estudantesE)
    					pare
    				} caso 5: {
    					limpa()
    					escreva("Número de estudantes que tiveram aproveitamento com conceitos acima de B: ", estudantesA)
    					pare
    				} caso 0: {
    					limpa()
   					escreva("Programa finalizado.")
    					pare
    				} caso contrario: {
    					limpa()
    					escreva("\nOpção inválida\n\n")
    				}
    			}
    		 
		} enquanto (opcao != 0)

    	}
	

	funcao menu() {
		//Procedimento para exibição do menu de opções
		escreva("\n\n====================================\n")
		escreva("========== MENU DE OPÇÕES ==========\n")
		escreva("====================================\n")
		escreva("1. Cadastrar médias (20 estudantes.)\n")
		escreva("2. Número de estudantes que tiveram o aproveitamento com conceitos A e B\n")
		escreva("3. Número de estudantes que tiveram o aproveitamento com conceitos C e D\n")
		escreva("4. Número de estudantes que tiveram o aproveitamento com conceito abaixo de D\n")
		escreva("5. Número de estudantes que tiveram o aproveitamento com conceito acima de B\n")
		escreva("0. Sair do progama\n\n")
	}

	funcao real calcularMediaDeAproveitamento(real nota1, real nota2, real nota3, real mediaExercicios){
		/*Função para o calculo da Media de aproveitamento.
		  Recebe 4 parâmetros: nota 1, nota 2, nota 3 e media dos exercicios e retorna a media do aproveitamento do estudante.*/
		real ma
		
		ma = (nota1 + nota2 * 2 + nota3 * 3 + mediaExercicios)/7
		
		retorne ma
	}

	funcao cadeia determinarConceito(real mediaAproveitamento) {
		/*Função para determinar o conceito do estudante
		  Recebe 1 parâmetro: Media de aproveitamento e retorna o conceito do estudante*/
		cadeia conceito
		
		se (mediaAproveitamento >= 9.0 e mediaAproveitamento <= 10.0){
			conceito = "A"
		} senao se (mediaAproveitamento >= 7.5 e mediaAproveitamento < 9.0) {
			conceito = "B"
		} senao se (mediaAproveitamento >= 6.0 e mediaAproveitamento < 7.5) {
			conceito = "C"
		} senao se (mediaAproveitamento >= 4.0 e mediaAproveitamento < 6.0) {
			conceito = "D"
		} senao se (mediaAproveitamento < 4.0) {
			conceito = "E"
		} senao {
			conceito = "erro"
		}
		
		retorne conceito
	}

	funcao incrementarAeB (cadeia conceito, inteiro &a) {
		//procedimento para gerenciar o número de aproveitamentos A e B
		se (conceito == "A" ou conceito == "B") {
			a += 1
		}
	}

	funcao incrementarCeD (cadeia conceito, inteiro &a) {
		//procedimento para gerenciar o número de aproveitamentos C e D
		se (conceito == "C" ou conceito == "D") {
			a += 1
		}
	}

	funcao contarE (cadeia conceito, inteiro &a) {
		//procedimento para gerenciar o número de aproveitamentos E
		se (conceito == "E") {
			a += 1
		}
	}

	funcao contarA (cadeia conceito, inteiro &a) {
		//procedimento para gerenciar o número de aproveitamentos A
		se (conceito == "A") {
			a += 1
		}
	}

}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1754; 
 * @DOBRAMENTO-CODIGO = [116, 129, 139, 161, 168, 175, 182];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */