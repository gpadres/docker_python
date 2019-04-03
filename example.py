#Very simple script as an example
import pandas as pd

print('\n----------------------\nHello world\n----------------------\n')

#Reading data file
df = pd.read_csv('data_in.csv', sep=',', header=0)

print(df)

#
exchange_rate = 1.12

df['USD'] = df.iloc[:,1]*exchange_rate

print('\nApplying an exchange rate of {0} for USD/EUR gives us:'.format(exchange_rate))

print(df)

df.to_csv('data_out.csv', sep=',', header=True, index=False)

print('\nOutput saved! Thank you!\n----------------------\n')
