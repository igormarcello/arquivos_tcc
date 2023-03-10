//+------------------------------------------------------------------+
//|                                                           BB.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

// Declaração de variáveis
double upper_band; // Banda superior
double middle_band; // Banda central
double lower_band; // Banda inferior
int period = 10; // Período para cálculo das bandas
double k = 2.0; // Fator de desvio

// Cálculo das bandas
middle_band = iMA(NULL, 0, period, 0, MODE_SMA, PRICE_CLOSE);
upper_band = middle_band + k * iStdDev(NULL, 0, period, 0, MODE_SMA, PRICE_CLOSE);
lower_band = middle_band - k * iStdDev(NULL, 0, period, 0, MODE_SMA, PRICE_CLOSE);