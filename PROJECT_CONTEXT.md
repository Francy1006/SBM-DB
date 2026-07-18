# PROJECT_CONTEXT.md

> **Última actualización:** 2026-07-17
>
> **Destino:** repositorio independiente `SBM-DB`
>
> **Propósito:** memoria persistente para Cursor/LLM enfocada exclusivamente
> en PostgreSQL, Flyway, DBML, schemas, relaciones e invariantes de negocio.
> No es documentación de endpoints, frontend ni prompts de IA.

---

## 1. Objetivo y ownership

`SBM-DB` administra la estructura física de SBM Suite mediante PostgreSQL y
Flyway:

- schemas, tablas y columnas;
- claves, restricciones e índices;
- triggers, funciones y vistas;
- seeds estructurales;
- migraciones versionadas.

Las APIs consumen esta estructura, pero no la administran. Los modelos Django
de dominio deben permanecer `managed = False`.

```text
SBM-DB + Flyway
→ estructura física y datos estructurales

DP-API / SBM-API
→ reglas de aplicación y mappings ORM no administrados
```

Frontera funcional:

```text
Operación normal de una marca o cliente → dp-api
Administración contractual/plataforma   → sbm-api
Estructura física para ambas APIs       → SBM-DB
```

La ubicación física de una tabla no determina por sí sola qué API es dueña de
la operación.

---

## 2. Fuentes de verdad

### 2.1 Estructura canónica

La estructura real y actualizada de la base de datos está definida en:

```text
/Users/franciscomendoza/Documents/DEV/SBM-SUITE/SBM-DB/dbdiagram/SBM-business.dbml
```

Este archivo pertenece al repositorio independiente `SBM-DB`. Toda consulta o
actualización futura de la estructura de base de datos debe partir de ese DBML;
no se debe inferir la estructura desde los modelos Django de `DP-API`.

En particular, `ditaly_pasta.price` declara los siguientes campos como
`DECIMAL(14,2)`, no como `INTEGER`:

```text
base_net_amount
net_amount
gross_amount
iva_amount
aditional_tax_amount
retention_amount
```

### 2.2 Verificación de despliegue

Para cada cambio contrastar:

1. Invariante de negocio.
2. DBML canónico de `SBM-DB` indicado arriba.
3. Scripts Flyway.
4. `flyway_schema_history` del schema.
5. PostgreSQL de la instancia inspeccionada.
6. Mappings ORM consumidores.

Reglas de interpretación:

- El DBML de `SBM-DB` es la fuente canónica del diseño estructural vigente.
- Flyway implementa la evolución física necesaria para alcanzar ese diseño.
- PostgreSQL demuestra qué está efectivamente aplicado en una instancia.
- Un script presente no implica que ya haya sido ejecutado.
- Un mapping Django actualizado no altera PostgreSQL.

No asumir que runtime, DBML y Flyway coinciden sin inspección.

---

## 3. Stack y orden de ejecución

```text
PostgreSQL 16
Flyway 10
Docker Compose
Red externa: sbm-network
```

Servicios:

```text
postgres
flyway_sbm_business
flyway_ditaly_pasta
flyway_cross
flyway_analytics
```

Orden obligatorio:

```text
postgres healthy
→ flyway_sbm_business
→ flyway_ditaly_pasta
→ flyway_cross
→ flyway_analytics
```

`ditaly_pasta` depende de objetos compartidos de `sbm_business`; cross y
analytics dependen de los schemas transaccionales.

No guardar credenciales reales en documentación o SQL versionado.

---

## 4. Schemas

Schemas contemplados por diseño o scripts disponibles:

```text
sbm_business
ditaly_pasta
accounting
analytics
public
```

Esta lista no confirma su existencia en una instancia. `sbm_business` y
`ditaly_pasta` están modelados en DBML; `accounting` es creado por cross aunque
sus tablas están sin calificar en DBML; `analytics` existe en scripts pero no
en DBML; `public` se usa para extensiones/objetos comunes.

### `sbm_business`

Conceptos compartidos y transversales:

- franquicias y estados;
- usuarios, roles, permisos y restricciones;
- menús, grupos, categorías y tipos de ítem;
- paquetes, bancos, regiones y distritos;
- módulos y tipos de registro;
- conceptos y tipos de cálculo;
- fórmulas variables;
- tipos y directivas fiscales;
- órdenes y documentación fiscal compartida.

