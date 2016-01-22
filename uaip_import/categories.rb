CATEGORIES = {
  1 => 'Poder Legislativo',
  2 => 'Presidencia de la República',
  3 => 'Ministerio de Defensa Nacional',
  4 => 'Ministerio del Interior',
  5 => 'Ministerio de Economía y Finanzas',
  6 => 'Ministerio de Relaciones Exteriores',
  7 => 'Ministerio de Ganadería, Agricultura y Pesca',
  8 => 'Ministerio de Industria, Energía y Minería',
  9 => 'Ministerio de Turismo y Deporte',
  10 => 'Ministerio de Transporte y Obras Públicas',
  11 => 'Ministerio de Educación y Cultura',
  12 => 'Ministerio de Salud Pública',
  13 => 'Ministerio de Trabajo y Seguridad Social',
  14 => 'Ministerio de Vivienda',
  15 => 'Ministerio de Desarrollo Social',
  16 => 'Poder Judicial',
  17 => 'Tribunal de Cuentas de la República',
  18 => 'Corte Electoral',
  19 => 'Tribunal de lo Contencioso Administrativo',
  25 => 'Administración Nacional de Educación Pública',
  26 => 'Universidad de la República',
  27 => 'INAU',
  28 => 'Banco de Previsión Social',
  29 => 'ASSE',
  50 => 'Banco Central del Uruguay',
  51 => 'Banco de la República Oriental del Uruguay',
  52 => 'Banco Hipotecario del Uruguay',
  53 => 'Banco de Seguros del Estado',
  60 => 'ANCAP',
  61 => 'UTE',
  62 => 'AFE',
  63 => 'PLUNA',
  64 => 'Administración Nacional de Puertos',
  65 => 'ANTEL',
  66 => 'OSE',
  67 => 'Administración Nacional de Correos',
  68 => 'Agencia Nacional de Vivienda',
  70 => 'Instituto Nacional de Colonización',
  80 => 'Gobierno Departamental de Artigas',
  81 => 'Gobierno Departamental de Canelones',
  82 => 'Gobierno Departamental de Cerro Largo',
  83 => 'Gobierno Departamental de Colonia',
  84 => 'Gobierno Departamental de Durazno',
  85 => 'Gobierno Departamental de Flores',
  86 => 'Gobierno Departamental de Florida',
  87 => 'Gobierno Departamental de Lavalleja',
  88 => 'Gobierno Departamental de Maldonado',
  89 => 'Gobierno Departamental de Paysandú',
  90 => 'Gobierno Departamental de Río Negro',
  91 => 'Gobierno Departamental de Rivera',
  92 => 'Gobierno Departamental de Rocha',
  93 => 'Gobierno Departamental de Salto',
  94 => 'Gobierno Departamental de San José',
  95 => 'Gobierno Departamental de Soriano',
  96 => 'Gobierno Departamental de Tacuarembó',
  97 => 'Gobierno Departamental de Treinta y Tres',
  98 => 'Gobierno Departamental de Montevideo',
}

def category_title_to_tag_name(title)
  title.downcase.tr('ÁÉÍÓÚáéíóú ', 'aeiouaeiou_')
end