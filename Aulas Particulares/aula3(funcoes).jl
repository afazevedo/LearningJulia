#=
Aula 3: Funções (Parte 1)
Linguagem: Julia
=#

#= Me responda essa pergunta: Você saberia fazer um algoritmo para calcular a raiz quadrada de um número?
Bom, não são algoritmos tão triviais para se implementar.
Mas e se você precisar descobrir a raiz quadrada de um número o que fazer?
Já existem algoritmos que executam essas operações. O que precisamos é apenas solicitar a execução
desses algoritmos dentro do nosso. Esse tipo de algoritmo que solicitamos
a execução de dentro do nosso algoritmo são chamados de funções (ou procedimentos caso não retornem um resultado).
=#

#=As funções (functions), também conhecidas como "sub-rotinas",
são muito utilizadas em programação. Um dos grandes benefícios
é não precisar copiar o código todas as vezes que precisar executar aquela operação,
além de deixar a leitura do código mais intuitiva.
No exemplo anterior, caso precisássemos descobrir a raiz quadrada de 10 números,
bastaria chamar a função que calcula a raiz quadrada 10 vezes.
=#

# Nesse curso, já vimos algumas funções integradas do Julia, como por exemplo:

typeof(32)

#=Essa função tem o nome "typeof" e ela, tem como resultado nos mostrar o tipo de qualquer coisa
que coloquemos entre os parêntesis, que chamaremos de argumento ou parâmetro=#

#=Observe que, ao chamar essa função "typeof", eles nos retorna um resultado chamado "Int64".
Podemos então, armazenar esse valor em uma variável:=#

tipo = typeof(32)
println(tipo)

#=Mas como criar nossas próprias funções? Iremos usar o "function" pra definir uma função,
diremos o nome dela e os parâmetros, como no exemplo: =#

function quadrado(x)
    resultado = x*x
end

#=Criamos aqui uma função chamada "quadrado", que toma como parâmetro um número x qualquer,
calcula e calcula x ao quadrado. Porém, caso não chamemos a função passando o número que queremos,
ela será apenas um conjunto de regras. Como "typeof", faremos:
=#

quadrado(3)

#Mas o que acontece se armazenarmos em uma variável o resultado da função, como fizemos com typeof?

resposta = quadrado(3)
println(resposta)

#Repare que a variável resposta deu "nothing", isto é, não houve nenhum "retorno" do nosso cálculo
#Pra isso, usaremos o "return", para que possamos ter acesso a esse valor fora da função.

function quadrado(x)
    resultado = x*x
    return resultado
end

resposta = quadrado(3)
println(resposta)


#Mas, podemos ter funções sem retorno, como por exemplo, uma função que apenas escreva na tela

function sinal(x)
    if x > 0
        println("positivo")
    else
        println("negativo")
    end
end

sinal(3)

#=
PARÂMETROS
Funções podem ou não receber parâmetros.
Iremos ver um exemplo aqui:
=#

function hello()
    println("Hello World!")
end

hello()

#As vezes, é útil termos múltiplos retornos em uma função, como por exemplo:

function divisivel(x,y)
    if x % y == 0
        return true
    else
        return false
    end
end

resultado = divisivel(4,2)


#Exercícios

#=Exercício 1: Faça uma função que determina se um número é par ou ímpar.
Use o % para determinar o resto de uma divisão. =#

#=Exercício 2:
Reformule a questão de calcular a area de um círculo utilizando o conceito de função.
=#

#=Exercício 3:
Reformule a questão feita onde se monta uma calculadora,
criando uma função chamada `calculadora`, onde a mesma terá como parâmetro
a operação (string), e dois números (float), e irá retornar o resultado da mesma.
=#

#=Exercício 4: (Desafio!)
Crie uma função que receba 3 valores (a, b e c) inteiros e calcula as raízes da fórmula de Bhāskara.
Qualquer equação do segundo grau se dá por: ax^2 + bx + c
A função deve calcular delta, verificar as condições de delta e
retornar o x encontrado da fórmula.
Obs: para tirar raiz quadrada, basta usar a função "sqrt()"
=#
