# Projeto Individual 01 - Paradigmas de Programação

Este projeto foi desenvolvido pelo estudante Daniel Ferreira Schopf, do curso de Sistemas de Informação, e tem como objetivo executar uma calculadora na linguagem Haskell.

## Tabela de Seções

- [Descrição](#descrição)
- [Como Executar](#como-executar)
- [Documentação de Desenvolvimento](#documentação-de-desenvolvimento)
- [Referências](#referências)
- [Screencast](#screencast)

## Descrição

A ideia do projeto foi desenvolver um servidor de algumas funções de calculadora na linguagem declarativa Haskell, utilizando como base o programa "extra-web-random-pairs" e a plataforma "Replit". Dessa forma, o usuário usaria o link gerado pela plataforma para acessar esse servidor e poderia modificá-lo para escolher a operação e seus parâmetros.

## Como Executar

Para executar o programa, basta selecionar a opção "Run" no Replit, copiar o link gerado e acessá-lo em um navegador acrescentando um "/" no final do link.

## Documentação de Desenvolvimento

Inicialmente, como este projeto é baseado em um código pré-existente, meu foco principal foi entender como o código base funcionava e o motivo de cada biblioteca importada. A partir desse entendimento inicial, iniciei o trabalho nas "rotas" que meu programa teria e como poderia criá-las.

No início do desenvolvimento, começamos por extrair e manipular os valores de X e Y. Inicialmente, esses valores são obtidos da URL como text. Em seguida, é realizada a conversão desse text em strings e depois em valores numéricos. Isso é feito usando a função "ReadMaybe," que tenta converter as strings em números. A função "TL.Text" é usada para converter dados do tipo Text para o tipo String.

Para finalizar a operação, entramos no bloco 'case', que analisa "maybeX" e "maybeY" para verificar se a conversão para valores numéricos foi bem-sucedida (ou seja, se são do tipo "Just X, Just Y"). Se a verificação for positiva, é informado o resultado da operação (usando "let resultado = x + y"), seguido da mensagem que apresenta o resultado ao usuário. Caso a verificação seja negativa, ou seja, se "maybeX" ou "maybeY" contiverem "Nothing", entramos em "_", e uma mensagem de erro é informada ao usuário.

##### Reflexões sobre o Desenvolvimento

Refletindo sobre o processo de desenvolvimento, enfrentei duas principais dificuldades:

1. Compreensão Inicial das Bibliotecas: Como em todas as linguagens de programação, o início é um pouco complicado. Além disso, o uso de novas bibliotecas dificultou um pouco mais esse entendimento. No entanto, com pesquisas sobre as bibliotecas e os conceitos de Haskell e analise do código base, consegui compreender relativamente bem.

2. Dificuldades com a Plataforma: Também enfrentei problemas relacionados à plataforma Replit, pois ela limitou o desenvolvimento devido a problemas de memória RAM que a própria plataforma disponibiliza. Essa limitação afetou o andamento do projeto pois não foi possível fazer algo mais elaborado, já que o código quebrava devido ao erro.

## Referências

As principais fontes de consulta foram:

- [Wiki Haskell](https://wiki.haskell.org/Haskell)
- [Zvon - Haskell](http://www.zvon.org)
- [Repositório do Scotty no GitHub](https://github.com/scotty-web/scotty)
- [Página do Scotty no Hackage](https://hackage.haskell.org/package/scotty)

Com o auxílio dessas fontes, analisei códigos, pesquisei funções que considerei interessante e busquei aprender como implementar o que tinha em mente. Além dessas fontes, também consultei o programa "extra-web-random-pairs" já que ele foi usado como base para o meu projeto.


## Screencast

Para acessar o Screencast do projeto, acesse o link em seguida:

