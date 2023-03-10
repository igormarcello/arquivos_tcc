//+------------------------------------------------------------------+
//|                                                          SMA.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#define SMA_PERIOD 10  // Período da SMA

// Calcula a SMA de um título com base em seus preços de fechamento
double sma(int symbol, int timeframe, int period)
{
  double sma_value = 0.0;
  int bars = Bars(symbol, timeframe);
  for (int i = 0; i < period; i++)
  {
    sma_value += Close[bars - i];
  }
  return sma_value / period;
}

// Exemplo de uso
int OnInit()
{
  int symbol = Symbol();  // Obtém o símbolo atual
  int timeframe = Timeframe();  // Obtém o período de tempo atual
  double sma_value = sma(symbol, timeframe, SMA_PERIOD);
  Print("SMA = ", sma_value);  // Exibe o valor da SMA
  return INIT_SUCCEEDED;
}