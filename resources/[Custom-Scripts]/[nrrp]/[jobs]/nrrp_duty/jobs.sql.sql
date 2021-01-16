INSERT INTO `jobs` (name, label, whitelisted) VALUES
  ('offpolice','PSP', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('offpolice', '0', 'cadete', 'Cadete/Agente Provisorio', '45', '{}', '{}'),
  ('offpolice', '1', 'agente', 'Agente', '50', '{}', '{}'),
  ('offpolice', '2', 'agentep', 'Agente Principal', '55', '{}', '{}'),
  ('offpolice', '3', 'agentec', 'Agente Coordenador', '60', '{}', '{}'),
  ('offpolice', '4', 'chefe', 'Chefe', '75', '{}', '{}'),
  ('offpolice', '5', 'chefep', 'Chefe Principal', '80', '{}', '{}'),
  ('offpolice', '6', 'chefec', 'Chefe-Coordenador ', '85', '{}', '{}'),
  ('offpolice', '7', 'subc', 'Sub-Comissário', '90', '{}', '{}'),
  ('offpolice', '8', 'boss', 'Comissário', '95', '{}', '{}'),
  ('offpolice', '9', 'subint', 'Sub-Intendente', '1000', '{}', '{}'),
  ('offpolice', '10', 'inten', 'Intendente', '1000', '{}', '{}'),
  ('offpolice', '11', 'superin', 'Superintendente', '1000', '{}', '{}'),
  ('offpolice', '12', 'superinchefe', 'Superintendente-Chefe', '1000', '{}', '{}'),
  ('offpolice', '13', 'diretoradjunto', 'Diretor Nacional-Adjunto', '1000', '{}', '{}'),
  ('offpolice', '14', 'diretornacional', 'Diretor Nacional', '1000', '{}', '{}');