### `ditaly_pasta`

Datos operacionales y configuraciones de la marca:

- Product, Material, Service y Catalog;
- Price y price_configuration;
- proveedores e item_configuration;
- fiscal_configuration_detail;
- configuraciones de cálculo por módulo;
- sucursales, plataformas, acuerdos y tickets;
- clientes, stakeholders y marketing.

Aunque el primer schema sea Ditaly Pasta, las configuraciones deben permitir
reglas propias de otras marcas, por ejemplo KISEKI TECH. No hardcodear tasas,
moneda o fiscalidad de una marca como regla global.

### `analytics`

Vistas y proyecciones analíticas. No debe convertirse en fuente primaria de
datos transaccionales.

### `accounting`

Modelo contable creado por `flyway_cross`: cuentas, diarios, períodos,
transacciones, asientos, cierres, reportes fiscales y enlaces documentales. El
DBML todavía no califica estas tablas con el schema `accounting`.

### `public`

Extensiones u objetos comunes de PostgreSQL. No ubicar tablas de dominio aquí
sin decisión explícita.

### Cross-schema

`flyway/sql/cross` coordina objetos que dependen de más de un schema. Sus SQL
deben calificar los schemas explícitamente.

### Inventario canónico DBML

El DBML contiene 103 tablas: 45 calificadas como `sbm_business`, 49 como
`ditaly_pasta` y 9 tablas contables sin schema explícito. No contiene objetos
del schema `analytics`.

`sbm_business`:

```text
franchise, franchise_state, franchise_configuration_type, formula_type,
menu, item_group, item_category, item_type, item_classification, package_type,
transport_type, measure_unit, provider_type, instruction_type,
permission_type, bank_account_type, district, region, fiscal_directive_type,
user_type, restriction, restriction_roles, role_permissions, permission,
role, instruction, package, bank, user, user_token, calculation_concept,
fiscal_directive, data_type, variable_formula, branch_types, status,
order_type, order, record_type, module, fiscal_document_type,
fiscal_documentation, order_fiscal_documentation, order_detail,
order_restriction
```

`ditaly_pasta`:

```text
franchise_configuration, franchise_configuration_detail, catalog,
item_configuration, item_configuration_detail, product, material, service,
provider, ticket, price, module_calculation_detail,
price_configuration_detail, price_configuration,
fiscal_configuration_detail, branches, platform, platform_detail,
company_agreements, agreements, agreement_detail, module_calculation_config,
stakeholder, marketing_campaign, campaign_detail, campaign_profile,
campaign_movement_type, campaign_movement, campaign_metric_type,
campaign_metric, campaign_movement_metric_impact, campaign_metric_variable,
marketing_platform, campaign_stakeholder, content, campaign_content,
content_asset_category, content_asset, content_asset_platform,
content_template, content_cost, content_stakeholder, content_target,
event_type, event, event_content, event_campaign, client, client_brand
```

Tablas sin schema explícito en DBML:

```text
accounting_account, accounting_journal, accounting_period,
accounting_transaction, accounting_entry, accounting_closure,
accounting_tax_report, accounting_invoice_link,
accounting_fiscal_directive_link
```

El script cross crea estas nueve tablas en `accounting`. Hasta calificar esos
nombres en DBML existe una divergencia estructural explícita: no debe asumirse
que una tabla DBML sin prefijo pertenece automáticamente a `accounting`.

Marketing, content y event están en el diseño DBML, pero no se encontraron
migraciones disponibles que creen gran parte de esas tablas. `analytics`, en
cambio, existe solo como implementación Flyway. Ambos casos son diseño e
implementación incompletamente sincronizados.

---

## 5. Disciplina Flyway

1. No usar migraciones Django para tablas de dominio.
2. Todo cambio estructural requiere un script Flyway nuevo.
3. No editar scripts ya aplicados: rompe checksums.
4. Verificar versión única por schema.
5. Mantener sintaxis PostgreSQL.
6. Preservar o transformar explícitamente datos existentes.
7. Actualizar DBML junto con el diseño objetivo.
8. Validar `flyway_schema_history` después de migrar.
9. Verificar tipos, defaults, constraints, índices y triggers reales.
10. Coordinar mappings ORM y contratos consumidores.

