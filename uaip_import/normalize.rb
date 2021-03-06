#!/usr/bin/env ruby

# these are duplicates
BODIES_TO_DELETE = [
  'Administración Nacional de Educación Pública - Consejo de Educacion Inicial y Primaria',
  'Intendencia Departamental de Florida',
]

NAMES_MAPPING = {
  'Presidencia' => 'Dirección General de Presidencia de la República',
  'Unidad Reguladora de Energia y Agua' => 'Unidad Reguladora de Servicios de Energía y Agua',
  'Unidad Reguladora y de Control de Datos Personales' => 'Agencia para el Desarrollo del Gobierno de Gestión Electrónica y la Sociedad de la Información y del Conocimiento (AGESIC)',
  'Armada Nacional = Ministerio de Defensa de Nacional' => 'Comando General de la Armada',
  'Fuerza Aerea' => 'Comando General de la Fuerza Aérea',
  'Ministerio del Interior' => 'Dirección General de Secretaría del Ministerio del Interior',
  'Sanidad Policial' => 'UE 030: Dirección Nacional de Sanidad Policial',
  'Gobierno Ministerio del Interior Direccion Nacional de Identificacion Civil' => 'Dirección Nacional de Identificación Civil (DNIC)',
  'Contaduria General de la Nacion' => 'Contaduría General de la Nación',
  'Auditoria Interna de la Nacion' => 'Auditoría Interna de la Nación',
  'Direccion General de Impositiva' => 'Dirección General Impositiva',
  'Direccion Nacional de Aduanas' => 'Dirección Nacional de Aduanas',
  'Direccion Nacional de Catastro' => 'Dirección Nacional de Catastro',
  'Direccion Nacional de Casinos' => 'Dirección General de Casinos',
  'Direccion General Fosteral' => 'Dirección General Forestal',
  'Ministerio de Industria, Energia  Mineria' => 'Dirección General de Secretaría del Ministerio De Industria, Energía y Minería',
  'Direccion Nacional de Industria' => 'Dirección Nacional de Industrias',
  'Dirección Nacional de Propiedad Industrial' => 'Dirección Nacional de la Propiedad Industrial',
  'Direccion Nacional de Mineria' => 'Dirección Nacional de Minería y Geología',
  'Direccion General de Energia y Tecnologia Nuclear' => 'Dirección Nacional de Energía y Tecnología Nuclear',
  'Dirección Nacional de la Pequeña y Mediana Empresa' => 'Dirección Nacional de Artesanías y Pequeñas y Medianas Empresas',
  'Dirección Nacional de Telecomunicaciones' => 'Dirección Nacional de Telecomunicaciones y Servicios de  Comunicación Audiovisual',
  'Autoridad  Reguladora Nacional en Radio Protecicon' => 'Autoridad Reguladora Nacional en Radioprotección',
  'Direccion Nacional de Innovacion Ciencia y Tecnologia para el desarrollo' => 'Direc.de Innovación, Ciencia y Tecnología para el Desarrollo',
  'Fiscalia de Corte, Procudaria General de la Nacion' => 'Fiscalía de Corte, Procuraduría General de la Nación',
  'Procudaria del Estado TCA' => 'Procuraduría Estado en Contencioso Administrativo',
  'Junta de Transparencia y Etica Publica' => 'Junta de Transparencia y Ética Pública',
  'Ministerio de Salud Publica' => 'Dirección General de Secretaría del Ministerio de Salud Pública',
  'Instituto Nacional de Donacion de Transplante de Celulas Tejidos y Organos' => 'Instituto Nacional de  Donación  y Trasplante de Células, Tejidos y Órganos',
  'Direccion Nacional de Trabajo' => 'Dirección Nacional de Trabajo',
  'Ministerio de Desarrollo Social' => 'Dirección General de Secretaría del Ministerio de Desarrollo Social',
  'Camara de Senadores' => 'Cámara de Senadores',
  'Tribunal contencioso administrativo' => 'Tribunal De Lo Contencioso Administrativo',
  'Administración Nacional de Educación Pública -CODICEN' => 'Consejo Directivo Central',
  'Administración Nacional de Educación Pública - Consejo de Educacion Secundaria' => 'Consejo de Educación Secundaria',
  'Administración Nacional de Educación Pública -CONSEJO DE FORMACION EN EDUCACION' => 'Consejo de Formación en Educación',
  'Facultad de Agronomia' => 'Facultad de Agronomía',
  'Banco de Prevision Social' => 'Banco de Previsión Social',
  'Banco República Oriental del Uruguay' => 'Banco de la República Oriental del Uruguay',
  'Administracion Nacional de Combustible, Alcoholes y Portland' => 'ANCAP',
  'Administracion Nacional de Ferrrocariles del Estado' => 'AFE',
  'Instituto Naiconal de Colonizacion' => 'Instituto Nacional de Colonización',
  'Administraicion Nacional de puertos' => 'Administración Nacional de Puertos',
  'Obras Sanitarias del Estado' => 'Administración de las Obras Sanitarias del Estado',
  'Administracion nacional de correos' => 'Administración Nacional de Correos',
  'Agencia Nacional de innovacion e investigacion' => 'Agencia Nacional de Investigación e Innovación',
  'Caja de jubilaciones y Pensiones' => 'Caja de Jubilaciones y Pensiones Bancarias',
  'Comision Nacional de Lucha de Cancer' => 'Comisión Honoraria Lucha Contra el Cáncer',
  'Comision honoraria para la salud cardiovascular' => 'Comisión Honoraria para la Salud Cardiovascular',
  'Corporacion de Proteccion del Ahorro Bancario' => 'Corporación de Protección del Ahorro Bancario',
  'Corporacion Nacional para el Desarrollo' => 'Corporación Nacional para el Desarrollo',
  'Direccion Nacional de Impresiones y Publicaciones Oficiales' => 'Dirección Nacional de Impresiones y Publicaciones Oficiales',
  'Instituto Nacional de Evalucion Educativa' => 'Instituto Nacional de Evaluación Educativa',
  'Instituto Nacional de Investigacion Agropecuaria' => 'Instituto Nacional de Investigación Agropecuaria',
  'Laboratorio Tecnologico del Uruguay' => 'Laboratorio Tecnológico del Uruguay',
  'Intendencia de Canelones' => 'Intendencia Departamental de Canelones',
  'Intendencia de Flores' => 'Intendencia Departamental de Flores',
  'Intendencia de Florida' => 'Intendencia Departamental de Florida',
  'Intendencia de Lavalleja' => 'Intendencia Departamental de Lavalleja',
  'Junta Departamental de paysandu' => 'Junta Departamental de Paysandú',
  'Junta Departamental de Rio Negro' => 'Junta Departamental de Río Negro',
  'Junta Departamental de San Jose' => 'Junta Departamental de San José',
  'Intendencia de Montevideo' => 'Intendencia Departamental de Montevideo',
  'Jefatura de Policia de Canelones' => 'Jefatura de Policía de Canelones',
}

BODIES_TO_DELETE.each do |name|
  body = PublicBody.find_by_name(name)
  next puts "Could not find '#{name}'" unless body
  next puts "Body '#{name}' already has requests and can't be deleted." if body.info_requests.count > 0
  begin
    body.destroy
    puts "Deleted '#{name}'"
  rescue => e
    puts "Failed to delete '#{name}' because: #{e.to_s}"
  end
end

NAMES_MAPPING.each do |old_name, new_name|
  body = PublicBody.find_by_name(old_name)
  next puts "Could not find '#{old_name}'" unless body
  body.name = new_name
  if body.save
    puts "Updated '#{old_name}' to '#{new_name}'"
  else
    puts "Failed to save changes to '#{old_name}' because: #{body.errors.full_messages}"
  end
end
