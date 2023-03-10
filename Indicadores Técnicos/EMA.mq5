//+------------------------------------------------------------------+
//|                                                          EMA.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

// Declarar variáveis ​​para cálculo de EMA
double ema;
double previousEma;
double smoothingFactor;
double closingPrice;
int days;

//Inicializar variáveis
days = 10;
previousEma = iMA(NULL, 0, days, 0, MODE_EMA, PRICE_CLOSE, 0);
closingPrice = Close[0];
smoothingFactor = 2.0 / (days + 1.0);

// Calcular EMA
ema = (closingPrice * smoothingFactor) + (previousEma * (1.0 - smoothingFactor));