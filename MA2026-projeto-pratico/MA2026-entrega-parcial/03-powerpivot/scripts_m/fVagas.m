// Consulta fVagas - Pipeline Power Query (Mercado de Trabalho em TI)
let
    Fonte = Excel.Workbook(File.Contents("C:\RecrutamentoData\vagas_brutas.xlsx"), null, true),
    Vagas_Sheet = Fonte{[Item="Bruto",Kind="Sheet"]}[Data],
    Cabecalhos = Table.PromoteHeaders(Vagas_Sheet, [PromoteAllScalars=true]),
    RemoverNulos = Table.SelectRows(Cabecalhos, each [ID_Vaga] <> null and [Titulo_Vaga] <> null),
    TratarEspacos = Table.TransformColumns(RemoverNulos, {{"Empresa", Text.Trim}, {"Titulo_Vaga", Text.Trim}, {"Tecnologia_Principal", Text.Trim}}),
    CorrigirSenioridade = Table.TransformColumns(TratarEspacos, {{"Senioridade_Declarada", Text.Proper}}),
    MesclaCargos = Table.NestedJoin(CorrigirSenioridade, {"Senioridade_Declarada"}, Tab_Cargos, {"Senioridade"}, "CargoCad", JoinKind.LeftOuter),
    ExpandeCargo = Table.ExpandTableColumn(MesclaCargos, "CargoCad", {"Cod_Cargo"}),
    MesclaTech = Table.NestedJoin(ExpandeCargo, {"Tecnologia_Principal"}, Tab_Tecnologias, {"Nome_Tecnologia"}, "TechCad", JoinKind.LeftOuter),
    ExpandeTech = Table.ExpandTableColumn(MesclaTech, "TechCad", {"Cod_Tech"}),
    FiltroValidos = Table.SelectRows(ExpandeTech, each [Cod_Cargo] <> null and [Cod_Tech] <> null and [Qtd_Tecnologias_Exigidas] > 0),
    Tipagem = Table.TransformColumnTypes(FiltroValidos, {{"Qtd_Tecnologias_Exigidas", Int64.Type}, {"Salario_Oferecido", type number}}, "pt-BR"),
    AddFlagFalsoJr = Table.AddColumn(Tipagem, "Flag_Falso_Junior", each if [Cod_Cargo] = "CARG-JR" and [Qtd_Tecnologias_Exigidas] > 3 then "SIM (Falso Jr)" else "Não", type text)
in
    AddFlagFalsoJr
