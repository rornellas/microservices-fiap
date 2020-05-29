# language: pt
@venda_para_loja
Funcionalidade: Venda de produtos para Loja
  Descrição da funcionalidade, preferencialmente atrelando a feature ao valor gerado para a organização

  @verificar_disponibilidade_produto
  #Scenario Outline: definido no Workshop junto com área de negócios
  Esquema do Cenario: Cliente quer verificar disponibilidade de um produto
    Dado Que cliente <login> VISITA a pagina do site com a senha <pass> como <tipo Visita>
    Quando O cliente pesquisa por um produto <produto>
    Entao Deve ser consultado o estoque do produto <produto>
    E Retornar a quantidade de Produtos <produto> Disponiveis em estoque de cada loja: <resultado esperado>
    Exemplos:
    # Precisam ficar entre "aspas" para dar match na regex
        | login     | pass       | tipo Visita           | produto   | resultado esperado                |
        | "usuario" | "teste"    | "Visitante"           | "Prod 1"  | "Loja 1 tem 3 unidades do Prod 1" |
        | "usuario" | "senha"    | "Usuario autenticado" | "Prod 2"  | "Loja 1 tem 5 unidades do Prod 2" |
        | "usuario" | "test"     | "Visitante"           | "Prod 3"  | "Loja 2 tem 2 unidades do Prod 3" |
        | "usuario" | "password" | "Visitante"           | "Prod 4"  | "Loja 2 tem 6 unidades do Prod 4" |
        | "usuario" | "senha"    | "Usuario autenticado" | "Prod 5"  | "Produto não disponível"          |