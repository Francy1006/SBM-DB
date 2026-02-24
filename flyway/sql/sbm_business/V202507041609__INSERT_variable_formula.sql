-- INSERT VARIABLE FORMULA
INSERT INTO sbm_business.variable_formula (
        id,
        code,
        formula,
        formula_template,
        formula_translate,
        is_deleted,
        is_confirmed,
        created_at,
        updated_at,
        confirmed_at,
        deleted_at,
        created_by,
        confirmed_by,
        updated_by,
        deleted_by
    )
VALUES(
        1,
        'ee4eabde-242b-4252-9a81-8266ad9b9336',
        'NORMAL_IVA',
        'Venta Neta:currency_int=${base_net_amount};
IVA Venta:currency_int=${base_net_amount}*${iva};
Venta Bruta:currency_int=${base_net_amount}*(1+${iva});
Total Neto Productos:currency_int=${total_neto_productos};
Total Neto Materiales:currency_int=${total_neto_materiales};
Total Neto Servicios:currency_int=${total_neto_servicios};
Costo Neto:currency_int=${costo_neto};
IVA Costo:currency_int=${iva_costo};
Utilidad Neta CLP:currency_int=${base_net_amount}-${costo_neto};
Margen Neto %:percentage=(${base_net_amount}-${costo_neto})/${base_net_amount};
IVA Diferencia:currency_int=(${base_net_amount}*${iva})-${iva_costo};',
        'PRECIO NETO * (1 + IVA) = PRECIO BRUTO',
        NULL,
        true,
        '2025-07-13 12:37:16.304',
        NULL,
        '2025-07-13 12:37:16.304',
        NULL,
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        '5fbf2886-4ad0-11f0-8ce6-0242ac120002',
        NULL,
        NULL
    );