No ejecutar sin autorización explícita:

- `flyway clean`;
- `DROP SCHEMA` o borrado de base;
- truncados masivos;
- eliminación de históricos;
- normalizaciones automáticas de datos legacy.

La documentación antigua contiene `cleanDisabled=false`. Eso no autoriza una
limpieza. Preferir migraciones forward-only y operaciones recuperables.

Separar seeds estructurales de datos de prueba. Los scripts `TEST` requieren
control de entorno antes de producción.

### Configuración efectiva en Docker Compose

Compose monta el `flyway.conf` de cada flujo; `flyway/flyway.conf` es solo una
referencia general y no se monta en esos servicios. Los cuatro flujos usan
`baselineOnMigrate=true` y permiten `clean` mediante `cleanDisabled=false`.
Esto aumenta el riesgo operativo y no constituye autorización para limpiar.

| Flujo | `locations` configurado | `validateOnMigrate` | Observación |
|---|---|---:|---|
| `sbm_business` | `/flyway/sql` | `true` | El volumen coincide |
| `ditaly_pasta` | `/flyway/sql` | `true` | El volumen coincide |
| `cross` | `/flyway/sql` | `false` | Usa `POSTGRES_INTERNAL_PORT` y reduce validación automática |
| `analytics` | `/flyway/sql/analytics` | `false` | El volumen monta el contenido en `/flyway/sql`; la ubicación no coincide |

La discrepancia de analytics puede dejar su única migración sin descubrir. No
se debe declarar el flujo operativo hasta corregir y probar esa configuración.
Los servicios Flyway son one-shot, tienen `restart: on-failure` y dependen del
éxito del flujo anterior; una migración fallida puede reiniciarse y bloquear
toda la cadena. La red `sbm-network` es externa y debe existir antes del `up`.

### Inventario de migraciones disponibles

Hay 91 archivos versionados disponibles: 32 de `sbm_business`, 54 de
`ditaly_pasta`, 4 de `cross` y 1 de `analytics`. “Disponible” significa que el
archivo está en el repositorio; no implica que esté aplicado en una instancia.

`sbm_business` (32):

```text
V202506151816__init.sql
V202506151817__constrains.sql
V202506151819__DEFAULT_complementary.sql
V202506161240__USER_admin.sql
V202506161309__DEFAULT_restriction_permission.sql
V202506161422__DEFAULT_instruction.sql
V202506302201__USER_tables.sql
V202506302202__COMPLEMENTARY_tables.sql
V202506302203__DOCUMENTATION_security_tables.sql
V202506302205__PRICE_sales_tables.sql
V202506302206__CONSTRAINTS_relationships.sql
V202507041601__ALTER_menu_table.sql
V202507041602__ADD_new_tables.sql
V202507041603__TRIGGER_uuid_franchise.sql
V202507041604__INSERT_franchise.sql
V202507041605__ALTER_fiscal_directive_table.sql
V202507041607__ADD_franchise_configuration_tables.sql
V202507041608__ADD_variable_formula_table.sql
V202507041610__INSERT_variable_formula.sql
V202507041616__RENAME_value_column_fiscal_directive.sql
V202507041621__CREATE_price_type_table.sql
V202507041622__CREATE_branch_types_table.sql
V202507041630__INSERT_item_category_and_type.sql
V202507041631_1__INSERT_item_filter_classification.sql
V202507041631__CREATE_item_filter_classification_table.sql
V202603092159__ALTER_menu.sql
V202604092159__ORDERS_init.sql
V202604102159__ORDERS_details.sql
V202604122159__ORDERS_config.sql
V202604122259__ORDERS_formula.sql
V202604122319__ORDERS_module_config.sql
V202605122319__CALCULATION_data_type.sql
```

`ditaly_pasta` (54):

