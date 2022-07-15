import 'package:flutter_cqlbr_core/flutter_cqlbr_core.dart';
import 'package:flutter_cqlbr_mysql/flutter_cqlbr_mysql.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CQLBr cqlbr = CQLBr(select: CQLSelectMySQL());

  test('TestCountMySQL', () {
    String result = cqlbr
        .select$()
        .column$('ID_CLIENTE')
        .count$()
        .as$('IDCOUNT')
        .from$('CLIENTES')
        .asResult();

    expect(result, 'SELECT COUNT(ID_CLIENTE) AS IDCOUNT FROM CLIENTES');
  });

  test('TestLowerMySQL', () {
    String result = cqlbr
        .select$()
        .column$('NOME_CLIENTE')
        .lower$()
        .as$('NOME')
        .from$('CLIENTES')
        .asResult();

    expect(result, 'SELECT LOWER(NOME_CLIENTE) AS NOME FROM CLIENTES');
  });

  test('TestUpperMySQL', () {
    String result = cqlbr
        .select$()
        .column$('NOME_CLIENTE')
        .upper$()
        .as$('NOME')
        .from$('CLIENTES')
        .asResult();

    expect(result, 'SELECT UPPER(NOME_CLIENTE) AS NOME FROM CLIENTES');
  });

  test('TestMaxMySQL', () {
    String result = cqlbr
        .select$()
        .column$('ID_CLIENTE')
        .max$()
        .as$('IDCOUNT')
        .from$('CLIENTES')
        .asResult();

    expect(result, 'SELECT MAX(ID_CLIENTE) AS IDCOUNT FROM CLIENTES');
  });

  test('TestMinMySQL', () {
    String result = cqlbr
        .select$()
        .column$('ID_CLIENTE')
        .min$()
        .as$('IDCOUNT')
        .from$('CLIENTES')
        .asResult();

    expect(result, 'SELECT MIN(ID_CLIENTE) AS IDCOUNT FROM CLIENTES');
  });

  test('TestSubstringMySQL', () {
    String result = cqlbr
        .select$()
        .column$('NOME_CLIENTE')
        .substring$(1, 2)
        .as$('NOME')
        .from$('CLIENTES')
        .asResult();

    expect(result,
        'SELECT SUBSTRING(NOME_CLIENTE FROM 1 FOR 2) AS NOME FROM CLIENTES');
  });

  test('TestMonthWhereMySQL', () {
    String result = cqlbr
        .select$()
        .all$()
        .from$('CLIENTES')
        .where$()
        .month$('NASCTO')
        .equal$('9')
        .asResult();

    expect(result,
        'SELECT * FROM CLIENTES WHERE (EXTRACT(MONTH FROM NASCTO) = 9)');
  });

  test('TestMonthSelectMySQL', () {
    String result =
        cqlbr.select$().column$().month$('NASCTO').from$('CLIENTES').asResult();

    expect(result, 'SELECT EXTRACT(MONTH FROM NASCTO) FROM CLIENTES');
  });

  test('TestDayWhereMySQL', () {
    String result = cqlbr
        .select$()
        .all$()
        .from$('CLIENTES')
        .where$()
        .day$('NASCTO')
        .equal$('9')
        .asResult();

    expect(
        result, 'SELECT * FROM CLIENTES WHERE (EXTRACT(DAY FROM NASCTO) = 9)');
  });

  test('TestDaySelectMySQL', () {
    String result =
        cqlbr.select$().column$().day$('NASCTO').from$('CLIENTES').asResult();

    expect(result, 'SELECT EXTRACT(DAY FROM NASCTO) FROM CLIENTES');
  });

  test('TestYearWhereMySQL', () {
    String result = cqlbr
        .select$()
        .all$()
        .from$('CLIENTES')
        .where$()
        .year$('NASCTO')
        .equal$('9')
        .asResult();

    expect(
        result, 'SELECT * FROM CLIENTES WHERE (EXTRACT(YEAR FROM NASCTO) = 9)');
  });

  test('TestYearSelectMySQL', () {
    String result =
        cqlbr.select$().column$().year$('NASCTO').from$('CLIENTES').asResult();

    expect(result, 'SELECT EXTRACT(YEAR FROM NASCTO) FROM CLIENTES');
  });

  test('TestDateMySQL', () {
    String result = cqlbr
        .select$()
        .all$()
        .from$('CLIENTES')
        .where$()
        .date$('NASCTO')
        .equal$()
        .date$(Fun.q('02/11/2020'))
        .asResult();

    expect(
        result, 'SELECT * FROM CLIENTES WHERE NASCTO = ${Fun.q('02/11/2020')}');
  });

  test('TestConcatSelectMySQL', () {
    String result = cqlbr
        .select$()
        .column$()
        .concat$([Fun.q('-'), 'NOME'])
        .from$('CLIENTES')
        .asResult();

    expect(result, 'SELECT ${Fun.q('-')} || NOME FROM CLIENTES');
  });

  test('TestConcatWhereMySQL', () {
    String result = cqlbr
        .select$()
        .column$()
        .concat$([Fun.q('-'), 'NOME'])
        .from$('CLIENTES')
        .where$()
        .concat$([Fun.q('-'), 'NOME'])
        .equal$(Fun.q('-NOME'))
        .asResult();

    expect(result,
        'SELECT ${Fun.q('-')} || NOME FROM CLIENTES WHERE (${Fun.q('-')} || NOME = ${Fun.q('-NOME')})');
  });
}
