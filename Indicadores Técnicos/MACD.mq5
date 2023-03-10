//+------------------------------------------------------------------+
//|                                                         MACD.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
// Inclui biblioteca de indicadores técnicos
#include <Indicators/iMA.mqh>

// Define as constantes de período
const int fastPeriod = 12;
const int slowPeriod = 26;
const int signalPeriod = 9;

// Declara as variáveis
double macd[], signal[], histogram[];

// Calcula o MACD
int OnCalculate(const int rates_total,
const int prev_calculated,
const datetime &time[],
const double &open[],
const double &high[],
const double &low[],
const double &close[],
const long &tick_volume[],
const long &volume[],
const int &spread[])
{
// Verifica se há dados suficientes para calcular o MACD
if (rates_total < slowPeriod)
return 0;

// Calcula o MACD e a linha de sinal
iMA(NULL, 0, fastPeriod, 0, MODE_EMA, close, fastPeriod, macd);
iMA(NULL, 0, slowPeriod, 0, MODE_EMA, close, slowPeriod, signal);

// Calcula o histograma
ArraySetAsSeries(histogram, false);
ArraySub(macd, signal, histogram);

// Calcula a média móvel da linha de sinal
iMA(NULL, 0, signalPeriod, 0, MODE_SMA, signal, signalPeriod, signal);

// Retorna o número de barras calculadas
return rates_total;
}