```text
V202506151813__init_ditaly_pasta.sql
V202506151816__PRODUCT_tables.sql
V202506151818__TRIGGER_uuid_ditaly_pasta.sql
V202506161601__TRIGGER_provider.sql
V202506171619__DEFAULT_catalog_init.sql
V202507010031__ADD_price_column_to_product.sql
V202507010034__ADD_price_column_to_material.sql
V202507010035__ADD_price_column_to_service.sql
V202507010036__PRICE_sales_tables.sql
V202507010037__CONSTRAINTS_relationships.sql
V202507010038__VW_product_simple_commercial.sql
V202507010039__VW_material_simple_commercial.sql
V202507010040__VW_product_simple.sql
V202507041602__ADD_fiscal_tables.sql
V202507041604__INSERT_ditaly_pasta_user.sql
V202507041605__ADD_franchise_configuration_tables.sql
V202507041606__INSERT_franchise_configuration.sql
V202507041607__INSERT_franchise_configuration_detail.sql
V202507041610__RENAME_price_fiscal_configuration_to_price_configuration.sql
V202507041611__REORDER_columns_in_price_table.sql
V202507041612__FINALIZE_price_and_configuration_tables.sql
V202507041613__REORDER_price_configuration_table.sql
V202507041614__REORDER_price_configuration_with_code_and_trigger.sql
V202507041615_1__ADD_price_type_column_to_price_configuration.sql
V202507041615__ALIGN_price_configuration_FK_to_code.sql
V202507041616__INSERT_price_configuration_row.sql
V202507041617_1__ADD_price_type_column_to_price_configuration.sql
V202507041617__ALTER_price_code_nullable.sql
V202507041618__INSERT_provider_row.sql
V202507041619__ALTER_price_table.sql
V202507041620__TRIGGER_code_price.sql
V202507041621__INSERT_additional_price_configuration.sql
V202507041622__CREATE_ticket_table.sql
V202507041623__CREATE_branches_table.sql
V202507041624__CREATE_platform_table.sql
V202507041625__CREATE_platform_detail_table.sql
V202507041626__CREATE_company_agreements_table.sql
V202507041627__CREATE_agreements_table.sql
V202507041628__CREATE_agreement_detail_table.sql
V202507041629__ADD_explicit_constraints_ticket.sql
V202507041632__ADD_filter_classification_to_ticket.sql
V202507041633__INSERT_price_and_ticket_data.sql
V202507041634__UPDATE_branches_data.sql
V202507041635__ADD_quantity_to_item_configuration_detail.sql
V202602241916__CREATE_client_tables.sql
V202602242212__TEST_client_init_test.sql
V202603101805__PRODUCTION_catalog_product_init.sql
V202603101810__PRODUCTION_MATERIAL_init.sql
V202604003212__TRIGGER_catalog.sql
V202605003212__ORDER_module.sql
V202605003213__ORDER_module_config.sql
V202605003214__CALCULATION_concept_configuration_detail.sql
V202606122319__MODULE_calculation_detail.sql
V202607171905__ALTER_price_amounts_to_decimal.sql
```

`cross` (4):

```text
V202507041601__CROSSDATA.sql
V202507041602__ALTER_all_datetime_to_timestamptz.sql
V202507041606__CREATE_fiscal_directive_stats_view.sql
V202507041608__CREATE_accounting_tables.sql
```

`analytics` (1):

```text
V202507041801__CREATE_fiscal_directive_stats_view.sql
```

No se encontraron archivos SQL de cero bytes. Sí existen migraciones
operacionalmente anómalas: `ORDERS_config` contiene solo comentarios; `TEST`
está dentro de una ubicación estándar y se ejecutaría en cualquier ambiente;
`PRODUCTION_catalog_product_init` borra datos de tablas operacionales antes de
resembrar; y varias migraciones históricas recrean tablas con `DROP ...
CASCADE`. Ninguna debe considerarse inocua por su nombre.

Las versiones con sufijo `_1` son versiones Flyway distintas de la versión
base, pero introducen una convención irregular y fácil de ordenar mal. No se
detectaron duplicados exactos dentro de un mismo flujo. Versiones iguales en
flujos diferentes no colisionan mientras cada flujo conserve su propia tabla
de historial y schemas configurados.

### Bloqueo estático del bootstrap cross

`sbm_business/V202507041616__RENAME_value_column_fiscal_directive.sql` cambia
`fiscal_directive.percentage` a `value`. Después, la migración cross
`V202507041606__CREATE_fiscal_directive_stats_view.sql` todavía selecciona
`fd.percentage`. En un bootstrap fresco que respete el orden de Compose, ese
SQL puede fallar; en consecuencia, la creación posterior de `accounting` y el
flujo analytics quedarían bloqueados. Analytics usa `fd.value`, pero además
tiene la discrepancia de `locations` ya descrita.

