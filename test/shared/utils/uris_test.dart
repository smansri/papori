#library('utils');

#import('dart:uri');
#import('package:unittest/unittest.dart');
#import('../../runnable.dart');

#import('../../../src/shared/utils/uris.dart');

class UrisTest implements Runnable {
  run(){
    test('parseQuery', () {
      String query = '?a=b&a%20b=i%20j&&&null&empty=&a=c&&';

      Map<String, List<String>> output = Uris.parseQuery(query);

      // FIX : l'égalité des map n'est pas implémenté
//      Map<String, List<String>> expected = {
//                                            'a' : ['b', 'c'],
//                                            'a b' : ['i j'],
//                                            'null' : [null],
//                                            'empty' : [''],
//      };
//      expect(output, equals(expected));
      expect(output.getKeys(), orderedEquals(['a', 'a b', 'null', 'empty']));
      expect(output['a'], orderedEquals(['b', 'c']));
      expect(output['a b'], orderedEquals(['i j']));
      expect(output['null'], orderedEquals([null]));
      expect(output['empty'], orderedEquals(['']));
    });

    test('parseEmptyQuery', () {
      String query = '';

      Map<String, List<String>> output = Uris.parseQuery(query);

      expect(output.isEmpty());
    });
  }
}
