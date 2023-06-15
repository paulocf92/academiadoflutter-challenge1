extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

void main() {

  //! Detalhe sobre a String
  //! A String é composta por 4 campos (Nome|Idade|Profissão|Estado onde mora)
  final pacientes = [
    'Rodrigo Rahman|35|desenvolvedor|SP',
    'Manoel Silva|12|estudante|MG',
    'Joaquim Rahman|18|estudante|SP',
    'Fernando Verne|35|estudante|MG',
    'Gustavo Silva|40|desenvolvedor|MG',
    'Sandra Silva|40|Desenvolvedor|MG',
    'Regina Verne|35|dentista|MG',
    'João Rahman|55|jornalista|SP',
  ];

  //! Baseado no array acima monte um relatório onde:
  var pacientes20Mais = <String>[];
  Map<String, int> pacientesPorProfissao = {};
  var pacientesSP = 0;

  for (final dado in pacientes) {
    final dadosPaciente = dado.split('|');
    final idade = int.tryParse(dadosPaciente[1]);
    final profissao = dadosPaciente[2].capitalize();

    if (idade != null && idade > 20) {
      pacientes20Mais.add(dadosPaciente.first);
    }

    pacientesSP = pacientesSP + (dadosPaciente.last == 'SP' ? 1 : 0);
    pacientesPorProfissao[profissao] = (pacientesPorProfissao[profissao] ?? 0) + 1;
  }

  //! 1 - Apresente os pacientes com mais de 20 anos e print o nome deles
  print('Pacientes com mais de 20 anos:');
  for (final paciente in pacientes20Mais) {
    print('- $paciente');
  }

  //! 2 - Apresente quantos pacientes existem para cada profissão (desenvolvedor, estudante, dentista, jornalista)
  print('\nPacientes por profissão:');
  pacientesPorProfissao.forEach((k,v) => print('$k: $v'));

  //! 3 - Apresente a quantidade de pacientes que moram em SP
  print('\nPacientes que moram em SP: $pacientesSP');
}