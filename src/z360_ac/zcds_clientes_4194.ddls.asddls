@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clientes'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

@Metadata.allowExtensions: true

define view entity zcds_clientes_4194
  as select from ztb_cliente_4194
    inner join   ztb_clnts_l_4194 on ztb_clnts_l_4194.id_client = ztb_cliente_4194.id_client
{
  key ztb_cliente_4194.id_client   as IdClient,
  key ztb_clnts_l_4194.id_libro    as IdLibro,
  key ztb_cliente_4194.tipo_acceso as TipoAcceso,
      ztb_cliente_4194.nombre      as Nombre,
      ztb_cliente_4194.apellidos   as Apellidos,
      ztb_cliente_4194.email       as Email,
      ztb_cliente_4194.url         as Url
}
