@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Libros'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

@Metadata.allowExtensions: true

define view entity zcds_libros_4194
  as select from    ztb_libros_4194   as Libros
    inner join      ztb_catego_4194   as Categorias on Libros.bi_categ = Categorias.bi_categ
    left outer join zcds_clnts_l_4194 as Ventas     on Libros.id_libro = Ventas.IdLibro
  association [0..*] to zcds_clientes_4194 as _Clientes on $projection.IdLibro = _Clientes.IdLibro
{
  key Libros.id_libro  as IdLibro,
      Libros.bi_categ  as Categoria,
      Libros.titulo    as Titulo,
      Libros.autor     as Autor,
      Libros.editorial as Editorial,
      Libros.idioma    as Idioma,
      Libros.paginas   as Paginas,
      @Semantics.amount.currencyCode: 'Moneda'
      Libros.precio    as Precio,
      Libros.moneda    as Moneda,
      case
      when Ventas.Ventas < 1 then 0
      when Ventas.Ventas = 1 then 1
      when Ventas.Ventas = 2 then 2
      when Ventas.Ventas > 2 then 3
      else 0 
      end as Ventas,
      
      Categorias.descripcion as Descripcion,
      Libros.formato   as Formato,
      Libros.url       as Url,
      _Clientes
}
