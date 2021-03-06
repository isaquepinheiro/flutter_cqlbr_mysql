import 'package:flutter_cqlbr_core/flutter_cqlbr_core.dart';

import 'cqlbr.functions.mysql.dart';
import 'cqlbr.qualifier.mysql.dart';
import 'cqlbr.serialize.mysql.dart';

class CQLSelectMySQL extends CQLSelect {
  CQLSelectMySQL() {
    driver = Database.dbnMySQL;
    qualifiers = CQLSelectQualifiersMySQL();
    CQLBrRegister.instance.registerSelect(driver, this);
    CQLBrRegister.instance.registerSerialize(driver, CQLSerializerMySQL());
    CQLBrRegister.instance.registerFunctions(driver, CQLFunctionsMySQL());
  }
}