---

## 6. Price: estructura objetivo

Tabla:

```text
ditaly_pasta.price
```

Campos:

```text
id
code
base_net_amount
net_amount
gross_amount
iva_amount
aditional_tax_amount
retention_amount
price_configuration
is_current
is_deleted
is_confirmed
created_at
created_by
record_item_code
price_record_type
```

Tipos monetarios objetivo:

```text
base_net_amount       DECIMAL(14,2)
net_amount            DECIMAL(14,2)
gross_amount          DECIMAL(14,2)
iva_amount            DECIMAL(14,2)
aditional_tax_amount  DECIMAL(14,2)
retention_amount      DECIMAL(14,2)
```

Script creado:

```text
flyway/sql/ditaly_pasta/
V202607171905__ALTER_price_amounts_to_decimal.sql
```

DBML ya declara `decimal(14,2)`.

### Observación histórica de runtime registrada el 2026-07-17

Una inspección anterior, conservada como antecedente y no revalidada en esta
sesión, reportó los seis amounts como `integer`, precisión 32 y escala 0. El
último registro entonces visible en `ditaly_pasta.flyway_schema_history` fue:

```text
V202606122319__MODULE_calculation_detail.sql
```

Por tanto, la migración decimal existe en el repositorio y no estaba aplicada
en aquella instancia durante esa inspección. Esto **no prueba el estado actual**
de ningún ambiente.

Antes de probar persistencia decimal:

1. Ejecutar `flyway validate`.
2. Aplicar la migración en el stack DB correcto.
3. Confirmar `numeric_precision=14`, `numeric_scale=2`.
4. Ejecutar regresiones de APIs consumidoras.

El contrato documentado para DP-API espera un mapping equivalente a
`DecimalField(14,2)`; el código de ese repositorio no fue verificado aquí y,
en cualquier caso, un mapping ORM no reemplaza la ejecución Flyway.

---

## 7. Invariantes de versionado Price

```text
1 Price pertenece a 1 item lógico.
1 item puede tener muchos Prices históricos.
1 item puede tener solo 1 Price vigente.
```

Reglas:

- Los importes históricos son inmutables.
- Nunca eliminar Prices anteriores en un cambio normal.
- Cambiar base o configuración crea otra fila.
- El anterior pasa a `is_current=false`.
- El nuevo queda `is_current=true`.
- El item actualiza su FK `price` al nuevo `price.code`.
- Todas las versiones conservan `record_item_code` y `price_record_type`.

Para Product:

```text
product.price → code del Price vigente
price.record_item_code  = product.code
price.price_record_type = 1 (PRODUCT)
```

`record_item_code` es una referencia polimórfica intencional, no una FK a una
tabla concreta. Su integridad depende de `price_record_type`.

Seeds observados:

```text
1 PRODUCT
2 MATERIAL
3 SERVICE
4 CATALOG
5 TICKET
```

Validar estos IDs contra `sbm_business.record_type`; no depender ciegamente de
ellos si cambian los seeds.

### Restricción recomendada

La instancia inspeccionada no garantizaba por constraint una única versión
vigente. Evaluar, después de auditar datos:

```sql
CREATE UNIQUE INDEX ...
ON ditaly_pasta.price (record_item_code, price_record_type)
WHERE is_current IS TRUE AND is_deleted IS NOT TRUE;
```

### Inconsistencia legacy observada históricamente

Una inspección anterior registró un Price compartido por seis Products de
prueba aunque su `record_item_code` identificaba solo uno. Esa observación no
pudo revalidarse en esta sesión y no debe proyectarse automáticamente a otros
ambientes. Si vuelve a detectarse, viola `1 Price = 1 item`: no normalizarlo
automáticamente y bloquear su versionado hasta aprobar una tarea de datos.

---

## 8. Configuración y fórmulas de Price

Cadena:

```text
price.price_configuration
→ ditaly_pasta.price_configuration.code
→ sbm_business.variable_formula.code
→ sbm_business.formula_type
```

