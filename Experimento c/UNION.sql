
--Union de actividades y ad hoc

SELECT 'Actividad' as Tipo,a.nombre, a.codigo, a.descripcion, a.tipo_firma, a.rol_seguridad
FROM ACTIVIDAD a
UNION
SELECT 'Adhoc',ah.nombre, ah.codigo, ah.descripcion, ah.tipo_firma, ah.rol_seguridad
FROM AD_HOC ah