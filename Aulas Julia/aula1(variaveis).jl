#=
Aula 1: Variáveis, Operações e Operadores
Linguagem: Julia
=#

#=
Tradicionalmente, o primeiro programa que se escreve em uma nova linguagem chama-se “Olá Mundo!”,
porque tudo o que faz é exibir as palavras “Olá Mundo!” na tela.
Em Julia, utilizamos a função print para fazê-lo, e é da seguinte maneira:
=#

print("Olá Mundo!")

#também podemos usar o println, que é  a mesma função de cima, mas também pula uma linha

println("Olá Mundo!")

#As aspas marcam o começo e o fim do texto a ser exibido; elas não aparecem no resultado.

#=
O tipo é uma forma de classificar as informação.
Nessa sessão, iremos abordar que tipos de variáveis são possíveis de trabalhar em Julia.

Int64 - É um tipo que representa números inteiros.
Float64 - É um tipo que representa números com partes fracionárias, também chamado de ponto flutuante.
String - É um tipo que representa sequências de caracteres.

Para saber o tipo, podemos usar a função typeof()
=#
println(typeof(2))
println(typeof(42.0))
println(typeof("Hello World"))

#=
Usar apenas constantes pode ser um tanto chato.
Precisamos de uma maneira de armazenar as informações e manipular elas.
Aqui entram as variáveis. Elas servem para carregar alguma informação que você queira, podendo ser acessada pelo programa.
=#

#Exemplo:
fruta = "maçã" #variável que contém uma string
altura = 1.66 #variável que contém um número do tipo flutuante

println(fruta)
println(altura)

#Existem algumas regras pra se poder criar nomes de variáveis, mostro aqui algumas em que evitaremos:

nome = "teste"
#76nome = "teste" Errado! Não podemos começar o nome de uma variável por um número

_grande_ = 1000000
#grande@ = 1000000 Errado! Não se pode ter caracteres especiais no nome. Apenas underline

classe = "Curso de Julia"
#print = "Curso de Julia" Errado! Existem palavras-chaves utilizadas em Julia, como essa.

#=
Mas se ao invés de imprimir um texto na tela, quisermos ler uma informação dada pelo usuário?
Poderemos fazer isso utilizando a função input(), da seguinte maneira:
=#

#Exemplo:

println("Qual sua fruta favorita?") #pergunta ao usuário
fruta = input() #armazena na variável fruta o que o usuário digitar
println(fruta) #imprime na tela a fruta escolhida

#=
Temos muitas formas de imprimir variáveis. Como por exemplo:
=#
nome = input("Qual seu nome?\n")
peso = input("Qual seu peso?\n") #\n é usado para pular linha!

println("Meu nome é ", nome)
println("Tenho peso igual a ", peso)
println(nome, " tem peso ", peso)


#=
Julia possui operadores, que são símbolos especiais representando operações aritméticas de computação,
como adição e multiplicação.
Os operadores `+`, `-`, `*` e `\` executam a adição, a subtração, multiplicação e a divisão,
como nos seguintes exemplos:
=#

println(40+2)
println(35-5)
println(8*7)
println(24/2)

#=
É possível que você se sinta incomodado com o .0 nesta última operação.
Isso se deve pois em Julia entende-se que uma fração é um número do tipo ponto flutuante.
Existem diversas maneiras de fazer isso, chamamos de formatação. Mais tarde iremos ver como consertar isso.
=#

#Existem diversas maneiras de operar variáveis, aqui vai algumas:
milha = 24.2
println(milha * 3)

println(1+2)
x=3
println(x)
x = x+1
println(x)

#Para converter pontos flutuantes em um inteiro, usaremos a função trunc()

a = trunc(Int64, 3.999)
println(a)
println(typeof(a))

#Para converter inteiros em pontos flutuantes, podemos usar a função float()

b = float(32)
println(b)
println(typeof(b))

#Para converter qualquer argumento em uma string, usamos a função string()

c = string(32)
println(c)
println(typeof(c))

#E finalmente, para converter uma string em outro tipo, use a biblioteca Parses
using Parses

inteiro = parse(Int64, "32")
frac = parse(Float64, "3.999")
#Erro: palavra = parse(Int64, "Hello") pois não podemos converter hello em um número inteiro.

#Obs: Como a saída da função input é sempre uma string, é interessante fazermos a seguinte conversão:
peso = parse(Int64, input("Qual seu peso?\n")) #\n é usado para pular linha!
println(typeof(peso))

#E para consertar aquele exemplo, podemos fazer:
println(trunc(24/2))


#Exercícios

#Exercício 1: Faça um programa que peça as 4 notas e mostre a média aritmética.

#=Exercício 2: Tendo como dados de entrada a altura de uma pessoa, construa um algoritmo que calcule seu peso ideal,
usando a seguinte fórmula: (72.7*altura) - 58=#

#Exercício 3: Escreva uma programa que leia o raio de um círculo e o utiliza para calcular sua área.

#= Exerício 4: Faça um programa que pergunte quanto você ganha por hora e o número de horas trabalhadas no mês.
Calcule e mostre o total do seu salário no referido mês,
sabendo-se que são descontados 11% para o Imposto de Renda, 8% para o INSS e 5% para o sindicato.
=#