`price_configuration` define marca/franchise configuration, fórmula,
`record_type`, confirmación y auditoría.

Configuración Product presente en los seeds SQL:

```text
price_configuration = PRODUCT_NORMAL_IVA
code = cd746343-baf4-4359-b2e6-9bd829631e30
record_type = 1
variable_formula = PRODUCT_STANDARD
```

Fórmula actual:

```text
net_amount=${net_amount};
iva_amount=${net_amount}*${iva};
gross_amount=${net_amount}*(1+${iva});
```

Reglas:

- `formula_template` contiene la expresión del motor.
- `formula_translate` es descripción humana, no código.
- `formula_type` debe corresponder al consumidor, por ejemplo `PRICE`.
- La fórmula debe estar confirmada y no eliminada.
- Las variables usan `${nombre}`.
- No almacenar Python arbitrario, SQL o llamadas de funciones.
- Las APIs nunca deben usar `eval()`.

DP-API usa un intérprete restringido con `Decimal`, asignaciones secuenciales,
suma, resta, multiplicación, división, signos y paréntesis.

`base_net_amount` es la entrada monetaria editable. Los demás amounts son
calculados. No se redondean resultados intermedios; el resultado final se
cuantiza a dos decimales con `ROUND_HALF_UP` para `DECIMAL(14,2)`.

---

## 9. Variables y directivas fiscales

Cadena:

```text
price_configuration.code
→ ditaly_pasta.fiscal_configuration_detail.module_config_id
→ fiscal_configuration_detail.fiscal_directive
→ sbm_business.fiscal_directive.code
→ fiscal_directive.value
```

`fiscal_configuration_detail.var` define el nombre usado por la fórmula:

```text
var = iva
value = 0.190
```

El IVA no es constante global. KISEKI TECH u otra marca puede usar otra tasa o
variable fiscal mediante su configuración.

Runtime observado históricamente y no revalidado en esta sesión:

```text
sbm_business.fiscal_directive.value NUMERIC(10,3)
```

El DBML inspeccionado declara `decimal(10,2)` y debe alinearse a
`decimal(10,3)` para representar exactamente `0.190`.

### Vigencia temporal

`fiscal_directive` contiene:

```text
month
end_month
year
end_year
```

Estos campos deben seleccionar la directiva aplicable a la fecha efectiva del
cálculo. Antes de crear constraints o funciones se debe definir:

- intervalos inclusivos/exclusivos;
- significado de `NULL`;
- zona horaria y fecha efectiva;
- tratamiento de vigencias abiertas;
- prevención de solapamientos para variable/configuración/fecha.

Si existen dos directivas aplicables y no hay regla de precedencia, la
operación debe rechazarse por ambigüedad.

---

## 10. Divergencias de diseño, scripts y runtime conocido

Las referencias a runtime de esta lista provienen de una inspección anterior
del 2026-07-17; no representan una comprobación actual:

1. `price`:
   - DBML/Flyway objetivo: amounts `DECIMAL(14,2)`.
   - Runtime: amounts `integer`.
   - Migración decimal pendiente en la instancia inspeccionada.

2. `fiscal_directive.value`:
   - DBML: `decimal(10,2)`.
   - Runtime: `numeric(10,3)`.

3. `price_configuration_detail`:
   - DBML usa `price_concept`.
   - Runtime usa `calculation_concept`.

4. `fiscal_configuration_detail`:
   - DBML muestra `module` y `data_type`.
   - Runtime usa `module_id` y no contiene `data_type`.

5. Documentación técnica antigua:
   - usa nombres legacy como `price_fiscal_configuration` e `is_active` para
     Price;
   - no es autoridad sin contrastar Flyway y PostgreSQL.

Otras divergencias detectadas estáticamente:

- El DBML declara `item_classification`; los scripts crean y usan
  `item_filter_classification`.
- El DBML de `price_configuration_detail` usa `price_concept`; el SQL vigente
  evoluciona hacia `calculation_concept`.
- El DBML de `fiscal_configuration_detail` usa `module`, `module_config_id` y
  `data_type`; los scripts usan `module_id`, `module_config_id` y no consolidan
  el cambio activo de `data_type`.
