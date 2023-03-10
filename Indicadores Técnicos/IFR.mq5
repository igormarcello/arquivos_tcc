//+------------------------------------------------------------------+
//|                                                          IFR.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#define RSI_PERIOD 14   // Período para cálculo do RSI
double rsi[];           // Array para armazenar os valores do RSI

// Função para calcular o RSI
double iRSI(int symbol, int timeframe, int period)
{
  double up = 0.0, down = 0.0;
  double avg_up = 0.0, avg_down = 0.0;
  
  for (int i = 0; i < period; i++)
  {
    double diff = iClose(symbol, timeframe, i) - iClose(symbol, timeframe, i+1);
    if (diff > 0)
      up += diff;
    else
      down -= diff;
  }
  
  avg_up = up / period;
  avg_down = down / period;
  
  if (avg_down == 0)
    return 100;
  else
    return 100 - (100 / (1 + (avg_up / avg_down)));
}

// Função principal para calcular o RSI
void OnTick()
{
  int symbol = Symbol();
  int timeframe = Period();
  
  rsi[0] = iRSI(symbol, timeframe, RSI_PERIOD);
}
