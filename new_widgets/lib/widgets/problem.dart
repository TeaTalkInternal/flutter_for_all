List sampleJson = [
  {
    'investment_id': '12JXK5',
    'year': 0,
    'revenue_go': 0,
    'capex_go': 30000,
    'opex_go': 10000,
    'revenue_nogo': 15000,
    'capex_nogo': 0,
    'opex_nogo': 5000,
  },
  {
    'investment_id': '12JXK5',
    'year': 1,
    'revenue_go': 25000,
    'capex_go': 0,
    'opex_go': 10000,
    'revenue_nogo': 10000,
    'capex_nogo': 0,
    'opex_nogo': 5000,
  },
  {
    'investment_id': '12JXK5',
    'year': 2,
    'revenue_go': 40000,
    'capex_go': 0,
    'opex_go': 10000,
    'revenue_nogo': 5000,
    'capex_nogo': 0,
    'opex_nogo': 5000,
  },
  {
    'investment_id': '12JXK5',
    'year': 3,
    'revenue_go': 45000,
    'capex_go': 0,
    'opex_go': 10000,
    'revenue_nogo': 5000,
    'capex_nogo': 0,
    'opex_nogo': 5000,
  },
  {
    'investment_id': 'HT4AA2',
    'year': 0,
    'revenue_go': 100,
    'capex_go': 15500,
    'opex_go': 2000,
    'revenue_nogo': 1000,
    'capex_nogo': 0,
    'opex_nogo': 1250,
  }
];

void main() {
//   findDataOfYear('HT4AA2');
  Iterable<int> data = findDataOfYear('12JXK5');
  print(data);
  reduceData(data);

  // Future.delayed(Duration(seconds: 4), () {
  //   reduceData(data);
  // });
}

Iterable<int> findDataOfYear(String investmentId) {
  print('Investment ID: | Year | Incremental Cashflow');
  print('--------------------------------------------');

  return sampleJson.map((element) {
    int incCashFlow = 0;
    if (element['investment_id'] == investmentId) {
      int incrementalCashflowGo =
          element['revenue_go'] - element['capex_go'] - element['opex_go'];
      int incrementalCashflowNogo = element['revenue_nogo'] -
          element['capex_nogo'] -
          element['opex_nogo'];
      int incrementalCashFlow = incrementalCashflowGo - incrementalCashflowNogo;

      incCashFlow = incrementalCashFlow;
      print('$investmentId | ${element['year']} | $incrementalCashFlow');
    }
    return incCashFlow;
  });
}

reduceData(Iterable<int> data) {
  print(data.reduce((value, element) {
    return element + value;
  }));
}