- El DBML modela `branches.maps_location` como `jsonb`; el script inicial lo
  declara `varchar(255)` mientras un seed intenta insertar JSON.
- El SQL inicial de `product` contiene `gross_price`; el DBML no lo declara y
  seeds posteriores todavía lo usan.
- Los scripts de órdenes agregan `has_fiscal_documentation` e `is_delayed` que
  no aparecen de forma equivalente en el DBML canónico.
- Las nueve tablas contables están sin schema en DBML, pero el script cross
  las crea en `accounting`.
- Marketing, content y events figuran en DBML sin cobertura completa de
  migraciones; analytics presenta el caso inverso.
- El seed inicial de tickets asigna `price_record_type = 5` a Prices cuya
  configuración es de tipo Product, y contiene referencias repetidas de
  `record_item_code`; no es evidencia válida del invariante final.
- La taxonomía de tipos monetarios en fórmulas/seeds alterna nombres como
  `currency_int`, `currency_int1` y `currency_int2`; los consumidores deben
  resolver ese contrato antes de interpretar escalas.

Resolver cada divergencia mediante cambios separados y verificables.

### Estado efectivo no verificado en esta sesión

La lectura de archivos fue completa, pero `docker compose ... ps -a` no pudo
acceder al socket Docker en el entorno de ejecución. Por ello no se verificaron
contenedores, `flyway_schema_history`, schemas, columnas, constraints, vistas,
triggers ni datos efectivos de PostgreSQL. Todas las afirmaciones de runtime
de este documento están etiquetadas como observaciones históricas.

---

## 11. Product y relaciones

```text
product.price      → price.code
product.provider   → provider.id
product.type       → sbm_business.item_type.id
product.item_group → sbm_business.item_group.id
product.category   → sbm_business.item_category.id
product.package    → sbm_business.package.id
```

El trigger `product_before_insert` genera SKU:

```text
P-<número-proveedor>-<secuencia-cuatro-dígitos>
```

El número proviene del sufijo de `provider.code`. Revisar la estrategia de
concurrencia antes de alta carga; la restricción unique protege el dato final,
pero no reemplaza una secuencia serializada.

El trigger `price_before_insert` genera `price.code` UUID cuando falta.

---

## 12. Auditoría, soft delete y tiempo

Patrones frecuentes:

```text
is_deleted / is_confirmed
created_at / updated_at / confirmed_at / deleted_at
created_by / updated_by / confirmed_by / deleted_by
log / version
```

- No convertir soft delete en borrado físico sin decisión explícita.
- No eliminar históricos Price.
- Las FKs de auditoría suelen apuntar a `sbm_business.user.code`.
- Auditar tipos reales de timestamp antes de cambios de zona horaria.
- La identidad autenticada definitiva es deuda de las APIs; no justifica
  debilitar integridad referencial.

---

## 13. Checklist de cambio estructural

Antes:

- [ ] Identificar schema y owner funcional.
- [ ] Leer scripts previos de la tabla.
- [ ] Consultar estructura e historial reales.
- [ ] Auditar datos incompatibles.
- [ ] Revisar consumidores desplegados.
- [ ] Diseñar transformación y recuperación.
- [ ] Elegir versión Flyway única.

Durante:

- [ ] Crear script nuevo; no editar uno aplicado.
- [ ] Calificar schemas en SQL cross-schema.
- [ ] Preservar datos e históricos.
- [ ] Agregar constraints solo después de auditar datos.
- [ ] Actualizar DBML y contexto.

Después:

- [ ] Ejecutar `flyway validate`.
- [ ] Migrar en el orden correcto.
- [ ] Revisar `flyway_schema_history`.
- [ ] Confirmar tipos, defaults, constraints, índices y triggers.
- [ ] Ejecutar pruebas de APIs consumidoras.

### Comandos operativos reproducibles

Los archivos `.env.dev` y `.env.prod` aportan variables, pero sus valores no
deben copiarse a documentación. Variables esperadas: `POSTGRES_HOST`,
`POSTGRES_PORT`, `POSTGRES_INTERNAL_PORT`, `POSTGRES_DB`, `POSTGRES_USER`,
`POSTGRES_PASSWORD`, `FLYWAY_USER`, `FLYWAY_PASSWORD`, las cuatro variables
`FLYWAY_*_SCHEMAS` y las variables `DOPPLER_*`.

