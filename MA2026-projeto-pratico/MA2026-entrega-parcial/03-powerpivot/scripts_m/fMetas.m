// Consulta fMetas - Código M Oficial
let
    Fonte = Excel.Workbook(File.Contents("C:\CafeData\dados_brutos\metas_mensais.xlsx"), null, true),
    Metas_Sheet = Fonte{[Item="Metas",Kind="Sheet"]}[Data],
    CabecalhosPromovidos = Table.PromoteHeaders(Metas_Sheet, [PromoteAllScalars=true]),
    DespivotarColunas = Table.UnpivotOtherColumns(CabecalhosPromovidos, {"Cod_Filial", "Filial"}, "AnoMes", "Meta"),
    TipoMeta = Table.TransformColumnTypes(DespivotarColunas, {{"Meta", type number}}, "pt-BR"),
    AddMesInicio = Table.AddColumn(TipoMeta, "Mes_Inicio", each Date.FromText([AnoMes] & "-01"), type date)
in
    AddMesInicio
