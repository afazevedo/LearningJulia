#=
Aula 5: Loops
Linguagem: Julia
=#

#=
Iterações
Falaremos aqui sobre a capacidade de executar um bloco de instruções repetidamente.
Existem duas estruturas de repetição em Julia: For e While
=#

#Mas antes disso, vamos aprender um pouco mais sobre atribuição de variáveis
#=Pode ser que você já tenha descoberto que é permitido fazer mais de uma atribuição
para a mesma variável. Uma nova atribuição faz uma variável existente referir-se
a um novo valor (e deixar de referir-se ao valor anterior). =#

x = 5
x = 7
x

#A primeira vez que exibimos x, seu valor é 5; na segunda vez, seu valor é 7.
#=
Como em Julia se usa o sinal de igual (=) para atribuição,
é tentador interpretar uma afirmação como a = b como uma
proposição matemática de igualdade; Mas esta é uma interpretação equivocada.

Em primeiro lugar, a igualdade é uma relação simétrica e a atribuição não é.
Por exemplo, na matemática, se a=7 então 7=a. Mas em Julia, a instrução a = 7
é legal e 7 = a não é.
=#

a = 5
b = a    # a e b agora são iguais
a = 3    # a e b não são mais iguais
b


#=Atualização de uma variável
Um tipo comum de reatribuição é uma atualização, onde o novo
valor da variável depende do velho.
=#

x = 3
x = x + 1 #Pegue o valor atual de x, acrescente um, e então atualize x para o novo valor.
x

#=Note que: sempre teremos que inicializar a variável antes de somar um valor a ela.
Atualizar uma variável acrescentando 1 chama-se incremento; subtrair 1 chama-se decremento.
=#


#=
Instrução Enquanto (While)
Os computadores muitas vezes são usados para automatizar tarefas repetitivas.
Em um programa de computador, a repetição também é chamada de iteração.
Apresentaremos a seguir a estrutura while, que quer dizer "enquanto".
=#

n = 0
while n < 4
    global n = n + 1
    println(n)
end

#= Nesse exemplo, utilizamos o while para imprimir números de 1 até 4.
A leitura a se fazer aqui é:
n inicializa com o valor zero. Enquanto n for estritamente menor que 4, faça:
incremente n e imprima na tela o valor de n.

O bloco de código entre o while e o end será repetido 4 vezes. A instrução depende de uma
expressão booleana, uma condição de parada. Nesse caso, irá parar de repetir o bloco
quando n >= 4, isto é, quando a expressão for falsa.
=#

#É muito utilizado quando não se sabe quantas vezes iremos repetir.
#O próximo exemplo irá mostrar melhor isso:

op = 0
while true
    println("Bem vindo ao menu!")
    println("Digite 1 para escolher imprimir na tela olá!")
    println("Digite 2 para escolher sair do programa")
    op = input("\n")
    if op == "2"
        break
    end
end


#=Repetição Simples (For)
Esse tipo de repetição é usado para iterar em uma lista de elementos, ou itens de um array, etc.
Iremos aqui ver algumas possibilidades de uso.
=#

for n in 1:4
    println(n)
end

#=
A leitura é: para cada n variando no intervalo de 1 a 4 faça
    imprimir(n)
fim

Repare que: n é uma variável que foi definida. Poderia ser qualquer outra variável.
O que tive entre o for e o end, será o bloco de código que irá se repetir.
Como estamos variando n de 1 a 4, esse bloco se repetirá 4 vezes. A principio,
começa-se com n=1. Depois de rodar o bloco, há um incremento e n passa a ser dois, assim por diante.
=#

#Podemos também variar também em cima de um array, como por exemplo:

for i in [1, 5, 22]
    println(i)
end

#= Perceba que nesse exemplo, i está variando nos elementos da lista.
Poderíamos também variar entre os índices de um array, como por exemplo:
=#

#Nesse caso, estamos fazendo i variar naquela lista de valores.
#A estrutura irá se repetir 3 vezes, que é o tamanho da lista

#O próximo exemplo mostra como percorrer um array pelos índices

lista = [1,5,22]
for i in 1:length(lista)
    println(lista[i])
end

#=
Como i assumirá valores de 1 a 3, podemos acessar os elementos do array pelos índices
da variável que está iterando.
=#

#E se quisermos utilizar o for para fazer um somatório notas?


notas = [5, 6, 7, 8, 7]

sum = 0
for i in notas
    global sum = sum + i
end
sum

#ou, podemos percorrer pelos índices

sum = 0
for i in 1:length(notas)
    global sum = sum + notas[i]
end
sum

#=
Repetição simples encadeada
Vimos na outra aula arrays multidimensionais. E se agora quisermos percorrer uma matriz?
=#

#Criamos uma matriz aleatória com valores no intervalo de 1 a 10. Com 4 linhas e 3 colunas.
m=4
n=3
matrix = rand(1:10, m,n)

for i in 1:m
    for j in 1:n
        println(matrix[i,j])
    end
end

#=
Observe que nesse caso, para cada i variamos j n vezes. E assim, podemos percorrer
os valores de uma matriz. Para deixar melhor formatado, podemos fazer:
=#

for i in 1:m
    for j in 1:n
        print(matrix[i,j], " ")
    end
    print("\n")
end


#=Exercícios

Exercício 1

Desenvolva um gerador de tabuada, capaz de gerar a tabuada de qualquer número inteiro entre 1 a 10.
O usuário deve informar de qual numero ele deseja ver a tabuada.
A saída deve ser conforme o exemplo abaixo:
Tabuada de 5:
5 X 1 = 5
5 X 2 = 10
...
5 X 10 = 50


Exercício 2
Faça o exercício da calculadora utilizando a estrutura while para criar um menu, onde a pessoa possa escolher que operação fazer.
E também, escolher quando sair do menu.


Exercício 3
Descreva passo a passo o que o programa está fazendo nesses 3 casos:

3.1 -
j = 0
for i in 1:5
    j = j + i
end

3.2-
j = 0
for i in [1,2,3,4,5]
    j = j + i
end

3.3-
j=1
for i in 1:5
    j = j + j
end


Exercício 4
Escreva uma função chamada maior que tenha como argumento um array de números.
A função deve retornar o menor valor entre eles.


=#