```bash
docker network inspect sbm-network
docker compose --env-file .env.dev up -d postgres
docker compose --env-file .env.dev ps -a
```

Antes de migrar, ejecutar `info` y `validate` por flujo:

```bash
docker compose --env-file .env.dev run --rm flyway_sbm_business -configFiles=/flyway/conf/flyway.conf info
docker compose --env-file .env.dev run --rm flyway_sbm_business -configFiles=/flyway/conf/flyway.conf validate
```

Reemplazar el servicio por `flyway_ditaly_pasta`, `flyway_cross` o
`flyway_analytics`. En cross y analytics, `validate` manual es especialmente
importante porque `validateOnMigrate=false`. Solo después de resolver los
bloqueos conocidos, migrar explícitamente en este orden:

```bash
docker compose --env-file .env.dev run --rm flyway_sbm_business -configFiles=/flyway/conf/flyway.conf migrate
docker compose --env-file .env.dev run --rm flyway_ditaly_pasta -configFiles=/flyway/conf/flyway.conf migrate
docker compose --env-file .env.dev run --rm flyway_cross -configFiles=/flyway/conf/flyway.conf migrate
docker compose --env-file .env.dev run --rm flyway_analytics -configFiles=/flyway/conf/flyway.conf migrate
```

Acceso interactivo sin revelar valores:

```bash
docker compose --env-file .env.dev exec postgres sh -lc 'psql -U "$POSTGRES_USER" -d "$POSTGRES_DB"'
```

Consultas mínimas de comprobación:

```sql
SELECT installed_rank, version, description, type, script, checksum,
       installed_on, success
FROM ditaly_pasta.flyway_schema_history
ORDER BY installed_rank;

SELECT column_name, data_type, numeric_precision, numeric_scale
FROM information_schema.columns
WHERE table_schema = 'ditaly_pasta'
  AND table_name = 'price'
ORDER BY ordinal_position;
```

`command.md` es una referencia histórica: todavía menciona MySQL, comandos
legacy e instrucciones incompletas. No es fuente operativa ni reemplaza los
`flyway.conf`, Compose y scripts actuales.

---

## 14. Prohibiciones sin autorización

- `flyway clean`, drops o truncados.
- Borrar Prices históricos.
- Limpiar automáticamente datos compartidos.
- Crear migraciones Django para tablas Flyway.
- Cambiar IDs seed-contract sin coordinación.
- Hardcodear IVA, tax, moneda o reglas de una marca globalmente.
- Ejecutar fórmulas con `eval()`.
- Versionar secretos reales.

---

## 15. Próximas tareas recomendadas

1. Corregir y probar la referencia `percentage`/`value` de la vista cross.
2. Alinear el mount y `flyway.locations` del flujo analytics.
3. Ejecutar `info`/`validate` por flujo y probar un bootstrap desde cero en un
   ambiente descartable.
4. Verificar y, si corresponde, aplicar
   `V202607171905__ALTER_price_amounts_to_decimal.sql`.
5. Alinear DBML y SQL para contabilidad, directivas fiscales,
   `price_configuration_detail`, `fiscal_configuration_detail`, branches,
   Product y órdenes mediante cambios separados.
6. Aislar o retirar el seed `TEST` y auditar las migraciones destructivas antes
   de cualquier despliegue.
7. Auditar Prices compartidos y mismatches de record type antes de constraints.
8. Evaluar un índice único parcial para el Price vigente por item/tipo.
9. Definir selección temporal de directivas fiscales y revisar concurrencia
   del generador SKU.

---

## 16. Regla para Cursor/LLM

Antes de modificar `SBM-DB`:

1. Leer este archivo completo.
2. Leer `README.md`, `docker-compose.yml` y Flyway relevante.
3. Leer todos los scripts previos del objeto.
4. Comparar DBML con PostgreSQL real.
5. Presentar plan, archivos y riesgos antes de mutar.
6. No ejecutar migraciones ni acciones destructivas sin autorización.
7. No realizar operaciones Git; el usuario las gestiona manualmente salvo
   instrucción explícita distinta.

Prioridad: preservar datos, historia, integridad cross-schema y compatibilidad
entre consumidores de SBM Suite.
