@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clientes libros'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zcds_clnts_l_4194
  as select from ztb_clnts_l_4194
{

  key id_libro                    as IdLibro,
      count( distinct id_client ) as Ventas
}
group by
  id_libro;
